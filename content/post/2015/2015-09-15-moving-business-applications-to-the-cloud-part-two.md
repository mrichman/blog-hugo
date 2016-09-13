---
title: 'Moving Business Applications to the Cloud – Part Two – Cloud Migration Strategies & Challenges'
author: Mark Richman
layout: post
date: 2015-09-15T11:31:11+00:00
url: /moving-business-applications-to-the-cloud-part-two/
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
  - 507
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
  - Newsletter

---
<span style="font-weight: 400;">In my <a href="http://www.markrichman.com/moving-business-applications-to-the-cloud-part-one/">previous article</a>, we examined the business drivers for a cloud migration. Next, let’s look at some strategies for success, and some common challenges when moving and IT organization to the cloud. </span>

<span style="font-weight: 400;">There isn’t just one path to the cloud. When planning migrations with my clients, I present a number of proven options, with a focus on not only minimizing downtime, but also a path to growth. Most migration plans fall into one of three categories: Forklift, Refactor, or Rebuild. Let’s dive into each&#8230;</span>

## **Forklift**

<span style="font-weight: 400;">The forklift strategy is generally the most popular. This is the least complex, as it simply involves copying the existing software as-is to a cloud service provider, often to a simple Virtual Private Server (VPS). None of the scalability and elasticity of the new infrastructure is leveraged, and this is essentially virtual colocation. Keep in mind that differences in the cloud environment will require attention to some areas such as network connectivity, authentication, and monitoring.</span>

<span style="font-weight: 400;">Many of my clients select this option simply due to lack of internal resources or experience rearchitecting applications for a more sophisticated cloud environment. I often help clients design and plan for elasticity, security, and high availability in a cloud infrastructure.</span>

## **Refactor**

<span style="font-weight: 400;">Refactoring involves programmatic changes to software in order to take advantage of Infrastructure-as-a-Service (IaaS) or Platform-as-a-Service (PaaS) cloud environments. The most common application changes I make with clients involve application state. Very often, applications will hold client session data in local memory, making it impossible for subsequent requests to visit another server in the environment. This prevents both scalability and availability. </span>

<span style="font-weight: 400;">For large-scale e-commerce applications, these concerns becomes critical, as adding front-end web server instances improves response times, as well as scalability and availability. The business case for this refactoring is clear; minimizing response times improve not only search engine rankings, but also conversion rates.</span>

<span style="font-weight: 400;">Other refactorings might involve the integration of a Content Distribution Network (CDN), offered by some cloud service providers. Amazon CloudFront, Akamai, EdgeCast, and Limelight are some examples. A CDN will allow applications to serve content, such as static web pages and images, to users with greater performance and reliability. It can also greatly reduce incremental bandwidth usage fees.</span>

## **Rebuild**

<span style="font-weight: 400;">Many legacy applications simply don’t port well to the cloud. I’ve worked with many companies whose custom line-of-business applications are too archaic to move. Some might rely on an unsupported operating system, application framework, or other defunct technology. Others might require integration with other on-premise systems that also don’t easily move to the cloud. These applications are candidates for a wholesale rewrite.</span>

## **Challenges**

<span style="font-weight: 400;">While a brand new cloud-native system might sound attractive, there are some potential risks and disadvantages to consider. The primary concern here is the additional capital costs involved in rewriting an application from scratch. Sometimes existing application components can be reused, but these are typically limited to business logic, and are usually thrown away in deference to newer technologies. </span>

<span style="font-weight: 400;">Another risk is vendor lock-in. Choosing cloud-native infrastructure and services will serve you well, but I caution using vendor-proprietary services. I usually recommend open source solutions and services that are available across vendors. This allows an easier migration between cloud service providers, in order to take advantage of future innovations that one provider may not yet offer. Also, given the “here today, gone tomorrow” nature of the industry, selecting technology proprietary to a specific cloud vendor is a risk to consider avoiding.</span>

<span style="font-weight: 400;">Finally, consider the organizational changes a migration to the cloud may necessitate. For some, this may involve training to acquire new skills. Individual positions may need to be eliminated, as legacy applications are replaced, and their maintenance becomes unnecessary. Some organizations will eliminate entire departments, save perhaps for a minimal support staff, as the on-premise datacenter is obsoleted.</span>

## **The Cloud CIO**

<span style="font-weight: 400;">As the need for on-premise infrastructure management wanes, CIOs will also shift their focus from implementer to vendor manager. This could be a welcome change for many CIOs, who often long for more time to enjoy their role as a business leader and strategist. </span>

<span style="font-weight: 400;">In your role as a business leader, how are you using the cloud to create value?</span>