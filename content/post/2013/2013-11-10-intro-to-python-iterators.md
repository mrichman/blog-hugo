---
title: Introduction to Python Iterators
author: Mark Richman
layout: post
date: 2013-11-10T16:24:07+00:00
url: /intro-to-python-iterators/
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
  - 874
sbg_selected_sidebar:
  - 'a:1:{i:0;s:1:"0";}'
sbg_selected_sidebar_replacement:
  - 'a:1:{i:0;s:1:"0";}'
categories:
  - Python

---
<article itemprop="blogPost" itemscope="" itemtype="http://schema.org/BlogPosting"> 

<div class="headline-wrap">
  <h1 itemprop="name">
    Introduction to Python Iterators
  </h1>
  
  <h2>
  </h2>
</div>

<!--/ .headline-wrap -->

<div class="article-wrap" itemprop="text">
  <p>
    While at our monthly South Florida Python meetup (which has exactly two members, <a href="http://www.linkedin.com/pub/philip-schwartz/a/126/a18">Philip Schwartz</a> and myself), the topic of iterators and generators came up. These are two core idioms in Python, and are even more ubiquitous in Python 3. However, they are often poorly understood. This introduction will be part one of a series on Python iterators and generators.
  </p>
  
  <p>
    An iterator is an object that allows you to traverse a sequence of data such as a list, dictionary, or tuple, for example. It also works with files.
  </p>
  
  <p>
    Let’s see how iterators work.
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="n">numbers&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="p">[&lt;/span>&lt;span class="mi">1&lt;/span>&lt;span class="p">,&lt;/span>&lt;span class="mi">2&lt;/span>&lt;span class="p">,&lt;/span>&lt;span class="mi">3&lt;/span>&lt;span class="p">,&lt;/span>&lt;span class="mi">4&lt;/span>&lt;span class="p">,&lt;/span>&lt;span class="mi">5&lt;/span>&lt;span class="p">]&lt;/span>
&lt;span class="k">for&lt;/span> &lt;span class="n">number&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="n">numbers&lt;/span>&lt;span class="p">:&lt;/span>
    &lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">number&lt;/span>&lt;span class="p">)&lt;/span>
</code></pre>
  </div>
  
  <p>
    While the for loop is controlling the iterations, the iterator itself is controlling the traversal of the list.
  </p>
  
  <h2 id="creating-an-iterator">
    Creating an Iterator
  </h2>
  
  <p>
    Create a simple list object:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="n">numbers&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="p">[&lt;/span>&lt;span class="mi">1&lt;/span>&lt;span class="p">,&lt;/span>&lt;span class="mi">2&lt;/span>&lt;span class="p">,&lt;/span>&lt;span class="mi">3&lt;/span>&lt;span class="p">]&lt;/span>
</code></pre>
  </div>
  
  <p>
    to create an <em>explicit</em> iterator, we create a variable and call <code>iter()</code> on the list
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="n">it&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="nb">iter&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">numbers&lt;/span>&lt;span class="p">)&lt;/span>
</code></pre>
  </div>
  
  <p>
    We now have a <code>it</code> tied to the iterator of the <code>numbers</code> list.
  </p>
  
  <p>
    Iterators follow a <a href="http://docs.python.org/2/library/stdtypes.html?highlight=__iter__#container.__iter__">protocol</a> based on two methods: <code>__iter__()</code> and <code>next()</code>. Internally, calling <code>X.__iter__()</code> is equivalent to calling <code>iter(X)</code>. To access the first element of the list, use the <code>next()</code> function:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">it&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">next&lt;/span>&lt;span class="p">())&lt;/span>
</code></pre>
  </div>
  
  <p>
    <em>Note: If you are using Python 3, iterators will use <code>X.__next__()</code> instead of <code>X.next()</code>.</em>
  </p>
  
  <p>
    This is somewhat awkward, so we can use the <code>next(X)</code> function on the iterator itself:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="nb">next&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">it&lt;/span>&lt;span class="p">))&lt;/span>
</code></pre>
  </div>
  
  <p>
    The <code>next(X)</code> function is not only simpler, it is version-neutral, remaing compatible between Python 2.x and 3.x.
  </p>
  
  <p>
    Move through the list by repeatedly calling <code>next(it)</code>. If you try to iterate past the end of the list, you’ll get a <a href="http://docs.python.org/2/library/exceptions.html#exceptions.StopIteration"><code>StopIteration</code></a> exception. The implicit iterators, such as the for loop, are implemented to stop before the <a href="http://docs.python.org/2/library/exceptions.html#exceptions.StopIteration"><code>StopIteration</code></a> exception is thrown.
  </p>
  
  <p>
    Files are handled the same way as lists. In this case, the file object itself is an iterator:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="n">fit&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="nb">open&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="s">'data.txt'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s">'r'&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="nb">next&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">fit&lt;/span>&lt;span class="p">))&lt;/span>
