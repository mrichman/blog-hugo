---
title: Arbitrary Object Serialization/Deserialization
author: Mark Richman
layout: post
date: 2005-01-06T14:10:00+00:00
url: /arbitrary-object-serializationdeserialization/
avada_post_views_count:
  - 427
categories:
  - Uncategorized

---
I frequently need to store and retrieve object state. I&#8217;ve found the .NET Framework&#8217;s [XmlSerializer][1] invaluable in this capacity. To make my life even easier, I&#8217;ve come up with a pair of functions that serialize and deserialize an arbitrary object to an XML file.

I&#8217;ve stripped out comments, exception handling, etc. for brevity&#8217;s sake.

<span style="color: rgb(102, 102, 102);font-size:85%;" ><span style="font-family:courier new;">public void Serialize(object obj, string path)</span><br /> <br /><span style="font-family:courier new;">{</span><br /> <br /><span style="font-family:courier new;"> XmlSerializer ser = new XmlSerializer(obj.GetType());</span><br /> <br /><span style="font-family:courier new;"> XmlTextWriter writer = new XmlTextWriter(path, System.Text.Encoding.UTF8);</span><br /> <br /><span style="font-family:courier new;"> writer.Formatting = Formatting.Indented;</span><br /> <br /><span style="font-family:courier new;"> ser.Serialize(writer, obj);</span><br /> <br /><span style="font-family:courier new;"> writer.Close(); </span><br /> <br /><span style="font-family:courier new;">}</span></p> 

<p>
  <span style="font-family:courier new;">public object Deserialize(Type type, string path)</span><br /> <br /><span style="font-family:courier new;">{</span><br /> <br /><span style="font-family:courier new;"> object obj = null;</span><br /> <br /><span style="font-family:courier new;"> XmlSerializer ser = new XmlSerializer(type);</span><br /> <br /><span style="font-family:courier new;"> XmlTextReader reader = new XmlTextReader(path);</span><br /> <br /><span style="font-family:courier new;"> obj = ser.Deserialize(reader);</span><br /> <br /><span style="font-family:courier new;"> reader.Close(); </span><br /> <br /><span style="font-family:courier new;"> return obj;</span><br /> <br /><span style="font-family:courier new;">}</span></span>
</p>

<p>
  One noteworthy caveat to this technique is that XmlSerializer will only serialize public instance fields and public properties with <span style="font-weight: bold;">both</span> get and set defined.
</p>

<p>
  Example C# usage:<br /> 
  
  <pre  style="color: rgb(102, 102, 102);font-family:courier new;" class="code"><span style=";font-family:courier new;font-size:85%;"  >public class Address
<br />{
<br />public string Name;
<br />public string Line1;
<br />public string City;
<br />public string State;
<br />public string Zip;
<br />}
<br />
<br />Address a = new Address();
<br />a.Name = "John Doe";
<br />a.Line1 = "123 Main St.";
<br />a.City = "Anytown";
<br />a.State = "NY";
<br />a.Zip = "10900";
<br />
<br />Serialize(a, @"c:tempaddress.xml");
<br />
<br />Address a = Deserialize(typeof(Address), @"c:tempaddress.xml") as Address;
<br /></span>
<br /></pre>
  
  <p>
    Notice I use the &#8220;<a href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/csref/html/vclrfas.asp">as</a>&#8221; keyword instead of casting. I prefer to use this form since it yields null on conversion failure instead of raising a NullReferenceException.
  </p>
  
  <p>
    The resulting XML from the above example looks like:
  </p>
  
  <p>
    <span style="color: rgb(102, 102, 102);font-size:85%;" ><span style="font-family:courier new;"><br /> 
    
    <p>
      <?xml version=&#8221;1.0&#8243; encoding=&#8221;utf-8&#8243;?>
    </p>
    
    <p>
      <Address xmlns:xsd=&#8221;http://www.w3.org/2001/XMLSchema&#8221; xmlns:xsi=&#8221;http://www.w3.org/2001/XMLSchema-instance&#8221;>
    </p>
    
    <p>
      <Name>John Doe</Name>
    </p>
    
    <p>
      <Line1>123 Main St.</Line1>
    </p>
    
    <p>
      <City>Anytown</City>
    </p>
    
    <p>
      <State>NY</State>
    </p>
    
    <p>
      <Zip>10900</Zip>
    </p>
    
    <p>
      </Address>
    </p>
    
    <p>
      </span>
    </p>
    
    <p>
      This stuff gets pretty interesting when dealing with complex object graphs.
    </p>

 [1]: http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfSystemXmlSerializationXmlSerializerClassTopic.asp