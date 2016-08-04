---
title: Passing Lists as Parameters to Stored Procedures in SQL Server
author: Mark Richman
layout: post
date: 2013-10-22T17:17:19+00:00
url: /passing-lists-parameters-stored-procedures-sql-server/
slide_template:
  - default
pyre_full_width:
  - no
pyre_sidebar_position:
  - default
pyre_image_rollover_icons:
  - linkzoom
pyre_related_posts:
  - yes
pyre_slider_type:
  - no
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
pyre_header_bg_full:
  - no
pyre_header_bg_repeat:
  - repeat
pyre_page_title:
  - yes
pyre_page_title_text:
  - yes
pyre_page_title_bar_bg_full:
  - default
pyre_page_title_bg_parallax:
  - default
avada_post_views_count:
  - 10726
sbg_selected_sidebar:
  - 'a:1:{i:0;s:1:"0";}'
sbg_selected_sidebar_replacement:
  - 'a:1:{i:0;s:1:"0";}'
categories:
  - SQL

---
There is no good way to do this in SQL Server. Someday they will have an [array datatype like PostgreSQL][1].

In SQL Server 2005 and higher, this can be done using XML, but I don’t particularly see the need for the overhead. Use the function below to split a delimited string and select from the returned table. Its also very helpful for reporting.

<div class="highlight">
  <pre><code class="sql">&lt;span class="lineno"> 1&lt;/span> &lt;span class="k">CREATE&lt;/span> &lt;span class="k">FUNCTION&lt;/span> &lt;span class="p">[&lt;/span>&lt;span class="n">dbo&lt;/span>&lt;span class="p">].[&lt;/span>&lt;span class="n">SplitList&lt;/span>&lt;span class="p">]&lt;/span> &lt;span class="p">(&lt;/span>&lt;span class="o">@&lt;/span>&lt;span class="n">list&lt;/span> &lt;span class="nb">VARCHAR&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="k">MAX&lt;/span>&lt;span class="p">),&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">separator&lt;/span> &lt;span class="nb">VARCHAR&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="k">MAX&lt;/span>&lt;span class="p">)&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="s1">';'&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno"> 2&lt;/span> &lt;span class="k">RETURNS&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="k">table&lt;/span> &lt;span class="k">TABLE&lt;/span> &lt;span class="p">(&lt;/span>&lt;span class="n">Value&lt;/span> &lt;span class="nb">VARCHAR&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="k">MAX&lt;/span>&lt;span class="p">))&lt;/span>
&lt;span class="lineno"> 3&lt;/span> &lt;span class="k">AS&lt;/span> &lt;span class="k">BEGIN&lt;/span>
&lt;span class="lineno"> 4&lt;/span>    &lt;span class="k">DECLARE&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="k">position&lt;/span> &lt;span class="nb">INT&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">previous&lt;/span> &lt;span class="nb">INT&lt;/span>
&lt;span class="lineno"> 5&lt;/span>    &lt;span class="k">SET&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">list&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">list&lt;/span> &lt;span class="o">+&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">separator&lt;/span>
&lt;span class="lineno"> 6&lt;/span>    &lt;span class="k">SET&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">previous&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="mi">1&lt;/span>
&lt;span class="lineno"> 7&lt;/span>    &lt;span class="k">SET&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="k">position&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="n">CHARINDEX&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="o">@&lt;/span>&lt;span class="n">separator&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">list&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno"> 8&lt;/span>    &lt;span class="n">WHILE&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="k">position&lt;/span> &lt;span class="o">&gt;&lt;/span> &lt;span class="mi">0&lt;/span> &lt;span class="k">BEGIN&lt;/span>
&lt;span class="lineno"> 9&lt;/span>       &lt;span class="n">IF&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="k">position&lt;/span> &lt;span class="o">-&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">previous&lt;/span> &lt;span class="o">&gt;&lt;/span> &lt;span class="mi">0&lt;/span>
&lt;span class="lineno">10&lt;/span>          &lt;span class="k">INSERT&lt;/span> &lt;span class="k">INTO&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="k">table&lt;/span> &lt;span class="k">VALUES&lt;/span> &lt;span class="p">(&lt;/span>&lt;span class="k">SUBSTRING&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="o">@&lt;/span>&lt;span class="n">list&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">previous&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="k">position&lt;/span> &lt;span class="o">-&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">previous&lt;/span>&lt;span class="p">))&lt;/span>
&lt;span class="lineno">11&lt;/span>       &lt;span class="n">IF&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="k">position&lt;/span> &lt;span class="o">&gt;=&lt;/span> &lt;span class="n">LEN&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="o">@&lt;/span>&lt;span class="n">list&lt;/span>&lt;span class="p">)&lt;/span> &lt;span class="n">BREAK&lt;/span>
&lt;span class="lineno">12&lt;/span>       &lt;span class="k">SET&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">previous&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="k">position&lt;/span> &lt;span class="o">+&lt;/span> &lt;span class="mi">1&lt;/span>
&lt;span class="lineno">13&lt;/span>       &lt;span class="k">SET&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="k">position&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="n">CHARINDEX&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="o">@&lt;/span>&lt;span class="n">separator&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">list&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">previous&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno">14&lt;/span>    &lt;span class="k">END&lt;/span>
&lt;span class="lineno">15&lt;/span>    &lt;span class="k">RETURN&lt;/span>
&lt;span class="lineno">16&lt;/span> &lt;span class="k">END&lt;/span>
</code></pre>
</div>

