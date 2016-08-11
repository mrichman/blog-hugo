---
title: Contact
author: Mark Richman
layout: page
date: 1900-01-01
---

<section>
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
  <label for="message">Message</label>
  <br/>
  <textarea class="form-control" name="message" placeholder="Message" required rows="5"></textarea>
  <br/>
  <input type="submit" value="Send">
</form>
</section>

<section>
    <h3>Mark Richman Consulting, Inc.</h3>
    <p>
    <i class="fa fa-map-marker fa-fw"></i>22207 Majestic Woods Way<br/>
    <i class="fa fa-fw"></i>Boca Raton, FL 33428<br/>
    <i class="fa fa-phone fa-fw"></i><a href="tel:1-561-571-5008">(561) 571-5008</a><br/>
    <i class="fa fa-envelope fa-fw"></i><a href="mailto:mark@markrichman.com">mark@markrichman.com</a>
    </p>
</section>
  
<!-- Hidden message to show if contact is successful. -->
<div id="submit-success" style="display:none">
  Message received! I'll be in touch.
</div>

<!-- Hidden message to show if user encounters errors. -->
<div id="submit-errors" style="display:none">
  It looks like there was an error submitting the form.
  Please try again later.
</div>

<div>
  <iframe style="margin-top:4px;" width="100%" height="320" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?hl=en&amp;q=Boca+Raton,+FL&amp;ie=UTF8&amp;t=m&amp;z=8&amp;output=embed&amp;iwloc=end"></iframe>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<script src="/js/main.js"></script>
