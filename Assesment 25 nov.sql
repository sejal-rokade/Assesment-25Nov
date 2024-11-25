create table Products (
    ProductID int primary key,
    ProductName Varchar(50),
    Category varchar(50),
    Price float
)

copy Products from 'D:\DATA ANALYTICS\Data\products.csv' Delimiter ',' CSV Header;

select * from Products
  
create table salespersons (
    SalespersonID int primary key,
    SalespersonName Varchar(50),
    Region Varchar(50)
)

copy salespersons from 'D:\DATA ANALYTICS\Data\salesPersons.csv' Delimiter ',' CSV Header;

select * from salespersons 
  
create table Sales (
    SaleID int primary key,
    QuantitySold int,
    SaleDate date,
	foreign key (ProductID) references Products(ProductID)
	foreign key (SalespersonID) references salespersons(SalespersonID)
    
 )


copy salespersons from 'D:\DATA ANALYTICS\Data\sales.csv' Delimiter ',' CSV Header;

select * from sales

select p.productID,sum(QuantitySold) from sales as s
inner join products as p
or s.SaleID=p.ProductID
group by ProductID

select sa.Region ,sum(QuantitySold) from sales as s
inner join salespersons as sa
or s.SaleID=sa.SalespersonID
group by Region

select sa.SalespersonID ,sum(QuantitySold) from sales as s
inner join salespersons as sa
or s.SaleID=sa.SalespersonID
group by SalespersonID
