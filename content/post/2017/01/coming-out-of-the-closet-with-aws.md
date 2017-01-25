+++
title = "Coming out of the closet with AWS"
description = "Strategic considerations when planning a migration to AWS"
tags = [ "aws", "cloud"]
date = "2017-01-25"
categories = ["AWS"]
slug = "coming-out-of-the-closet-with-aws"
+++

Most of my clients come to me for help escaping the hell of managing servers in a closet somewhere in their office, or in a colocation facility. They realized their data was far too critical to leave on-premises, risking data loss and security breaches. What’s more, if they needed to rapidly scale their operations to meet demand, it would take weeks to add capacity. In terms of cost, maintaining infrastructure hardware and having to pay network engineers to keep it all going quickly erodes profits. What a nightmare!

With Amazon Web Services (AWS), you can provision compute power, storage and other resources, gaining access to a suite of elastic IT infrastructure services as your business demands them. With minimal cost and effort, you can move your application to the AWS cloud and reduce capital expenses, minimize support and administrative costs, and retain the performance, security, and reliability requirements your business demands.

It’s time to come out of the closet with AWS.

Here are some of my key strategic considerations when planning a migration to AWS:

* **Identify goals** - What’s your primary motivator to move to AWS? Is it cost, agility, scalability, performance, or something else?
* **Survey the landscape** - Which applications in your portfolio are candidates to migrate to AWS first? What are the current costs involved in continuing to manage these resources yourself?
* **Determine requirements** - Which AWS services are required to successfully migrate these application? Consider compute capacity, databases, storage, networking components, monitoring, security, etc.
* **Define the architecture** - What will your system architecture look like once running in AWS?
* **Planning to plan** - Define a detailed, comprehensive AWS migration plan. This includes all the existing resources, how they map to AWS services, security considerations, networking topology, security and governance, etc.
* **Execute the migration** - Once a solid plan is defined, migrate the system to AWS.
* **Monitor and test** - What’s working well, and what can be improved?
 
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
Need help with any or all of these concerns? I offer a number of <a href="https://markrichman.com/services/">AWS consulting services</a>, including an <a href="https://markrichman.com/services/aws-migration/">AWS migration service</a> to quickly get you up and running...and out of the closet!</a>
</p>

**AWS Tip:** EC2 inbound data transfer is free, but outbound is not. Find opportunities to limit outbound data to save money.