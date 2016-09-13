---
title: Installing Git and gitosis on Ubuntu
author: Mark Richman
layout: post
date: 2008-06-17T03:10:20+00:00
url: /installing-git-and-gitosis-on-ubuntu/
dsq_thread_id:
  - 92489150
avada_post_views_count:
  - 4324
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
sbg_selected_sidebar:
  - 'a:1:{i:0;s:1:"0";}'
sbg_selected_sidebar_replacement:
  - 'a:1:{i:0;s:1:"0";}'
categories:
  - Uncategorized
tags:
  - git
  - gitosis

---
<div class="post-body content">
  <p>
    <span style="color: #000000;"><strong>Gitosis is now deprecated. Check out <span style="color: #0000ff;"><a href="http://wiki.dreamhost.com/Gitolite" target="_blank"><span style="color: #0000ff;">Gitolite</span></a></span> instead.</strong></span>
  </p>
  
  <p>
    <span style="line-height: 1.5em;">I’m switching all my personal projects to </span><a style="line-height: 1.5em;" href="http://git.or.cz/" target="_blank">git</a><span style="line-height: 1.5em;"> from </span><a style="line-height: 1.5em;" href="http://svnbook.red-bean.com/" target="_blank">Subversion</a><span style="line-height: 1.5em;">. To that end, I&#8217;ve set up a remote git repository on my </span><a style="line-height: 1.5em;" href="http://www.linode.com" target="_blank">Linode.com</a><span style="line-height: 1.5em;"> VPS running Ubuntu. Here&#8217;s how to do it:</span>
  </p>
  
  <p>
    First, install git on the remote server:
  </p>
  
  <pre><code>sudo apt-get install git-core
</code></pre>
  
  <p>
    Then, following <a href="http://scie.nti.st/2007/11/14/hosting-git-repositories-the-easy-and-secure-way" target="_blank">instructions on scie.nti.st</a>, we grab the <a title="gitosis" href="http://eagain.net/gitweb/?p=gitosis.git" target="_blank">gitosis</a> code (still remote):
  </p>
  
  <pre><code>cd ~/src
git clone git://eagain.net/gitosis.git
</code></pre>
  
  <p>
    Then:
  </p>
  
  <pre><code>cd gitosis
sudo apt-get install python-setuptools
sudo python setup.py install           # I had to do sudo here</code>
<code>sudo apt-get install python-setuptools # I also needed these tools</code></pre>
  
  <p>
    Next, create a git user to own the repositories:
  </p>
  
  <pre><code>sudo adduser 
    --system 
    --shell /bin/sh 
    --gecos 'git version control' 
    --group 
    --disabled-password 
    --home /home/git 
    git
</code></pre>
  
  <p>
    I copied my public ssh key from my workstation to the remote server at <code>/tmp/id_rsa.pub</code>, (tmp avoids perms issues with git) then run
  </p>
  
  <pre><code>sudo -H -u git gitosis-init &lt; /tmp/id_rsa.pub
sudo chmod 755 /home/git/repositories/gitosis-admin.git/hooks/post-update
</code></pre>
  
  <p>
    And that’s the end of the server-side setup! On the local machine, we check out the files that are needed to control the server.
  </p>
  
  <p>
    If you run <span class="caps">SSH</span> on a nonstandard port: edit <code>~/.ssh/config</code> and put this inside:
  </p>
  
  <pre><code>Host www.example.com
    Port 32767
</code></pre>
  
  <p>
    Then you can do:
  </p>
  
  <pre><code>git clone git@YOUR_SERVER_HOSTNAME:gitosis-admin.git
cd gitosis-admin
</code></pre>
  
  <p>
    The gitosis-admin is the directory where you administer gitosis. From this point on, you don&#8217;t need to be on your server. All configuration takes place locally and you push the changes to your server when you&#8217;re ready for them to take effect.
  </p>
</div>