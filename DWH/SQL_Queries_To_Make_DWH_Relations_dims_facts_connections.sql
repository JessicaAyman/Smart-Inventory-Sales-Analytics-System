-- first step : determine the PK in each Dim

-- 1.
ALTER TABLE Dim_City 
ALTER COLUMN City_ID INT NOT NULL;

ALTER TABLE Dim_City
ADD CONSTRAINT PK_Dim_City PRIMARY KEY (City_ID);


-- 2.
ALTER TABLE Dim_Customer 
ALTER COLUMN Customer_ID INT NOT NULL;

ALTER TABLE Dim_Customer 
ADD CONSTRAINT PK_Dim_Customer PRIMARY KEY (Customer_ID);

-- 3.
ALTER TABLE Dim_Employee
ALTER COLUMN EmployeeID INT NOT NULL;

ALTER TABLE Dim_Employee 
ADD CONSTRAINT PK_Dim_Employee PRIMARY KEY (EmployeeID);

-- 4.
ALTER TABLE Dim_Product 
ALTER COLUMN Product_ID INT NOT NULL;

ALTER TABLE Dim_Product
ADD CONSTRAINT PK_Dim_Product PRIMARY KEY (Product_ID);

-- 5.
ALTER TABLE Dim_Supplier
ALTER COLUMN Supplier_ID INT NOT NULL;

ALTER TABLE Dim_Supplier
ADD CONSTRAINT PK_Dim_PSupplier PRIMARY KEY (Supplier_ID);

-------------------------------------------------------------------------------

--- step2 : connect relation between dim tables and Fact tables:

--1. Fact_Orders

--with Product
ALTER TABLE Fact_Orders
ADD CONSTRAINT FK_FactOrders_DimProduct
FOREIGN KEY (Product_ID) REFERENCES Dim_Product(Product_ID);

--with Customer
ALTER TABLE Fact_Orders
ADD CONSTRAINT FK_FactOrders_DimCustomer 
FOREIGN KEY (Customer_ID) REFERENCES Dim_Customer(Customer_ID);

--with Employee
ALTER TABLE Fact_Orders
ADD CONSTRAINT FK_FactOrders_DimEmployee 
FOREIGN KEY (Employee_ID) REFERENCES Dim_Employee(EmployeeID);

--2. Fact_InventoryMovenents

--with Product
ALTER TABLE Fact_InventoryMovements
ADD CONSTRAINT FK_InventoryMovements_DimProduct
FOREIGN KEY (Product_ID) REFERENCES Dim_Product(Product_ID);

--with Supplier
ALTER TABLE Fact_InventoryMovements
ADD CONSTRAINT FK_InventoryMovements_DimSupplier
FOREIGN KEY (Supplier_ID) REFERENCES Dim_Supplier(Supplier_ID);

--with Customer
ALTER TABLE Fact_InventoryMovements
ADD CONSTRAINT FK_InventoryMovements_DimCustomer
FOREIGN KEY (Customer_ID) REFERENCES Dim_Customer(Customer_ID);

-- 3.Fact_Inventory
--with Product
ALTER TABLE Fact_Inventory
ADD CONSTRAINT FK_Inventory_DimProduct 
FOREIGN KEY (Product_ID) REFERENCES Dim_Product(Product_ID);

--4.Fact_Transactions

--with customer
 ALTER TABLE Fact_Transactions
ADD CONSTRAINT FK_FactTransactions_DimCustomer 
FOREIGN KEY (Customer_ID) REFERENCES Dim_Customer(Customer_ID);

-- with supplier 
ALTER TABLE Fact_Transactions
ADD CONSTRAINT FK_FactTransactions_DimSupplier 
FOREIGN KEY (Supplier_ID) REFERENCES Dim_Supplier(Supplier_ID);

----------------------------------------------------------------

--step3 : connect relation between dim tables and dim tables:

--1. city dim with customer dim
ALTER TABLE Dim_Customer
ADD CONSTRAINT FK_DimCustomer_DimCity 
FOREIGN KEY (City_ID) REFERENCES Dim_City(City_ID);

--2. city dim with suplier dim
ALTER TABLE Dim_Supplier
ADD CONSTRAINT FK_DimSupplier_DimCity 
FOREIGN KEY (City_ID) REFERENCES Dim_City(City_ID);