</code></pre>
  </div>
  
  <p>
    This prints the first line of data.txt. Because a file object is an iterator, we can call <code>next()</code> on it.
  </p>
  
  <h2 id="iterators-and-dictionaries">
    Iterators and Dictionaries
  </h2>
  
  <p>
    If you’re coming from another procedural programming language, you might iterate over a dictionary (or hash) as follows:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="n">ages&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="p">{&lt;/span>&lt;span class="s">'Mark'&lt;/span>&lt;span class="p">:&lt;/span> &lt;span class="mi">40&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s">'Phil'&lt;/span>&lt;span class="p">:&lt;/span> &lt;span class="mi">30&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s">'Bob'&lt;/span>&lt;span class="p">:&lt;/span> &lt;span class="mi">65&lt;/span>&lt;span class="p">}&lt;/span>
&lt;span class="k">for&lt;/span> &lt;span class="n">key&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="n">ages&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">keys&lt;/span>&lt;span class="p">():&lt;/span>
    &lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">key&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="n">ages&lt;/span>&lt;span class="p">[&lt;/span>&lt;span class="n">key&lt;/span>&lt;span class="p">])&lt;/span>	 
</code></pre>
  </div>
  
  <p>
    This will print the key (name) and value (age) for each pair in the dictionary. You will see in a minute that Python has a more elegant and intuitive approach than the loop-over-index implementation above.
  </p>
  
  <p>
    So, how does this work, since dictionaries are more complex than lists? Let’s create an iterator over the dictionary and see:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="n">it&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="nb">iter&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">ages&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="nb">next&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">it&lt;/span>&lt;span class="p">))&lt;/span>
</code></pre>
  </div>
  
  <p>
    This prints the first key. Note that subsequent calls to <code>next()</code> will not necessarily return the keys in the order in which they were defined. This is because dictionaries are inherently unsorted.
  </p>
  
  <p>
    Having an iterator for a dictionary now allows you to simplify the previous for loop:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="k">for&lt;/span> &lt;span class="n">key&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="n">ages&lt;/span>&lt;span class="p">:&lt;/span>
    &lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">key&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="n">ages&lt;/span>&lt;span class="p">[&lt;/span>&lt;span class="n">key&lt;/span>&lt;span class="p">])&lt;/span>
</code></pre>
  </div>
  
  <h2 id="other-iterators">
    Other Iterators
  </h2>
  
  <p>
    Iterators work with various Python datatypes. For example, with <code>range</code>:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="n">numbers&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="nb">range&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="mi">1&lt;/span>&lt;span class="p">,&lt;/span>&lt;span class="mi">10&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="n">it&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="nb">iter&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">numbers&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="nb">next&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">it&lt;/span>&lt;span class="p">))&lt;/span>
</code></pre>
  </div>
  
  <p>
    Same pattern as before with lists or dictionaries
  </p>
  
  <p>
    What about more complicated data sources? Let’s look at the filesystem, for example:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="kn">import&lt;/span> &lt;span class="nn">os&lt;/span>

&lt;span class="n">files&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="n">os&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">popen&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="s">'ls *.py'&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="n">fit&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="nb">iter&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">files&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="nb">next&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">fit&lt;/span>&lt;span class="p">))&lt;/span>
</code></pre>
  </div>
  
  <p>
    This will print the first filename, ending in .py, in the current directory. Again, this is the same pattern shown previously, and we can apply a for loop to the iterator:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="kn">import&lt;/span> &lt;span class="nn">os&lt;/span>

&lt;span class="n">files&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="n">os&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">popen&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="s">'ls *.py'&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="k">for&lt;/span> &lt;span class="nb">file&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="n">files&lt;/span>&lt;span class="p">:&lt;/span>
    &lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="nb">file&lt;/span>&lt;span class="p">)&lt;/span>
</code></pre>
  </div>
  
  <p>
    To be even more terse, we can do this:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="kn">import&lt;/span> &lt;span class="nn">os&lt;/span>

&lt;span class="k">for&lt;/span> &lt;span class="nb">file&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="n">os&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">popen&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="s">'ls *.py'&lt;/span>&lt;span class="p">):&lt;/span>
    &lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="nb">file&lt;/span>&lt;span class="p">)&lt;/span>
