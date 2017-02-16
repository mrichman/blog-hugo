+++
title = "AWS Elastic Beanstalk & Go"
description = "Deploying a Go web app"
tags = [ "aws", "cloud",  "elastic-beanstalk", "go", "golang"]
date = "2017-02-17"
categories = ["AWS","Go"]
slug = "aws-elastic-beanstalk-go"
+++

I'll show you how to easily deploy a Go web application using AWS Elastic Beanstalk and Go. 

{{< youtube _CUIRJYhbXc >}}

If you're not familiar, [AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/) lets you deploy your app to [AWS](https://aws.amazon.com/), and it takes care of [load balancing](https://aws.amazon.com/elasticloadbalancing/) and auto-scaling for you.

No server configuration required at all.

It’s cool because it supports lots of platforms - Java, PHP, .NET, Node.js, Python, Ruby, Docker, and Go.

I like working with [Go](https://golang.org)

So let's take a quick look at a code sample I wrote for this demo. 

It’s very simple. Like a Hello World.

The full project is over at my Github repo: [https://github.com/mrichman/elastic-beanstalk-go-demo]

{{< gist mrichman aadd564797b363ed72ee732465634797 >}}

This is a very basic web server that serves up a static HTML page.

I'm not going to teach you how to program in Go here, but I'll give you a general idea of what’s happening.

This app runs on port 5000.

Under the hood, Elastic Beanstalk uses [Nginx](https://nginx.org/en) to reverse proxy to your app. 

By default, this is port 5000, but you can override this if you like.

We set up our default route to return index.html.

Clone this URL into your Go workspace: [https://github.com/mrichman/elastic-beanstalk-go-demo.git]

At the command prompt, run the application:

`go run application.go`

Then browse to [http://localhost:5000]. Simple right?

So how do we get our app up to Elastic Beanstalk?

We need to create what’s called a source package.

## Creating a source package

Create a zip file from the root of this package, for example:

`cd $GOPATH/src/github.com/mrichman/elastic-beanstalk-go-demo`

Then, either zip it from the command line:

`zip ../eb.zip -r * .[^.]*`

or use `git`:

`git archive -o ../eb.zip HEAD`

The git command above will zip up the last commit on master.

## Deploying a Go Application on Elastic Beanstalk

Browse to the [Elastic Beanstalk console](https://console.aws.amazon.com/elasticbeanstalk/), and click "Create New Application".

Give it a name, for example "Go Demo". Then create a new web server environment. For "Platform", select "Go", then select "Upload your code".

For simple Go applications, there are two ways to deploy your application:

* **Method 1:** Provide a source bundle with a source file at the root called application.go that contains the main package for your application. Elastic Beanstalk automatically builds the binary using the following command at deployment time:

    `go build -o bin/application application.go`

* **Method 2:** Provide a source bundle with a binary file called application. The binary file can be located either at the root of the source bundle or in the bin/ directory of the source bundle. If you place the application binary file in both locations, Elastic Beanstalk uses the file in the bin/ directory.

By default, Elastic Beanstalk configures the nginx proxy to forward requests to your application on port 5000. You can override the default port by setting the `PORT` system property to the port on which your main application listens.

For "Source code origin", choose "Local file" and pick the `eb.zip` file created above. Enter anything for "Version label".

Click "Upload", then back at the "Create a new environment" screen, click "Create environment".

Your application will begin to deploy. This process can take several minutes.

When the deployment is complete, you'll be redirected to your Elastic Beanstalk application's overview page. In the breadcrumb trail at the top, next to your Environment ID, you'll see a URL in the control panel ending in `elasticbeanstalk.com` where you can browse your application.

To clean up after yourself, and terminate your application, click the Actions menu and select "Terminate Environment". This will terminate any EC2 instances created during deployment. You can restart your application by selecting Actions -> Create Environment again.

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
Considering a move to the cloud? I offer a number of <a href="https://markrichman.com/services/">AWS consulting services</a>, including an <a href="https://markrichman.com/services/aws-migration/">AWS migration service</a> to quickly get you up and running...and out of the closet!</a>
</p>

**AWS Tip:** EC2 inbound data transfer is free, but outbound is not. Find opportunities to limit outbound data to save money.