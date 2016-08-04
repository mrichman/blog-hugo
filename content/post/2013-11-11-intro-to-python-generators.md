---
title: Introduction to Python Generators
author: Mark Richman
layout: post
date: 2013-11-11T16:30:24+00:00
url: /intro-to-python-generators/
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
  - 4228
sbg_selected_sidebar:
  - 'a:1:{i:0;s:1:"0";}'
sbg_selected_sidebar_replacement:
  - 'a:1:{i:0;s:1:"0";}'
categories:
  - Python

---
<article itemscope="" itemtype="http://schema.org/BlogPosting" itemprop="blogPost"> 

<div class="headline-wrap">
  <h1 itemprop="name">
    Introduction to Python Generators
  </h1>
  
  <h2>
  </h2></p>
</div>

<!--/ .headline-wrap -->

<div class="article-wrap" itemprop="text">
  <p>
    This article is part two of my series on iterators and generators. If you haven’t read <a href="http://www.markrichman.com/intro-to-python-iterators/">part one</a>, or if you aren’t experienced with iterators in Python, then please <a href="http://www.markrichman.com/intro-to-python-iterators/">start here</a>.
  </p>
  
  <h1 id="what-are-generators">
    What are Generators?
  </h1>
  
  <p>
    Generators (introduced in <a href="http://www.python.org/dev/peps/pep-0255/">PEP 255</a>) extend the concept of iterators. In essence, they are iterators with “intelligence”. A generator function is effectively the <code>next()</code> iterator method, applied to get the next value in a sequence. Unlike regular functions, generators use the <code>yield</code> keyword instead of <code>return</code> and maintain state across multiple calls.
  </p>
  
  <p>
    Generator functions also allow you to pause execution, saving state until you resume execution. Let’s look at a simple example:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="lineno"> 1&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="k">def&lt;/span> &lt;span class="nf">gen&lt;/span>&lt;span class="p">():&lt;/span>
&lt;span class="lineno"> 2&lt;/span> &lt;span class="o">...&lt;/span>     &lt;span class="k">yield&lt;/span> &lt;span class="mi">1&lt;/span>
&lt;span class="lineno"> 3&lt;/span> &lt;span class="o">...&lt;/span>     &lt;span class="k">yield&lt;/span> &lt;span class="mi">2&lt;/span>
&lt;span class="lineno"> 4&lt;/span> &lt;span class="o">...&lt;/span>     &lt;span class="k">yield&lt;/span> &lt;span class="mi">3&lt;/span>
&lt;span class="lineno"> 5&lt;/span> &lt;span class="o">...&lt;/span> 
&lt;span class="lineno"> 6&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="k">for&lt;/span> &lt;span class="n">i&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="n">gen&lt;/span>&lt;span class="p">():&lt;/span> &lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">i&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno"> 7&lt;/span> &lt;span class="o">...&lt;/span> 
&lt;span class="lineno"> 8&lt;/span> &lt;span class="mi">1&lt;/span>
&lt;span class="lineno"> 9&lt;/span> &lt;span class="mi">2&lt;/span>
&lt;span class="lineno">10&lt;/span> &lt;span class="mi">3&lt;/span>
</code></pre>
  </div>
  
  <p>
    If you instantiate the generator function, you can see that a generator object is returned:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">g&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="n">gen&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno">2&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">g&lt;/span>
&lt;span class="lineno">3&lt;/span> &lt;span class="o">&lt;&lt;/span>&lt;span class="n">generator&lt;/span> &lt;span class="nb">object&lt;/span> &lt;span class="n">gen&lt;/span> &lt;span class="n">at&lt;/span> &lt;span class="mh">0x10d345050&lt;/span>&lt;span class="o">&gt;&lt;/span>
&lt;span class="lineno">4&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> 
</code></pre>
  </div>
  
  <p>
    Because generators <strong>implement</strong> the iterator interface, you can repeatedly call <code>next()</code> on <code>g</code> to fetch each value emitted by the successive <code>yield</code> calls:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="lineno"> 1&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno"> 2&lt;/span> &lt;span class="mi">1&lt;/span>
