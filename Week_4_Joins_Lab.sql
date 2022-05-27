/*
 Question 1
 Which customers have never placed an order?

 Hint:  Use a LEFT JOIN
 */

SELECT
    *
FROM customers c
LEFT JOIN orders o
ON c."CustomerID" = o."CustomerID"
WHERE
    o."CustomerID" IS NULL;

/*
 Question 2
 Which employees have never made a sale?

 Hint:  Use a LEFT JOIN
 Query should be very similar to Q1
 */

SELECT
    *
FROM employees e
LEFT JOIN orders o
ON e."EmployeeID" = o."EmployeeID"
WHERE
    o."EmployeeID" IS NULL;

/*
Question 3
What is the last date each product sold?
Provide Columns:
- ProductID
- ProductName
- Discontinued
- LastOrderedDate  (you will derive this one)

Hint:
Join orders, order_details, and products.  Take the MAX of the OrderDate
 */

SELECT
    p."ProductID",
    p."ProductName",
    p."Discontinued",
    MAX(o."OrderDate") AS LastOrderedDate
FROM orders o
INNER JOIN order_details od ON o."OrderID" = od."OrderID"
LEFT JOIN products p on od."ProductID" = p."ProductID"
GROUP BY 1,2,3
ORDER BY 4;


/*
Question 4
Which customers haven't placed an order since 1997 (i.e. last order placed was on or before 1996-12-31)?
Include customers that have never placed an order.

Hint:  Modify your Q1, but use a LEFT JOIN with a subquery filtered to orders 1997 and later
*/

SELECT
    *
FROM customers c
LEFT JOIN (
    SELECT *
    FROM orders o
    WHERE "OrderDate" >= '1997-01-01'
) o
ON c."CustomerID" = o."CustomerID"
WHERE
    o."CustomerID" IS NULL;

/*
Question 5

Create the following table:
OrderID, ProductName, TotalCost

Where TotalCost is calculated as UnitPrice * Quantity * (1 - Discount)

Hint:  Use order_details and products
*/

SELECT
    od."OrderID",
    p."ProductName",
    od."UnitPrice" * od."Quantity" * (1 - "Discount") AS TotalCost
FROM order_details od
LEFT JOIN products p on od."ProductID" = p."ProductID";

/*
Question 6

What are the top 10 products by sales?  Use the "TotalCost" calculation from Q3 for sales.
Show the ProductID, ProductName, and TotalSales

Hint:  Use order_details and products
*/

SELECT
    p."ProductID",
    p."ProductName",
    SUM(od."UnitPrice" * od."Quantity" * (1 - "Discount")) AS TotalSales
FROM order_details od
LEFT JOIN products p on od."ProductID" = p."ProductID"
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 10;

/*
Question 7

Which country orders the most of the number 1 selling product by total sales? (Use Country from the customers table)
Try to write this query dynamically (not hard coding the #1 product), such that if the number 1 selling product were
to change in the future, the query would still work.

Hint:
You will need to join orders, customers, and order_details
In addition, use an inner join with the number one selling product (use modified Q4 query) to filter to the top product's orders only
Then aggregate by Country in the customers table.
*/

SELECT
    c."Country",
    p."ProductName",
    SUM(od."UnitPrice" * od."Quantity" * (1 - "Discount")) AS total_sales
FROM orders o
INNER JOIN customers c ON o."CustomerID" = c."CustomerID"
INNER JOIN order_details od on o."OrderID" = od."OrderID"
INNER JOIN (
    SELECT
        p."ProductID",
        p."ProductName",
        SUM(od."UnitPrice" * od."Quantity" * (1 - "Discount")) AS TotalSales
    FROM order_details od
    LEFT JOIN products p on od."ProductID" = p."ProductID"
    GROUP BY 1,2
    ORDER BY 3 DESC
    LIMIT 1
    ) p
ON od."ProductID" = p."ProductID"
GROUP BY 1,2
ORDER BY 3 DESC;
