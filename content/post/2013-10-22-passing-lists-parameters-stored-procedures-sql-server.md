---
title: Passing Lists as Parameters to Stored Procedures in SQL Server
author: Mark Richman
layout: post
date: 2013-10-22T17:17:19+00:00
url: /passing-lists-parameters-stored-procedures-sql-server/
categories:
  - SQL
---
There is no good way to do this in SQL Server. Someday they will have an [array datatype like PostgreSQL][1].

In SQL Server 2005 and higher, this can be done using XML, but I don’t particularly see the need for the overhead. Use the function below to split a delimited string and select from the returned table. Its also very helpful for reporting.

```
CREATE FUNCTION [dbo].[SplitList] (@list VARCHAR(MAX), @separator VARCHAR(MAX) = ';')
RETURNS @table TABLE (Value VARCHAR(MAX))
AS BEGIN
  DECLARE @position INT, @previous INT
  SET @list = @list + @separator
  SET @previous = 1
  SET @position = CHARINDEX(@separator, @list)
  WHILE @position > 0 
  BEGIN
    IF @position - @previous > 0
      INSERT INTO @table VALUES (SUBSTRING(@list, @previous, @position - @previous))
    IF @position >= LEN(@list) BREAK
      SET @previous = @position + 1
      SET @position = CHARINDEX(@separator, @list, @previous)
  END
  RETURN
END
```

To use this function, simply pass your list, and specify the desired delimiter:

`SELECT * FROM dbo.SplitList('1,2,3,4,5', ',')`

This comes in handy when trying to report on, say, all unique customer emails who purchased a subset of SKUs in the past two days:

```
DECLARE @tbl TABLE (id VARCHAR(7));
INSERT @tbl SELECT * FROM dbo.SplitList('SKU1234,SKU2345,SKU3456,SKU4567', ',');

SELECT DISTINCT(LTRIM(RTRIM(c.email)))
FROM CMS o
INNER JOIN ITEMS i ON (o.ORDERNO = i.ORDERNO)
INNER JOIN CUST c ON (c.CUSTNUM = o.CUSTNUM)
WHERE i.ITEM IN (SELECT id FROM @tbl)
AND o.ODR_DATE >= DATEADD(day,-2,GETDATE())
AND LEN(c.email) > 0
AND c.email IS NOT NULL
AND c.email NOT LIKE '%@example.com'
```

Why use this technique? Performance. You make one call to the database. For the detractors of this design pattern, I ask: why would it be a bad idea to pass a collection to a stored procedure? Is it a bad idea in .NET to pass a collection as an argument to a method?

[1]: http://www.postgresql.org/docs/9.1/static/arrays.html