&lt;span class="lineno"> 3&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno"> 4&lt;/span> &lt;span class="mi">2&lt;/span>
&lt;span class="lineno"> 5&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno"> 6&lt;/span> &lt;span class="mi">3&lt;/span>
&lt;span class="lineno"> 7&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno"> 8&lt;/span> &lt;span class="n">Traceback&lt;/span> &lt;span class="p">(&lt;/span>&lt;span class="n">most&lt;/span> &lt;span class="n">recent&lt;/span> &lt;span class="n">call&lt;/span> &lt;span class="n">last&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno"> 9&lt;/span>   &lt;span class="n">File&lt;/span> &lt;span class="s">"&lt;stdin&gt;"&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="n">line&lt;/span> &lt;span class="mi">1&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="o">&lt;&lt;/span>&lt;span class="n">module&lt;/span>&lt;span class="o">&gt;&lt;/span>
&lt;span class="lineno">10&lt;/span> &lt;span class="ne">StopIteration&lt;/span>
</code></pre>
  </div>
  
  <p>
    It is important to note that instantiating a generator <strong>does not</strong> execute the body of the function. Only upon a call to <code>next()</code> (either explicit or implicit) will the generator execute. Each execution returns the next <code>yield</code> and freezes.
  </p>
  
  <p>
    Let’s rewrite the Fibonacci series function from the previous article as a generator:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="lineno"> 1&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="k">def&lt;/span> &lt;span class="nf">fib&lt;/span>&lt;span class="p">():&lt;/span>
&lt;span class="lineno"> 2&lt;/span> &lt;span class="o">...&lt;/span>     &lt;span class="n">x&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="mi">0&lt;/span>
&lt;span class="lineno"> 3&lt;/span> &lt;span class="o">...&lt;/span>     &lt;span class="n">y&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="mi">1&lt;/span>
&lt;span class="lineno"> 4&lt;/span> &lt;span class="o">...&lt;/span>     &lt;span class="k">while&lt;/span> &lt;span class="mi">1&lt;/span>&lt;span class="p">:&lt;/span>
&lt;span class="lineno"> 5&lt;/span> &lt;span class="o">...&lt;/span>         &lt;span class="n">x&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="n">y&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="n">y&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="n">x&lt;/span> &lt;span class="o">+&lt;/span> &lt;span class="n">y&lt;/span>
&lt;span class="lineno"> 6&lt;/span> &lt;span class="o">...&lt;/span>         &lt;span class="k">yield&lt;/span> &lt;span class="n">x&lt;/span>
&lt;span class="lineno"> 7&lt;/span> &lt;span class="o">...&lt;/span> 
&lt;span class="lineno"> 8&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">g&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="n">fib&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno"> 9&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno">10&lt;/span> &lt;span class="mi">1&lt;/span>
&lt;span class="lineno">11&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno">12&lt;/span> &lt;span class="mi">1&lt;/span>
&lt;span class="lineno">13&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno">14&lt;/span> &lt;span class="mi">2&lt;/span>
&lt;span class="lineno">15&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno">16&lt;/span> &lt;span class="mi">3&lt;/span>
&lt;span class="lineno">17&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno">18&lt;/span> &lt;span class="mi">5&lt;/span>
&lt;span class="lineno">19&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno">20&lt;/span> &lt;span class="mi">8&lt;/span>
&lt;span class="lineno">21&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno">22&lt;/span> &lt;span class="mi">13&lt;/span>
&lt;span class="lineno">23&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> 
</code></pre>
  </div>
  
  <p>
    You can see that this generator will work for an any size list:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="lineno"> 1&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">g&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="n">fib&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno"> 2&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="k">for&lt;/span> &lt;span class="n">i&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="nb">range&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="mi">8&lt;/span>&lt;span class="p">):&lt;/span> &lt;span class="k">print&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno"> 3&lt;/span> &lt;span class="o">...&lt;/span> 
&lt;span class="lineno"> 4&lt;/span> &lt;span class="mi">1&lt;/span>
&lt;span class="lineno"> 5&lt;/span> &lt;span class="mi">1&lt;/span>
&lt;span class="lineno"> 6&lt;/span> &lt;span class="mi">2&lt;/span>
&lt;span class="lineno"> 7&lt;/span> &lt;span class="mi">3&lt;/span>
&lt;span class="lineno"> 8&lt;/span> &lt;span class="mi">5&lt;/span>
&lt;span class="lineno"> 9&lt;/span> &lt;span class="mi">8&lt;/span>
&lt;span class="lineno">10&lt;/span> &lt;span class="mi">13&lt;/span>
&lt;span class="lineno">11&lt;/span> &lt;span class="mi">21&lt;/span>
&lt;span class="lineno">12&lt;/span> &lt;span class="o">&gt;&gt;&gt;&lt;/span> 
</code></pre>
  </div>
  
  <h1 id="use-the-schwartz">
    Use the Schwartz
  </h1>
  
  <p>
    <a href="http://www.linkedin.com/pub/philip-schwartz/a/126/a18">Phil</a> challenged me with a generator problem he uses on technical interviews. Here’s the problem:
  </p>
  
  <blockquote>
    <p>
      You have a stream of values that need to be read from a text file. Each line of text contains an integer. The stream is too large to fit in memory all at once. Write a generator to process the stream of values and calculate their sum. Do not use the form of <code>with open(filename) as f:</code> in your solution.
    </p>
  </blockquote>
  
  <p>
    Let’s assume the file <code>data.txt</code> list each integer from 1 through 99,999 as such:
  </p>
  
  <div class="highlight">
    <pre><code class="text">1
2
3
4
5
...
99999
</code></pre>
  </div>
  
  <p>
    We can define a generator function that accepts an arbitrary filename, and <code>yield</code>s each line individually:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="n">In&lt;/span> &lt;span class="p">[&lt;/span>&lt;span class="mi">1&lt;/span>&lt;span class="p">]:&lt;/span> &lt;span class="k">def&lt;/span> &lt;span class="nf">values&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">filename&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">2&lt;/span>    &lt;span class="o">...&lt;/span>&lt;span class="p">:&lt;/span>     &lt;span class="n">f&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="nb">open&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">filename&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s">'r'&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno">3&lt;/span>    &lt;span class="o">...&lt;/span>&lt;span class="p">:&lt;/span>     &lt;span class="k">for&lt;/span> &lt;span class="n">line&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="n">f&lt;/span>&lt;span class="p">:&lt;/span>
&lt;span class="lineno">4&lt;/span>    &lt;span class="o">...&lt;/span>&lt;span class="p">:&lt;/span>         &lt;span class="k">yield&lt;/span> &lt;span class="nb">int&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">line&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno">5&lt;/span>    &lt;span class="o">...&lt;/span>&lt;span class="p">:&lt;/span>         
</code></pre>
  </div>
  
  <p>
    Next, we accumulate the sum from the file <code>data.txt</code>:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="n">In&lt;/span> &lt;span class="p">[&lt;/span>&lt;span class="mi">2&lt;/span>&lt;span class="p">]:&lt;/span> &lt;span class="nb">sum&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="mi">0&lt;/span>
&lt;span class="lineno">2&lt;/span> 
&lt;span class="lineno">3&lt;/span> &lt;span class="n">In&lt;/span> &lt;span class="p">[&lt;/span>&lt;span class="mi">3&lt;/span>&lt;span class="p">]:&lt;/span> &lt;span class="k">for&lt;/span> &lt;span class="n">x&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="n">values&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="s">'data.txt'&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">4&lt;/span>    &lt;span class="o">...&lt;/span>&lt;span class="p">:&lt;/span>     &lt;span class="nb">sum&lt;/span> &lt;span class="o">+=&lt;/span> &lt;span class="n">x&lt;/span>
&lt;span class="lineno">5&lt;/span>    &lt;span class="o">...&lt;/span>&lt;span class="p">:&lt;/span>     
</code></pre>
  </div>
  
  <p>
    And finally, print the sum:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="n">In&lt;/span> &lt;span class="p">[&lt;/span>&lt;span class="mi">4&lt;/span>&lt;span class="p">]:&lt;/span> &lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="nb">sum&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno">2&lt;/span> &lt;span class="mi">4999950000&lt;/span>
