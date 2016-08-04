---
title: 'Ruby on Rails: Adding XSL Processing Instruction with to_xml'
author: Mark Richman
layout: post
date: 2008-08-09T18:35:14+00:00
url: /ruby-on-rails-adding-xsl-processing-instruction-with-to_xml/
dsq_thread_id:
  - 92495846
avada_post_views_count:
  - 599
categories:
  - rails
tags:
  - rails
  - ruby
  - rubyonrails
  - xml
  - xsl

---
Style Sheets can be associated with an XML document by using a processing instruction whose target is `xml-stylesheet`. It looks something like this:

<pre>&lt;?xml version="1.0" encoding="ISO-8859-1"?&gt;
<span style="color: red;">&lt;?xml-stylesheet type="text/xsl" href="something.xsl"?&gt;</span></pre>

How do we get to_xml to render the XSL processing instruction? Put this in your controller: