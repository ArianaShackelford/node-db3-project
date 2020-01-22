-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

Select productname , categoryname
    from product as pro
    join category as cat
        on pro.CategoryId = cat.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select id , companyname, orderdate
    from [order] as o
    join shipper as ship
        on o.ShipVia = ship.id
    where orderdate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select orderid, productname, quantity
    from orderdetail as det
    join product as pro
        on det.productid = pro.id
    where orderid = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select id, companyname, lastname
    from [order] as ord
    join customer as cus
        on ord.CustomerId = cus.id
    join employee as emp
        on ord.EmployeeId = emp.id;
