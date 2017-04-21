+++
title = "Your First Enterprise Cloud Project on AWS"
description = ""
tags = [ "aws", "cloud"]
date = "2017-04-21"
categories = ["AWS","CFO"]
slug = "your-first-enterprise-cloud-project-aws"
+++

This is the first in a series of articles on the various stages of adoption an organization will go through as they migrate to the cloud. Most of my clients start with a pilot project that helps them learn how Amazon Web Services (AWS) solves a business problem. Ultimately, these projects test their leadership and change management processes far more than their technical skills.

## My first enterprise cloud project

In 2013, I was working with a medium-sized retailer of vitamin supplements. Their operations were based out of a warehouse, which doubled as their datacenter. Basically, there were two servers in a back room closet and a DSL line. Their sales were primarily from catalog orders (yes, even in 2013) and they were beginning to promote their new e-commerce site (hosted in the closet) via email. Needless to say, this didn’t scale, and wasn’t at all fault tolerant. Most email campaigns produced sufficient traffic to stall the site.

With prior clients, I might have simply provisioned a Virtual Private Server (VPS) through one of the major vendors at the time. This would have given me more compute capacity than their server in the closet, and certainly more bandwidth. However, if spikes in traffic occurred, that one server might not have been able to keep up. And if the server crashed, there was no redundancy. I knew we could do better.

I wanted to try something new, so I recommended a pilot on AWS. A few weeks later, with a few Elastic Compute Cloud (EC2) instances, we were up and running. The load balancer handled the spikes in traffic, with plenty of bandwidth, and backups were a breeze. My client was thrilled, and we went on to grow into a few other AWS technologies.

## What project should you start with?

Something small. Very small. I’ve seen organizations attempt their first cloud migrations on complex systems, and fail miserably. Their teams had no hands-on experience with AWS, and tried to learn on the job with a deadline. This is a recipe for disaster.

I encourage my clients to take on a project that can be delivered in under a month. Since one of the main drivers of cloud adoption is agility, it only makes sense that it prove its own case. 

New development is ideal, as modern platforms and frameworks are better supported, but I’ve done legacy migrations to AWS as well.

What’s really important is that you choose something that will deliver tangible business value. By this, I do not mean a total IT transformation in a few weeks.

## Be a hero, not a cowboy

Organizations can only handle so much change at once. I’ve found that starting a cloud migration with something small allows for positive returns. Just beware that while many people in your organization will embrace the change, others will resist. This phenomenon, aptly enough, is known as Efrat’s Cloud, and no, it has nothing to do with cloud computing. Seriously. Google it.

## Stepping out of the shadows

Many of my early cloud adoption projects involved marketing execs looking to avoid the "hassle" of working within the confines of their IT departments. These "shadow IT" projects helped speed the launch of new initiatives that would otherwise stall with on-premises deployments. Now that the cloud is becoming the new norm, clients reach out to me to develop approved reference cloud architectures that satisfy both the need for agility and governance.

Do you have an interesting "first cloud project" to share? <a href="/contact">Click here</a> to drop me a line!

<style>
p.callout {
	padding:15px;
	background-color:#ECF8FF;
	margin-bottom: 15px;
}
.callout a {
	font-weight:bold;
	color: #2BA6CB;
}
</style>

<p class="callout">
Considering a move to the cloud? I offer a number of <a href="https://markrichman.com/services/">AWS consulting services</a>, including an <a href="https://markrichman.com/services/aws-migration/">AWS migration service</a> to quickly get you up and running...profitably!</a>
</p>

**AWS Tip:** EC2 inbound data transfer is free, but outbound is not. Find opportunities to limit outbound data to save money.