</code></pre>
  </div>
  
  <p>
    Iterators also work with tuples. Let’s do something a bit more interesting than just a sequence of single values. We can define a square by its points’ cartesian coordinates:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="n">square&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="p">((&lt;/span>&lt;span class="mi">10&lt;/span>&lt;span class="p">,&lt;/span>&lt;span class="mi">8&lt;/span>&lt;span class="p">),&lt;/span> &lt;span class="p">(&lt;/span>&lt;span class="mi">10&lt;/span>&lt;span class="p">,&lt;/span>&lt;span class="mi">23&lt;/span>&lt;span class="p">),&lt;/span> &lt;span class="p">(&lt;/span>&lt;span class="mi">25&lt;/span>&lt;span class="p">,&lt;/span>&lt;span class="mi">23&lt;/span>&lt;span class="p">),&lt;/span> &lt;span class="p">(&lt;/span>&lt;span class="mi">25&lt;/span>&lt;span class="p">,&lt;/span>&lt;span class="mi">8&lt;/span>&lt;span class="p">))&lt;/span>
</code></pre>
  </div>
  
  <p>
    We can use an iterator on square to retrieve these four coordinate values:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="n">sit&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="nb">iter&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">square&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="nb">next&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">sit&lt;/span>&lt;span class="p">))&lt;/span>
&lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="nb">next&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">sit&lt;/span>&lt;span class="p">))&lt;/span>
&lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="nb">next&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">sit&lt;/span>&lt;span class="p">))&lt;/span>
&lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="nb">next&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">sit&lt;/span>&lt;span class="p">))&lt;/span>
</code></pre>
  </div>
  
  <p>
    You can probably guess by now that this can be done more easily with a for loop:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="k">for&lt;/span> &lt;span class="n">point&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="n">square&lt;/span>&lt;span class="p">:&lt;/span>
    &lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">point&lt;/span>&lt;span class="p">)&lt;/span>
</code></pre>
  </div>
  
  <h2 id="custom-iterators">
    Custom Iterators
  </h2>
  
  <p>
    Iterators are not limited to native Python datatypes. You can create iterators for your own custom classes as well. Simply follow the protocol explained earlier, implmenting <code>__iter__()</code> and <code>next()</code> (or <code>__next__()</code> in Python 3.x).
  </p>
  
  <p>
    For example, we can create an iterator for a class that encapulates the <a href="http://en.wikipedia.org/wiki/Fibonacci_number">Fibonacci series</a>:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="lineno"> 1&lt;/span> &lt;span class="k">class&lt;/span> &lt;span class="nc">Fib&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="nb">object&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno"> 2&lt;/span>     &lt;span class="sd">'''iterator that yields numbers in the Fibonacci series'''&lt;/span>
&lt;span class="lineno"> 3&lt;/span> 
&lt;span class="lineno"> 4&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">__init__&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="bp">self&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="nb">max&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno"> 5&lt;/span>         &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">max&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="nb">max&lt;/span>
&lt;span class="lineno"> 6&lt;/span> 
&lt;span class="lineno"> 7&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">__iter__&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="bp">self&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno"> 8&lt;/span>         &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">a&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="mi">0&lt;/span>
&lt;span class="lineno"> 9&lt;/span>         &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">b&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="mi">1&lt;/span>
&lt;span class="lineno">10&lt;/span>         &lt;span class="k">return&lt;/span> &lt;span class="bp">self&lt;/span>
&lt;span class="lineno">11&lt;/span> 
&lt;span class="lineno">12&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">next&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="bp">self&lt;/span>&lt;span class="p">):&lt;/span>  &lt;span class="c"># This will be __next__(self) in Python 3.x&lt;/span>
&lt;span class="lineno">13&lt;/span>         &lt;span class="n">fib&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">a&lt;/span>
&lt;span class="lineno">14&lt;/span>         &lt;span class="k">if&lt;/span> &lt;span class="n">fib&lt;/span> &lt;span class="o">&gt;&lt;/span> &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">max&lt;/span>&lt;span class="p">:&lt;/span>
&lt;span class="lineno">15&lt;/span>             &lt;span class="k">raise&lt;/span> &lt;span class="ne">StopIteration&lt;/span>
&lt;span class="lineno">16&lt;/span>         &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">a&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">b&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">b&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">a&lt;/span> &lt;span class="o">+&lt;/span> &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">b&lt;/span>
&lt;span class="lineno">17&lt;/span>         &lt;span class="k">return&lt;/span> &lt;span class="n">fib&lt;/span>
</code></pre>
  </div>
  
  <p>
    Now, we can print the first <em>n</em> elements of the series:
  </p>
  
  <div class="highlight">
    <pre><code class="python">&lt;span class="k">for&lt;/span> &lt;span class="n">fib&lt;/span> &lt;span class="ow">in&lt;/span> &lt;span class="n">Fib&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="mi">10&lt;/span>&lt;span class="p">):&lt;/span>
    &lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">fib&lt;/span>&lt;span class="p">)&lt;/span>
</code></pre>
  </div>
  
  <p>
    Cool, huh?! Now, onto <a href="http://www.markrichman.com/intro-to-python-generators/">generators</a>…
  </p>
</div>

<!-- /.article-wrap --></article>