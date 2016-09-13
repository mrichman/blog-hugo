---
title: Deploying Rails Apps with Capistrano, Git, and Passenger
author: Mark Richman
layout: post
date: 2008-08-21T00:15:51+00:00
url: /deploying-rails-apps-with-capistrano-git-and-passenger/
dsq_thread_id:
  - 92517625
avada_post_views_count:
  - 651
categories:
  - git
  - rails
tags:
  - apache
  - capistrano
  - git
  - passenger
  - rails
  - ruby
  - rubyonrails

---
I host my sites on an Ubuntu VPS. I use a combination of <a href="http://www.rubyonrails.com/" target="_blank">Rails</a>, <a href="http://httpd.apache.org/" target="_blank">Apache2</a>, <a href="http://www.modrails.com/" target="_blank">Phusion Passenger</a>, <a href="http://git.or.cz/" target="_blank">Git</a>, and <a href="http://www.mysql.com/" target="_blank">MySQL</a>. I have a pretty useful <a href="http://www.capify.org/" target="_blank">Capistrano</a> deploy.rb if you have a similar configuration. I&#8217;d love some feedback, as I promised to assist <a href="http://weblog.jamisbuck.org/" target="_blank">Jamis Buck</a> in his Capistrano documentation efforts.