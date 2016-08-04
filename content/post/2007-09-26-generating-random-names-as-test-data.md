---
title: Generating Random Names as Test Data
author: Mark Richman
layout: post
date: 2007-09-26T05:05:00+00:00
url: /generating-random-names-as-test-data/
avada_post_views_count:
  - 560
categories:
  - Tools
tags:
  - census
  - data
  - excel
  - openoffice
  - spreadsheet
  - test

---
Ever need to generate thousands of names to use as test data?

I just created an Excel sheet that uses the <a href="http://www.census.gov/genealogy/names/names_files.html" target="_blank">1990 US census data</a> to generate random male and female names.

Columns:
  
A: Male First Name
  
B: Female First Name
  
C: Last Name
  
E: Male Full Name (Proper Case)
  
F: Female Full (Proper Case)

Columns A,B,C are ordered by descending popularity. It’s limited to 65,536 names (an Excel limitation), but this should work for seeding names in just about any database you’ll need.

_I&#8217;ve also verified this to work in OpenOffice.org Spreadsheet 2.4._

[**DOWNLOAD HERE**][1]

 [1]: http://www.markrichman.com/Names.zip