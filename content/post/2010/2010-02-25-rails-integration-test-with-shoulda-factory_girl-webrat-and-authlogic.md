---
title: Rails Integration Test with shoulda, factory_girl, webrat, and authlogic
author: Mark Richman
layout: post
date: 2010-02-25T20:22:11+00:00
url: /rails-integration-test-with-shoulda-factory_girl-webrat-and-authlogic/
avada_post_views_count:
  - 1146
categories:
  - rails
  - ruby
tags:
  - rails

---
I had some issues trying to use a symbol

<pre>session[:user_credentials_id]</pre>

vs. a string 

<pre>session["user_credentials_id"]</pre>

Here is my solution:

<pre>require 'test_helper'

class LoginTest &lt; ActionController::IntegrationTest
  context 'A user' do
    setup do
      @user = Factory(:user)
      # puts @user.inspect    
    end

    should 'be able to login with a valid username and password' do
      visit '/user_session/new'
      assert_equal '/user_session/new', path
      fill_in 'Login', :with => @user.login
      fill_in 'Password', :with => @user.password
      click_button 'Login'
      # puts "user.id: #{@user.id}" 
      # puts "session: #{session.inspect}"
      # puts "session[:user_credentials_id] #{session["user_credentials_id"]}"
      assert_equal @user.id, session["user_credentials_id"]
    end

    should 'be denied access with an invalid username or password' do
      visit '/user_session/new'
      assert_equal '/user_session/new', path
      fill_in 'Login', :with => @user.login
      fill_in 'Password', :with => 'wrongpassord'
      click_button 'Login'
      assert_nil session["user_credentials_id"]
    end

  end
end
</pre>