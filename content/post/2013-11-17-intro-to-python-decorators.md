---
title: Introduction to Python Decorators
author: Mark Richman
layout: post
date: 2013-11-17T16:27:52+00:00
url: /intro-to-python-decorators/
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
  - 13041
sbg_selected_sidebar:
  - 'a:1:{i:0;s:1:"0";}'
sbg_selected_sidebar_replacement:
  - 'a:1:{i:0;s:1:"0";}'
categories:
  - Python

---
# What are Decorators? {#what-are-decorators}

In Python, functions are first-class objects. They can be passed as variables, and have attributes,
  
just like any other object. They can also be _returned_ from other functions!

<div class="highlight">
  <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="k">def&lt;/span> &lt;span class="nf">outer_func&lt;/span>&lt;span class="p">():&lt;/span>
&lt;span class="lineno">2&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">inner_func&lt;/span>&lt;span class="p">():&lt;/span>
&lt;span class="lineno">3&lt;/span>         &lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="s">'Inner funk!'&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno">4&lt;/span>     &lt;span class="k">return&lt;/span> &lt;span class="n">inner_func&lt;/span>  &lt;span class="c"># notice, no parens!&lt;/span>
</code></pre>
</div>

Note the absence of parentheses when returning `inner_func` above. Here we are not _calling_ the function,
  
but rather returning a reference to the function. We can use this reference to invoke `inner_func` as follows:

<div class="highlight">
  <pre><code class="text">&gt;&gt;&gt; inner = outer_func()
&gt;&gt;&gt; inner()
Inner funk!
&gt;&gt;&gt; 
</code></pre>
</div>

The call to `outer_func` above simply returns a reference to `inner_func`, then we invoke `inner_func` by
  
calling its reference as `inner()` (with parentheses this time).

**A decorator is simply a function that returns a function.**

# Creating a Decorator {#creating-a-decorator}

Let’s start with the simplest decorator possible &#8211; one that does virtually nothing. We will call this construct the “Identity Decorator”:

<div class="highlight">
  <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="k">def&lt;/span> &lt;span class="nf">identity&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">func&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">2&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">_identity&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="o">*&lt;/span>&lt;span class="n">args&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="o">**&lt;/span>&lt;span class="n">kwargs&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">3&lt;/span>         &lt;span class="k">return&lt;/span> &lt;span class="n">func&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="o">*&lt;/span>&lt;span class="n">args&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="o">**&lt;/span>&lt;span class="n">kwargs&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno">4&lt;/span>     &lt;span class="k">return&lt;/span> &lt;span class="n">_identity&lt;/span>
</code></pre>
</div>

This decorator simply returns what ever function and argument(s) was passed to it, without modification. To use a decorator, prefix the method of your choice with the `@` symbol followed by the decorator function name:

<div class="highlight">
  <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="nd">@identity&lt;/span>
&lt;span class="lineno">2&lt;/span> &lt;span class="k">def&lt;/span> &lt;span class="nf">foo&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">bar&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">3&lt;/span>     &lt;span class="k">pass&lt;/span>
</code></pre>
</div>

The decorator `identity` will take the function `foo` as its parameter, and return it unmodified. Now let’s try something concrete.

# Say Hello {#say-hello}

We can create a decorator to print “Hello” to the console whenever the function it decorates is called.

<div class="highlight">
  <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="k">def&lt;/span> &lt;span class="nf">hello&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">func&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">2&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">inner&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="o">*&lt;/span>&lt;span class="n">args&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="o">**&lt;/span>&lt;span class="n">kwargs&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">3&lt;/span>         &lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="s">"Hello"&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno">4&lt;/span>         &lt;span class="k">return&lt;/span> &lt;span class="n">func&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="o">*&lt;/span>&lt;span class="n">args&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="o">**&lt;/span>&lt;span class="n">kwargs&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno">5&lt;/span>     &lt;span class="k">return&lt;/span> &lt;span class="n">inner&lt;/span>
</code></pre>
</div>

Here, the `hello` function is the decorator. Within this function is a _nested function_ called `inner` which prints “Hello” to the console. It then calls the function passed into `hello`, along with its arguments, if any.

<div class="highlight">
  <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="nd">@hello&lt;/span>
&lt;span class="lineno">2&lt;/span> &lt;span class="k">def&lt;/span> &lt;span class="nf">foo&lt;/span>&lt;span class="p">():&lt;/span>
&lt;span class="lineno">3&lt;/span>     &lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="s">"Sweet Charlie"&lt;/span>&lt;span class="p">)&lt;/span>
</code></pre>
</div>

I chose `inner` for the nested function arbitrarily. You can use any name you like. Now, when we call `foo` we will get the following output:

<div class="highlight">
  <pre><code class="text">In [1]: def hello(func):
   ...:     def inner(*args, **kwargs):
   ...:         print("Hello")
   ...:         return func(*args, **kwargs)
   ...:     return inner
   ...: @hello
   ...: def foo():
   ...:     print("Sweet Charlie")
   ...: foo()
   ...: 
Hello
Sweet Charlie
</code></pre>
</div>

Now, for any function decorated with `@hello`, The string “Hello” will be printed to the console. We can build a more complex &#8211; and useful &#8211; example on top of this decorator.

# Use Case: Logging with Decorators {#use-case-logging-with-decorators}

Let’s create a _logging_ decorator, which will print the name of the called function, along with any parameters passed to it:

<div class="highlight">
  <pre><code class="python">&lt;span class="lineno"> 1&lt;/span> &lt;span class="k">def&lt;/span> &lt;span class="nf">logger&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">func&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno"> 2&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">inner&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="o">*&lt;/span>&lt;span class="n">args&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="o">**&lt;/span>&lt;span class="n">kwargs&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno"> 3&lt;/span> 	    &lt;span class="n">res&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="n">func&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="o">*&lt;/span>&lt;span class="n">args&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="o">**&lt;/span>&lt;span class="n">kwargs&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno"> 4&lt;/span> 	    &lt;span class="k">print&lt;/span> &lt;span class="n">func&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">__name__&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="n">args&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="n">kwargs&lt;/span>
&lt;span class="lineno"> 5&lt;/span> 	    &lt;span class="k">return&lt;/span> &lt;span class="n">res&lt;/span>
&lt;span class="lineno"> 6&lt;/span>     &lt;span class="k">return&lt;/span> &lt;span class="n">inner&lt;/span>      
&lt;span class="lineno"> 7&lt;/span> 
&lt;span class="lineno"> 8&lt;/span> &lt;span class="nd">@logger&lt;/span>
&lt;span class="lineno"> 9&lt;/span> &lt;span class="k">def&lt;/span> &lt;span class="nf">do_something&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">foo&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="n">bar&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">10&lt;/span>   &lt;span class="k">pass&lt;/span>
</code></pre>
</div>

Console output:

<div class="highlight">
  <pre><code class="text">&gt;&gt;&gt; do_something(1,2)
do_something (1, 2) {}
</code></pre>
</div>

Our `logger` function, upon a call to `do_something(1,2)` simply printed out the function name `do_something` and its arguments as the tuple `(1,2)`. No keyword (named) arguments were supplied, so the empty dictionary `{}` was printed.

Replacing the positional arguments with keyword arguments to `do_something` emits the following log statement:

<div class="highlight">
  <pre><code class="text">&gt;&gt;&gt; do_something(foo=1,bar=2)
do_something () {'foo': 1, 'bar': 2}
</code></pre>
</div>

Now, anytime you want to do a little _poor man’s debugging_ you can use the `@log` decorator without having to modify any of your existing code. Consider a more robust version of this logger using the built in [`logging`][1] module.

# Use Case: Timing a Function {#use-case-timing-a-function}

We can implement another handy tool to measure the performance of a function.

<div class="highlight">
  <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="k">def&lt;/span> &lt;span class="nf">timeit&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">func&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">2&lt;/span>     &lt;span class="sd">"""A decorator that prints the time a function takes to execute."""&lt;/span>
&lt;span class="lineno">3&lt;/span>     &lt;span class="kn">import&lt;/span> &lt;span class="nn">time&lt;/span>
&lt;span class="lineno">4&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">wrapper&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="o">*&lt;/span>&lt;span class="n">args&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="o">**&lt;/span>&lt;span class="n">kwargs&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">5&lt;/span>         &lt;span class="n">t&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="n">time&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">time&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="lineno">6&lt;/span>         &lt;span class="n">res&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="n">func&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="o">*&lt;/span>&lt;span class="n">args&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="o">**&lt;/span>&lt;span class="n">kwargs&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno">7&lt;/span>         &lt;span class="k">print&lt;/span> &lt;span class="n">func&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">__name__&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="n">time&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">time&lt;/span>&lt;span class="p">()&lt;/span> &lt;span class="o">-&lt;/span> &lt;span class="n">t&lt;/span>
&lt;span class="lineno">8&lt;/span>         &lt;span class="k">return&lt;/span> &lt;span class="n">res&lt;/span>
&lt;span class="lineno">9&lt;/span>     &lt;span class="k">return&lt;/span> &lt;span class="n">wrapper&lt;/span>
</code></pre>
</div>

Let’s simulate a slow-running function:

<div class="highlight">
  <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="kn">import&lt;/span> &lt;span class="nn">time&lt;/span>