</code></pre>
  </div>
  
  <p>
    The power of generators here is that a constant amount of memory is utilized, no matter how large the data set.
  </p>
  
  <p>
    Consider a more complex example, where we want to read a binary file of arbitrary size in chunks, and operate on those chunks:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="k">def&lt;/span> &lt;span class="nf">read_in_chunks&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">file_object&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="n">chunk_size&lt;/span>&lt;span class="o">=&lt;/span>&lt;span class="mi">2048&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">2&lt;/span>     &lt;span class="sd">"""Generator to read a file one chunk at a time.&lt;/span>
&lt;span class="lineno">3&lt;/span> &lt;span class="sd">    Default chunk size: 2KB"""&lt;/span>
&lt;span class="lineno">4&lt;/span>     &lt;span class="k">while&lt;/span> &lt;span class="mi">1&lt;/span>&lt;span class="p">:&lt;/span>
&lt;span class="lineno">5&lt;/span>         &lt;span class="n">data&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="n">file_object&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">read&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">chunk_size&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s">'rb'&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno">6&lt;/span>         &lt;span class="k">if&lt;/span> &lt;span class="ow">not&lt;/span> &lt;span class="n">data&lt;/span>&lt;span class="p">:&lt;/span>
&lt;span class="lineno">7&lt;/span>             &lt;span class="k">break&lt;/span>
&lt;span class="lineno">8&lt;/span>         &lt;span class="k">yield&lt;/span> &lt;span class="n">data&lt;/span>
</code></pre>
  </div>
  
  <p>
    The implementation of <code>process_data()</code> is completely arbitrary &#8211; it could send bytes over a socket connection, for example. Now we can call <code>process_data()</code> on each of these chunks.
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="n">f&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="nb">open&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="s">'alottadata.dat'&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno">2&lt;/span> &lt;span class="k">for&lt;/span> &lt;span class="n">chunk&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="n">read_in_chunks&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">f&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">3&lt;/span>     &lt;span class="n">process_data&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">chunk&lt;/span>&lt;span class="p">)&lt;/span>
</code></pre>
  </div>
  
  <h1 id="generator-expressions">
    Generator Expressions
  </h1>
  
  <p>
    If you’re familiar with <a href="http://docs.python.org/2/tutorial/datastructures.html#list-comprehensions">list comprehensions</a>, then you already know how to use generator expressions! If not, please take a few minutes to <a href="http://docs.python.org/2/tutorial/datastructures.html#list-comprehensions">read up</a>. A generator expression represents a sequence of results without turning it into a concrete list.
  </p>
  
  <p>
    Here is a familiar list comprehension:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="n">In&lt;/span> &lt;span class="p">[&lt;/span>&lt;span class="mi">1&lt;/span>&lt;span class="p">]:&lt;/span> &lt;span class="p">[&lt;/span>&lt;span class="n">x&lt;/span> &lt;span class="k">for&lt;/span> &lt;span class="n">x&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="p">(&lt;/span>&lt;span class="mi">1&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="mi">2&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="mi">3&lt;/span>&lt;span class="p">)]&lt;/span>
&lt;span class="lineno">2&lt;/span> &lt;span class="n">Out&lt;/span>&lt;span class="p">[&lt;/span>&lt;span class="mi">1&lt;/span>&lt;span class="p">]:&lt;/span> &lt;span class="p">[&lt;/span>&lt;span class="mi">1&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="mi">2&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="mi">3&lt;/span>&lt;span class="p">]&lt;/span>
</code></pre>
  </div>
  
  <p>
    We can rewrite this as a generator expression with one simple syntactic change:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="n">In&lt;/span> &lt;span class="p">[&lt;/span>&lt;span class="mi">1&lt;/span>&lt;span class="p">]:&lt;/span> &lt;span class="p">(&lt;/span>&lt;span class="n">x&lt;/span> &lt;span class="k">for&lt;/span> &lt;span class="n">x&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="p">(&lt;/span>&lt;span class="mi">1&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="mi">2&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="mi">3&lt;/span>&lt;span class="p">))&lt;/span>
&lt;span class="lineno">2&lt;/span> &lt;span class="n">Out&lt;/span>&lt;span class="p">[&lt;/span>&lt;span class="mi">1&lt;/span>&lt;span class="p">]:&lt;/span> &lt;span class="o">&lt;&lt;/span>&lt;span class="n">generator&lt;/span> &lt;span class="nb">object&lt;/span> &lt;span class="o">&lt;&lt;/span>&lt;span class="n">genexpr&lt;/span>&lt;span class="o">&gt;&lt;/span> &lt;span class="n">at&lt;/span> &lt;span class="mh">0x10351bf50&lt;/span>&lt;span class="o">&gt;&lt;/span>
</code></pre>
  </div>
  
  <p>
    Now, we can iterate as expected:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="lineno"> 1&lt;/span> &lt;span class="n">In&lt;/span> &lt;span class="p">[&lt;/span>&lt;span class="mi">2&lt;/span>&lt;span class="p">]:&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno"> 2&lt;/span> &lt;span class="n">Out&lt;/span>&lt;span class="p">[&lt;/span>&lt;span class="mi">2&lt;/span>&lt;span class="p">]:&lt;/span> &lt;span class="mi">1&lt;/span>
