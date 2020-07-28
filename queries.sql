-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select p.Id, p.ProductName, p.CategoryId, c.CategoryName
from Product as p
join Category as c 
on p.CategoryId = c.id
order by p.Id

Shows 77 records correctly and in the right order, with proper ID and names.

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select o.OrderDate, o.id, o.CustomerId, c.CompanyName
from [order] as o
join [Customer] as c
on o.CustomerId = c.id
where OrderDate < "2012-08-09"


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select od.OrderId, od.ProductId, od.Quantity, p.ProductName
from OrderDetail as od, Product as p
on p.id = od.ProductId
where od.OrderId = "10251"

----------------

select od.OrderId, od.ProductId, od.Quantity, p.ProductName
from OrderDetail as od 
join Product as p
on od.ProductId = p.Id
where od.OrderId = "10251"



-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.Id, c.CompanyName, e.LastName 
from [Order] as o
join Customer as c, Employee as e
where c.Id = o.CustomerId and o.EmployeeId = e.Id