&lt;span class="lineno">2&lt;/span> 
&lt;span class="lineno">3&lt;/span> &lt;span class="nd">@timeit&lt;/span>
&lt;span class="lineno">4&lt;/span> &lt;span class="k">def&lt;/span> &lt;span class="nf">slow&lt;/span>&lt;span class="p">():&lt;/span>
&lt;span class="lineno">5&lt;/span>     &lt;span class="n">time&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">sleep&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="mi">5&lt;/span>&lt;span class="p">)&lt;/span>
</code></pre>
</div>

When we call `slow` we introduce an artificial delay of 5 seconds using `sleep(5)`:

<div class="highlight">
  <pre><code class="python">&lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">slow&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="n">slow&lt;/span> &lt;span class="mf">5.00087594986&lt;/span>
&lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">slow&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="n">slow&lt;/span> &lt;span class="mf">5.0011920929&lt;/span>
&lt;span class="o">&gt;&gt;&gt;&lt;/span> &lt;span class="n">slow&lt;/span>&lt;span class="p">()&lt;/span>
&lt;span class="n">slow&lt;/span> &lt;span class="mf">5.00118708611&lt;/span>
</code></pre>
</div>

The operating system’s high resolution timer shows that “5 seconds” can vary just a bit!

# Use Case: Stacking Multiple Decorators {#use-case-stacking-multiple-decorators}

Multiple decorators can be applied to any function. Simply stack them like this:

<div class="highlight">
  <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="nd">@decorator3&lt;/span>
&lt;span class="lineno">2&lt;/span> &lt;span class="nd">@decorator2&lt;/span>
&lt;span class="lineno">3&lt;/span> &lt;span class="nd">@decorator1&lt;/span>
&lt;span class="lineno">4&lt;/span> &lt;span class="k">def&lt;/span> &lt;span class="nf">foo&lt;/span>&lt;span class="p">():&lt;/span>
&lt;span class="lineno">5&lt;/span>     &lt;span class="k">pass&lt;/span>
</code></pre>
</div>

It is important to note that Python will apply the decorators from _innermost_ to _outermost_. In our example above, `decorator1` is executed first.

# Standard Library Decorators {#standard-library-decorators}

The Python standard library has a number of built-in decorators, available anywhere.

## @classmethod {#classmethod}

Class methods are bound to a class, but **not** to a specific _instance_ of a class. For example:

<div class="highlight">
  <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="k">class&lt;/span> &lt;span class="nc">Circle&lt;/span>&lt;span class="p">:&lt;/span>
&lt;span class="lineno">2&lt;/span> 	&lt;span class="n">diameter&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="mi">12&lt;/span>
&lt;span class="lineno">3&lt;/span> 
&lt;span class="lineno">4&lt;/span> 	&lt;span class="nd">@classmethod&lt;/span>
&lt;span class="lineno">5&lt;/span> 	&lt;span class="k">def&lt;/span> &lt;span class="nf">get_diameter&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">cls&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">6&lt;/span>         &lt;span class="k">return&lt;/span> &lt;span class="n">cls&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">diameter&lt;/span>
</code></pre>
</div>

In the `Circle` class above, notice the `diameter` variable is a _class_ member. That is, it belongs to the class, not any particular instance. There is also no `self.` prepended to `diameter`.

The `classmethod` decorator applies the same structure to a function. The `get_diameter` function is a member of the `Circle` class. Notice the first parameter is called `cls`. This is an _implicit_ reference to the `Circle` class.

We can call `get_diameter` as follows:

<div class="highlight">
  <pre><code class="text">&gt;&gt;&gt; Circle.get_diameter()
12
</code></pre>
</div>

Notice we called `get_diameter` _directly_ on the `Circle` class, and not on an instance.

We can create an _instance_ of `Circle` and call `get_diameter`, producing the same result:

<div class="highlight">
  <pre><code class="text">&gt;&gt;&gt; circle = Circle()
&gt;&gt;&gt; circle.get_diameter()
12
</code></pre>
</div>

Using `classmethod` also has the benefit of working with inheritance. All subclasses will be able to access the function decorated with `classmethod`.

Here’s an example of a class method being invoked by a subclass:

<div class="highlight">
  <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="k">class&lt;/span> &lt;span class="nc">Parent&lt;/span>&lt;span class="p">:&lt;/span>
