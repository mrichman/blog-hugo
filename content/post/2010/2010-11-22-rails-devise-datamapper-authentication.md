---
title: Rails Custom Authentication using Devise, DataMapper, and a Legacy Database
author: Mark Richman
layout: post
date: 2010-11-22T16:03:24+00:00
url: /rails-devise-datamapper-authentication/
dsq_thread_id:
  - 177459851
avada_post_views_count:
  - 45308
categories:
  - rails
  - ruby
tags:
  - authentication
  - datamapper
  - devise
  - rails
  - ruby
  - rubyonrails
  - security

---
ActiveRecord is great if your database schema evolves along with your web app from birth, but not all of us have this luxury. Many of us live in the world of corporate IT – a world of legacy databases and bureaucracies that make getting a Rails app into production hard enough, let alone getting a new schema into production. [DataMapper][1] is a common alternative ORM to use for these scenarios. DataMapper is ideally suited for legacy databases, as [Martin Gamsjaeger][2] describes:

  * DataMapper allows you to map meaningful model and property names to cryptic legacy table and column naming conventions. It allows you to do so either on a per model/property, or an app wide basis.

  * DataMapper supports lazy properties that will only be fetched when actually accessed.

  * DataMapper has seamless support for composite primary keys.

  * DataMapper only cares about the properties (columns) you explicitly declare in your models. Other columns will never be touched or read.

  * DataMapper works nicely with foreign key constraints in your database and with the help of dm-constraints it also supports creating them.

There&#8217;s some relevant documentation on <http://datamapper.org/docs/legacy> too.

I’m not going into depths with DM in this article; there are plenty of tutorials out there. What I am going to demonstrate is how to live with a legacy database written for an app with a horribly insecure authentication mechanism, based on a schema whose table and column names don’t match their Rails Model counterparts.

Here’s our User model:

<pre>class User
  include DataMapper::Resource
  include DataMapper::MassAssignmentSecurity

  devise :database_authenticatable, :authentication_keys =&gt; [:username]
  storage_names[:default] = 'legacy_User_table'

  property :id,                 Serial,  :field =&gt; 'UserId',           :required =&gt; true
  property :username,           String,  :field =&gt; 'LoginId',          :required =&gt; true
  property :encrypted_password, String,  :field =&gt; 'PasswordSHA1Hash', :required =&gt; true
  property :enabled,            Integer, :field =&gt; 'Enabled',          :required =&gt; true
  property :is_admin,           Integer, :field =&gt; 'IsSuperAdmin',     :required =&gt; true
  property :first_name,         String,  :field =&gt; 'Name',             :required =&gt; true
  property :last_name,          String,  :field =&gt; 'Surname',          :required =&gt; true

  attr_accessible :username, :password, :password_confirmation

  def password_salt=(password_salt)
  end

  def password_salt
  end

  def password_digest(password)
    self.class.encryptor_class.digest(password)
  end

end
</pre>

You’ll notice this model overrides :authentication\_keys, using :username instead of :email. I also map the table name to ‘legacy\_Users_table’ since we don’t have a conveniently named ‘users’ table in our schema. Our password in this monstrosity is stored as an unsalted SHA1 hash, which then gets Base64-encoded. Really secure, huh?

For Devise to work with unsalted passwords, I’ve had to override the password\_salt functions and the password digest function that Devise looks for. Here, this lives in a custom Devise encryptor class, which I define in an initializer called devise\_encryptor.rb:

<pre>module Devise
  module Encryptors
    class Sha1base64 &lt; Base

      def self.digest(password)
        sha1 = Digest::SHA1.digest(password)
        Base64.strict_encode64(sha1)
      end

      def self.salt(username)
        nil
      end

    end
  end
end
</pre>

This encryptor takes the password, short-circuits the salt function, and returns the Base64-encoded SHA1 hash. There are a couple of configuration changes needed to wire this up. In /initializers/devise.rb, set:

<pre>config.encryptor = :sha1base64
</pre>

This will reference the above custom encryptor class name.

There is one last workaround we have to apply to get the password_salt override in our user model to work. From the [Devise source code][3]: we have to tell Devise **not** to apply the schema in ORMs where the Devise declaration and schema belongs to the same class (as Datamapper and Mongoid). This goes inside devise.rb, in the Devise.config block, and is courtesy of Jared Morgan in the DataMapper mailing list:

<pre>config.apply_schema = false
</pre>

The last change you’ll make is in the devise sign_in view, which you likely generated using rails g devise:views. Use the :username instead of :email for your login credentials:

<pre>&lt;%= f.label :username %&gt; &lt;%= f.text_field :username %&gt;</pre>

If all goes well, you’ll now be able to log into your shiny new Rails app, backended by a steaming pile of crap designed and maintained by monkeys.

 [1]: http://datamapper.org/
 [2]: http://sick.snusnu.info/
 [3]: https://github.com/plataformatec/devise/blob/master/lib/devise.rb