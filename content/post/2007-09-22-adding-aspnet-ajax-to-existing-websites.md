---
title: Adding ASP.NET AJAX to Existing Websites
author: Mark Richman
layout: post
date: 2007-09-22T12:27:00+00:00
url: /adding-aspnet-ajax-to-existing-websites/
avada_post_views_count:
  - 582
categories:
  - AJAX
  - ASP.NET

---
If you want to add Microsoft ASP.NET 2.0 AJAX Extensions 1.0 to an existing website&#8230; 

**<a href="http://download.microsoft.com/download/f/7/a/f7adf2b4-6554-4027-bac6-c853bc0a4f9d/HDI-AJAX-AddAjax.wmv" target="_blank">Click here for the video!</a>**&nbsp; 

First, install the ASP.NET AJAX 1.0 Extensions: <a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=ca9d90fa-e8c9-42e3-aa19-08e2c027f5d6&displaylang=en" target="_blank">ASP.NET 2.0 AJAX Extensions 1.0</a>

Next, add some stuff to the web.config file:

In the system.web section add the following line:

&nbsp;&nbsp;&nbsp; <font face="courier new,courier"><pages><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <controls><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <add tagPrefix="asp" namespace="System.Web.UI" assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"/><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </controls><br /> &nbsp;&nbsp;&nbsp; </pages></font>

This will save you having to have the following directive at the top of each page:

<font face="courier new,courier"><%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"<br /> &nbsp;&nbsp;&nbsp; Namespace="System.Web.UI" TagPrefix="asp" %></font>

If you find you are getting the nasty "'Sys' is undefined error on your pages, putting the following into the System.Web section will fix this:

<font face="courier new,courier">&nbsp;&nbsp;&nbsp; <httpHandlers><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <remove verb="*" path="*.asmx"/><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <add verb="*" path="*.asmx" validate="false" type="System.Web.Script.Services.ScriptHandlerFactory, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"/><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <add verb="*" path="*_AppService.axd" validate="false" type="System.Web.Script.Services.ScriptHandlerFactory, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"/><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <add verb="GET,HEAD" path="ScriptResource.axd" type="System.Web.Handlers.ScriptResourceHandler, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" validate="false"/><br /> &nbsp;&nbsp;&nbsp; </httpHandlers></p> 

<p>
  &nbsp;&nbsp;&nbsp; <httpModules><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <add name="ScriptModule" type="System.Web.Handlers.ScriptModule, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"/><br /> &nbsp;&nbsp;&nbsp; </httpModules></font>
</p>

<p>
  Thats it!&nbsp; All you should need to do now is just drop a script manager and update panel on the page and throw the controls you want to AJAX-enable in them and you are locked and loaded.
</p>

<p>
  Thanks to <a href="http://blogs.msdn.com/darrylburling/archive/2007/02/20/adding-asp-net-ajax-to-existing-websites.aspx" target="_blank">Darryl Burling</a> for the tip!
</p>