To use this function, simply pass your list, and specify the desired delimiter:

<div class="highlight">
  <pre><code class="sql">&lt;span class="k">SELECT&lt;/span> &lt;span class="o">*&lt;/span> &lt;span class="k">FROM&lt;/span> &lt;span class="n">dbo&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="n">SplitList&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="s1">'1,2,3,4,5'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">','&lt;/span>&lt;span class="p">)&lt;/span>
</code></pre>
</div>

This comes in handy when trying to report on, say, all unique customer emails who purchased a subset of SKUs in the past two days:

<div class="highlight">
  <pre><code class="sql">&lt;span class="lineno"> 1&lt;/span> &lt;span class="k">DECLARE&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">tbl&lt;/span> &lt;span class="k">TABLE&lt;/span> &lt;span class="p">(&lt;/span>&lt;span class="n">id&lt;/span> &lt;span class="nb">VARCHAR&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="mi">7&lt;/span>&lt;span class="p">));&lt;/span>
&lt;span class="lineno"> 2&lt;/span> &lt;span class="k">INSERT&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">tbl&lt;/span> &lt;span class="k">SELECT&lt;/span> &lt;span class="o">*&lt;/span> &lt;span class="k">FROM&lt;/span> &lt;span class="n">dbo&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="n">SplitList&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="s1">'SKU1234,SKU2345,SKU3456,SKU4567'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">','&lt;/span>&lt;span class="p">);&lt;/span>
&lt;span class="lineno"> 3&lt;/span> 
&lt;span class="lineno"> 4&lt;/span> &lt;span class="k">SELECT&lt;/span> &lt;span class="k">DISTINCT&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">LTRIM&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">RTRIM&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="k">c&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="n">email&lt;/span>&lt;span class="p">)))&lt;/span>
&lt;span class="lineno"> 5&lt;/span> &lt;span class="k">FROM&lt;/span> &lt;span class="n">CMS&lt;/span> &lt;span class="n">o&lt;/span>
&lt;span class="lineno"> 6&lt;/span> &lt;span class="k">INNER&lt;/span> &lt;span class="k">JOIN&lt;/span> &lt;span class="n">ITEMS&lt;/span> &lt;span class="n">i&lt;/span> &lt;span class="k">ON&lt;/span> &lt;span class="p">(&lt;/span>&lt;span class="n">o&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="n">ORDERNO&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="n">i&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="n">ORDERNO&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno"> 7&lt;/span> &lt;span class="k">INNER&lt;/span> &lt;span class="k">JOIN&lt;/span> &lt;span class="n">CUST&lt;/span> &lt;span class="k">c&lt;/span> &lt;span class="k">ON&lt;/span> &lt;span class="p">(&lt;/span>&lt;span class="k">c&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="n">CUSTNUM&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="n">o&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="n">CUSTNUM&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno"> 8&lt;/span> &lt;span class="k">WHERE&lt;/span> &lt;span class="n">i&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="n">ITEM&lt;/span> &lt;span class="k">IN&lt;/span> &lt;span class="p">(&lt;/span>&lt;span class="k">SELECT&lt;/span> &lt;span class="n">id&lt;/span> &lt;span class="k">FROM&lt;/span> &lt;span class="o">@&lt;/span>&lt;span class="n">tbl&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno"> 9&lt;/span> &lt;span class="k">AND&lt;/span> &lt;span class="n">o&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="n">ODR_DATE&lt;/span> &lt;span class="o">&gt;=&lt;/span> &lt;span class="n">DATEADD&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="k">day&lt;/span>&lt;span class="p">,&lt;/span>&lt;span class="o">-&lt;/span>&lt;span class="mi">2&lt;/span>&lt;span class="p">,&lt;/span>&lt;span class="n">GETDATE&lt;/span>&lt;span class="p">())&lt;/span>
&lt;span class="lineno">10&lt;/span> &lt;span class="k">AND&lt;/span> &lt;span class="n">LEN&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="k">c&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="n">email&lt;/span>&lt;span class="p">)&lt;/span> &lt;span class="o">&gt;&lt;/span> &lt;span class="mi">0&lt;/span>
&lt;span class="lineno">11&lt;/span> &lt;span class="k">AND&lt;/span> &lt;span class="k">c&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="n">email&lt;/span> &lt;span class="k">IS&lt;/span> &lt;span class="k">NOT&lt;/span> &lt;span class="k">NULL&lt;/span>
&lt;span class="lineno">12&lt;/span> &lt;span class="k">AND&lt;/span> &lt;span class="k">c&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="n">email&lt;/span> &lt;span class="k">NOT&lt;/span> &lt;span class="k">LIKE&lt;/span> &lt;span class="s1">'%@example.com'&lt;/span>
</code></pre>
</div>

Why use this technique? Performance. You make one call to the database. For the detractors of this design pattern, I ask: why would it be a bad idea to pass a collection to a stored procedure? Is it a bad idea in .NET to pass a collection as an argument to a method?

 [1]: http://www.postgresql.org/docs/9.1/static/arrays.html