&lt;span class="lineno"> 3&lt;/span> 
&lt;span class="lineno"> 4&lt;/span> &lt;span class="n">In&lt;/span> &lt;span class="p">[&lt;/span>&lt;span class="mi">3&lt;/span>&lt;span class="p">]:&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno"> 5&lt;/span> &lt;span class="n">Out&lt;/span>&lt;span class="p">[&lt;/span>&lt;span class="mi">3&lt;/span>&lt;span class="p">]:&lt;/span> &lt;span class="mi">2&lt;/span>
&lt;span class="lineno"> 6&lt;/span> 
&lt;span class="lineno"> 7&lt;/span> &lt;span class="n">In&lt;/span> &lt;span class="p">[&lt;/span>&lt;span class="mi">4&lt;/span>&lt;span class="p">]:&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno"> 8&lt;/span> &lt;span class="n">Out&lt;/span>&lt;span class="p">[&lt;/span>&lt;span class="mi">4&lt;/span>&lt;span class="p">]:&lt;/span> &lt;span class="mi">3&lt;/span>
&lt;span class="lineno"> 9&lt;/span> 
&lt;span class="lineno">10&lt;/span> &lt;span class="n">In&lt;/span> &lt;span class="p">[&lt;/span>&lt;span class="mi">5&lt;/span>&lt;span class="p">]:&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno">11&lt;/span> &lt;span class="o">---------------------------------------------------------------------------&lt;/span>
&lt;span class="lineno">12&lt;/span> &lt;span class="ne">StopIteration&lt;/span>                             &lt;span class="n">Traceback&lt;/span> &lt;span class="p">(&lt;/span>&lt;span class="n">most&lt;/span> &lt;span class="n">recent&lt;/span> &lt;span class="n">call&lt;/span> &lt;span class="n">last&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno">13&lt;/span> &lt;span class="o">&lt;&lt;/span>&lt;span class="n">ipython&lt;/span>&lt;span class="o">-&lt;/span>&lt;span class="nb">input&lt;/span>&lt;span class="o">-&lt;/span>&lt;span class="mi">16&lt;/span>&lt;span class="o">-&lt;/span>&lt;span class="n">d7e53364a9a7&lt;/span>&lt;span class="o">&gt;&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="o">&lt;&lt;/span>&lt;span class="n">module&lt;/span>&lt;span class="o">&gt;&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno">14&lt;/span> &lt;span class="o">----&gt;&lt;/span> &lt;span class="mi">1&lt;/span> &lt;span class="n">g&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno">15&lt;/span> 
&lt;span class="lineno">16&lt;/span> &lt;span class="ne">StopIteration&lt;/span>&lt;span class="p">:&lt;/span> 
</code></pre>
  </div>
  
  <p>
    Generator expressions can be use in place of generator functions. For example:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="nb">sum&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">x&lt;/span>&lt;span class="o">**&lt;/span>&lt;span class="mi">2&lt;/span> &lt;span class="k">for&lt;/span> &lt;span class="n">x&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="nb">range&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="mi">1&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="mi">11&lt;/span>&lt;span class="p">))&lt;/span>
</code></pre>
  </div>
  
  <p>
    This calls the built-in function <code>sum()</code> with as its argument a generator expression that yields the squares of the numbers from 1 through 10 inclusive. The <code>sum()</code> function adds up the values in its argument resulting in an answer of 385. The advantage over <code>sum([x**2 for x in range(1, 11)])</code> should be obvious. The latter creates a list containing all the squares, which is then iterated over <strong>once</strong> before it is thrown away. For large collections, these savings in memory usage are an important consideration.
  </p>
  
  <h1 id="conclusion">
    Conclusion
  </h1>
  
  <p>
    You can see how generators can be used for <em>lazy evaluation</em> and for calculating large sets of results. Use generators to minimize memory allocation, and allows the caller to get started processing the first few values immediately. In short, a generator looks like a function but behaves like an iterator.
  </p>
  
  <p>
    Please read on to <a href="http://www.markrichman.com/intro-to-python-decorators/">Introduction to Python Decorators</a>.
  </p></article>