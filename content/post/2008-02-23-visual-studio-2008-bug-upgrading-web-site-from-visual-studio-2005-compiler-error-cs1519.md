---
title: 'Visual Studio 2008 Bug Upgrading web site from Visual Studio 2005: compiler error CS1519'
author: Mark Richman
layout: post
date: 2008-02-23T04:36:00+00:00
url: /visual-studio-2008-bug-upgrading-web-site-from-visual-studio-2005-compiler-error-cs1519/
avada_post_views_count:
  - 558
categories:
  - ASP.NET

---
I recently upgraded a website to Visual Studio 2008 from Visual Studio 2005 so I could make use of LINQ to SQL. Upon adding my table to a new .dbml file and rebuilding, I was met with this nasty compiler error:

LINQ to SQL compiler error CS1519: Invalid token &#8216;void&#8217; in class, struct, or interface member declaration

After a few minutes of cursing Microsoft, I figured it out&#8230;looks like the compiler version wasn&#8217;t updated in the solution
  
file&#8230;the C# 2.0 compiler was still being used and choked on the
  
partial methods. I went into project properties, downgraded from
  
framework 3.5 to 2.0, clicked ok, then went back and set it to 3.5 and
  
clicked ok. After re-adding the reference to System.Data.Linq, the
  
compile succeeded.

To me, this is a bug in Visual Studio
  
2008&#8230;the scenario where you &#8220;upgrade&#8221; a Visual Studio 2005 website to
  
2008 for use with LINQ seems like a common thing, no?

<a href="http://weblogs.asp.net/davidyancey/" target="_blank">Dave Yancey</a> confirms this behavior for XMLSerializer bugs as well&#8230;thanks Dave!

**Update (May 23, 2008)**: I was told the following would also be helpful, though I have not tested it yet:

<pre>&lt;<span>system.codedom</span>&gt;
&lt;<span>compilers</span>&gt;
&lt;<span>compiler</span><span> language=</span><span class="attrv">"c#;cs;csharp"</span><span> extension=</span><span class="attrv">".cs"</span><span> warningLevel=</span><span class="attrv">"4"</span><span> 
  type=</span><span class="attrv">"Microsoft.CSharp.CSharpCodeProvider, System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"</span>&gt;
&lt;<span>providerOption</span><span> name=</span><span class="attrv">"CompilerVersion"</span><span> value=</span><span class="attrv">"v3.5"</span>/&gt;
&lt;<span>providerOption</span><span> name=</span><span class="attrv">"WarnAsError"</span><span> value=</span><span class="attrv">"false"</span>/&gt;
&lt;/<span>compiler</span>&gt;
&lt;<span>compiler</span><span> language=</span><span class="attrv">"vb;vbs;visualbasic;vbscript"</span><span> extension=</span><span class="attrv">".vb"</span><span> warningLevel=</span><span class="attrv">"4"</span><span> 
  type=</span><span class="attrv">"Microsoft.VisualBasic.VBCodeProvider, System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"</span>&gt;
&lt;<span>providerOption</span><span> name=</span><span class="attrv">"CompilerVersion"</span><span> value=</span><span class="attrv">"v3.5"</span>/&gt;
&lt;<span>providerOption</span><span> name=</span><span class="attrv">"OptionInfer"</span><span> value=</span><span class="attrv">"true"</span>/&gt;
&lt;<span>providerOption</span><span> name=</span><span class="attrv">"WarnAsError"</span><span> value=</span><span class="attrv">"false"</span>/&gt;
&lt;/<span>compiler</span>&gt;
&lt;/<span>compilers</span>&gt;
&lt;/<span>system.codedom</span>&gt;</pre>