&lt;span class="lineno">2&lt;/span>     &lt;span class="n">member&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="s">'x'&lt;/span>
&lt;span class="lineno">3&lt;/span> 
&lt;span class="lineno">4&lt;/span>     &lt;span class="nd">@classmethod&lt;/span>
&lt;span class="lineno">5&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">foo&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">cls&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">6&lt;/span>         &lt;span class="k">print&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">cls&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">member&lt;/span>&lt;span class="p">)&lt;/span>
&lt;span class="lineno">7&lt;/span> 
&lt;span class="lineno">8&lt;/span> &lt;span class="k">class&lt;/span> &lt;span class="nc">Child&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">Parent&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">9&lt;/span>     &lt;span class="k">pass&lt;/span>
</code></pre>
</div>

We can call `foo` directly from the `Child` class:

<div class="highlight">
  <pre><code class="text">&gt;&gt;&gt; Child.foo()
x
</code></pre>
</div>

## @staticmethod {#staticmethod}

Static methods in Python behave a bit differently than class methods, and are more similar to those found in Java or C++, for example. Unlike class methods. static methods have no knowledge of the class in which they are defined.

<div class="highlight">
  <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="k">class&lt;/span> &lt;span class="nc">Foo&lt;/span>&lt;span class="p">:&lt;/span>
&lt;span class="lineno">2&lt;/span>     &lt;span class="nd">@staticmethod&lt;/span>
&lt;span class="lineno">3&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">bar&lt;/span>&lt;span class="p">():&lt;/span>
&lt;span class="lineno">4&lt;/span>         &lt;span class="k">pass&lt;/span>
</code></pre>
</div>

Notice that `bar` has no `cls` or `self` arguments. Call static methods similarly to class methods:

`>>> Foo.bar()`

## @property {#property}

The `property` decorator can be used to control access to a variable. Applying this decorator gives a function `getter`, `setter`, and `deleter` attributes. You can use just the `property` decorator on its own:

<div class="highlight">
  <pre><code class="python">&lt;span class="lineno">1&lt;/span> &lt;span class="k">class&lt;/span> &lt;span class="nc">Foo&lt;/span>&lt;span class="p">:&lt;/span>
&lt;span class="lineno">2&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">__init&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="bp">self&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">3&lt;/span>         &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">_bar&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="bp">None&lt;/span>
&lt;span class="lineno">4&lt;/span> 
&lt;span class="lineno">5&lt;/span>     &lt;span class="nd">@property&lt;/span>
&lt;span class="lineno">6&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">bar&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="bp">self&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">7&lt;/span>         &lt;span class="k">return&lt;/span> &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">_bar&lt;/span>
</code></pre>
</div>

This makes the `bar` function act as if it were a property:

<div class="highlight">
  <pre><code class="text">&gt;&gt;&gt; f = Foo()
&gt;&gt;&gt; f.bar = 'x'
&gt;&gt;&gt; f.bar
'x'
</code></pre>
</div>

or you can enhance the `setter` and `deleter` behavior:

<div class="highlight">
  <pre><code class="python">&lt;span class="lineno"> 1&lt;/span> &lt;span class="k">class&lt;/span> &lt;span class="nc">Foo&lt;/span>&lt;span class="p">:&lt;/span>
&lt;span class="lineno"> 2&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">__init&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="bp">self&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno"> 3&lt;/span>         &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">_bar&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="bp">None&lt;/span>
&lt;span class="lineno"> 4&lt;/span> 
&lt;span class="lineno"> 5&lt;/span>     &lt;span class="nd">@property&lt;/span>
&lt;span class="lineno"> 6&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">bar&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="bp">self&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno"> 7&lt;/span>         &lt;span class="k">return&lt;/span> &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">_bar&lt;/span>
&lt;span class="lineno"> 8&lt;/span> 
&lt;span class="lineno"> 9&lt;/span>     &lt;span class="nd">@bar.setter&lt;/span>
&lt;span class="lineno">10&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">bar&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="bp">self&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="n">value&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">11&lt;/span>         &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">_bar&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="n">value&lt;/span>
&lt;span class="lineno">12&lt;/span> 
&lt;span class="lineno">13&lt;/span>     &lt;span class="nd">@bar.deleter&lt;/span>
&lt;span class="lineno">14&lt;/span>     &lt;span class="k">def&lt;/span> &lt;span class="nf">bar&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="bp">self&lt;/span>&lt;span class="p">):&lt;/span>
&lt;span class="lineno">15&lt;/span>         &lt;span class="k">del&lt;/span> &lt;span class="bp">self&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="n">_bar&lt;/span>
</code></pre>
</div>

Notice the syntax of `setter` and `deleter` &#8211; the decorator is prefixed with `bar.`. This indicates that the decorator applies to the property `bar`. Decorated functions can also have decorators!

# Conclusion {#conclusion}

We’ve seen how decorators can be used to augment behavior with minimal code changes. This approach has limitless uses. Please leave a comment below, and let me know how **you** use decorators!

 [1]: http://docs.python.org/2/howto/logging.html