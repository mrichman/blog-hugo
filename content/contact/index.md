---
title: Contact
author: Mark Richman
layout: page
date: 1900-01-01
pyre_slider_type:
  - no
pyre_full_width:
  - no
pyre_sidebar_position:
  - default
pyre_portfolio_full_width:
  - yes
pyre_portfolio_sidebar_position:
  - default
pyre_portfolio_filters:
  - yes
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

---

<div class="pure-g">
  <div class="pure-u-1 pure-u-md-1-2">
      <div class="l-box">
          <h3>Mark Richman Consulting, Inc.</h3>
          <p>
          22207 Majestic Woods Way<br/>
          Boca Raton, FL 33428<br/>
          <i class="fa fa-phone fa-fw"></i><a href="tel:1-561-571-5008">(561) 571-5008</a><br/>
          <i class="fa fa-envelope fa-fw"></i><a href="mailto:mark@markrichman.com">mark@markrichman.com</a>
          </p>
      </div>
  </div>
  <div class="pure-u-1 pure-u-md-1-2">
      <div class="l-box">
      <div>
      <iframe style="margin-top:4px;" width="420" height="160" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.ca/maps?hl=en&amp;q=Boca+Raton,+FL&amp;ie=UTF8&amp;t=m&amp;&amp;&amp;z=14&amp;output=embed&amp;iwloc=end"></iframe>
      </div>
      </div>
  </div>
</div>

<form id="contact-form">
  <label for="name">Name</label>
  <input class="form-control" type="text" name="name" required placeholder="Name">
  <br/>
  <label for="email">Email</label>
  <input class="form-control" type="email" name="_replyto" required placeholder="email@address.com">
  <br/>
  <label for="tel">Phone</label>
  <input class="form-control" type="tel" name="tel" placeholder="(999) 555-1212">
  <br/>
  <br/>
  <label for="message">Message</label>
  <br/>
  <textarea class="form-control" name="message" placeholder="Message" required rows="5"></textarea>
  <br/>
  <input type="submit" value="Send">
</form>

<!-- Hidden message to show if contact is successful. -->
<div id="submit-success" style="display:none">
  Message received! I'll be in touch.
</div>

<!-- Hidden message to show if user encounters errors. -->
<div id="submit-errors" style="display:none">
  It looks like there was an error submitting the form.
  Please try again later.
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<script src="/js/main.js"></script>
