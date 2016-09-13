---
title: Amazon’s Outage and your Customers
author: Mark Richman
layout: post
date: 2015-09-21T16:13:03+00:00
url: /amazons-outage-and-your-customers/
fusion_builder_status:
  - inactive
pyre_show_first_featured_image:
  - no
pyre_portfolio_width_100:
  - no
pyre_image_rollover_icons:
  - default
pyre_post_links_target:
  - no
pyre_related_posts:
  - default
pyre_share_box:
  - default
pyre_post_pagination:
  - default
pyre_author_info:
  - default
pyre_post_meta:
  - default
pyre_post_comments:
  - default
pyre_slider_position:
  - default
pyre_slider_type:
  - no
pyre_avada_rev_styles:
  - default
pyre_display_header:
  - yes
pyre_header_100_width:
  - default
pyre_header_bg_full:
  - no
pyre_header_bg_repeat:
  - repeat
pyre_displayed_menu:
  - default
pyre_display_footer:
  - default
pyre_display_copyright:
  - default
pyre_footer_100_width:
  - default
pyre_sidebar_position:
  - default
pyre_page_bg_layout:
  - default
pyre_page_bg_full:
  - no
pyre_page_bg_repeat:
  - repeat
pyre_wide_page_bg_full:
  - no
pyre_wide_page_bg_repeat:
  - repeat
pyre_page_title:
  - default
pyre_page_title_text:
  - default
pyre_page_title_text_alignment:
  - default
pyre_page_title_100_width:
  - default
pyre_page_title_bar_bg_full:
  - default
pyre_page_title_bg_parallax:
  - default
pyre_page_title_breadcrumbs_search_bar:
  - default
avada_post_views_count:
  - 619
sbg_selected_sidebar:
  - 'a:1:{i:0;s:1:"0";}'
sbg_selected_sidebar_replacement:
  - 'a:1:{i:0;s:12:"Blog Sidebar";}'
sbg_selected_sidebar_2:
  - 'a:1:{i:0;s:1:"0";}'
sbg_selected_sidebar_2_replacement:
  - 'a:1:{i:0;s:0:"";}'
categories:
  - Cloud
  - consulting
  - e-commerce
  - marketing
  - Newsletter

---
This past Sunday around 6am ET, <a href="http://aws.amazon.com/" target="_blank">Amazon Web Services</a> had a mega outage, affecting millions of customers worldwide. Amazon Web Services (AWS) is Amazon&#8217;s global cloud computing infrastructure business unit. AWS powers many popular websites including Netflix, Pinterest, Expedia, IMDB, Reddit, and more. Many of my own clients rely on AWS services.

Multiple AWS systems failed simultaneously: DynamoDB, Cognito, and CloudWatch. The latter, CloudWatch, is Amazon&#8217;s own cloud monitoring platform. So, the system used to monitor their own cloud went offline, unable to alert on its offline status. Everyone assumed things were humming along until applications relying on AWS services began to fail.

More and more Software-as-a-Service (SaaS) companies rely on cloud hosting providers like AWS for their infrastructure. When an outage strikes, it&#8217;s not localized like the power company. The whole world feels it.

One popular service in my area is <a href="https://www.shipt.com/" target="_blank">Shipt</a>, an on-demand grocery delivery service, which uses AWS. Customers were able to place orders, but never received their groceries. Shipt started receiving lots of angry Facebook messages, tweets, and emails. Nobody was manning the phones at 6am on a Sunday.

The outage was resolved after several hours, but most end customers were unaware of the root cause of their favorite sites&#8217; downtime.

I think customers understand that websites can go down. They just don&#8217;t want to be surprised. Sunday&#8217;s event was about lack of information. When you have to Google news sites to see if a website or app is having problems, that&#8217;s a problem.

SaaS companies, like the ones affected by AWS&#8217;s outage, are generally powerless to resolve underlying issues with their cloud provider. So, they need to be far more proactive in customer notification when problems arise.

There&#8217;s nothing more embarrassing and trust-killing than finding out from your customers that your website is having problems.

I&#8217;ve implemented many third-party and custom monitoring solutions for my clients. One client, a $400M online retailer, had frequent issues with its infrastructure provider, and I delivered a monitoring solution that would notify the marketing team of outages. They could quickly get in front of the issue by posting a notice on the website of checkout issues, and were on call to respond to social media inquiries. This one change stopped most customer service calls, and rebuilt trust with customers.

Acquiring new customers is far more expensive than keeping existing ones. Online businesses should focus on how proactively they handle outages. The customers will trust you and stick around.

What steps are you taking to respond to outages and build trust?

_Postscript: As I write this, Skype is offline globally most of the day._

© 2015 Mark Richman. All Rights Reserved.