
-- 1, Create table statements
-- create table Retailer
CREATE TABLE Retailer(
    Retailer_Id INT(10) NOT NULL,
    Retailer_Name VARCHAR(30) NOT NULL,
    Address1 VARCHAR(30) ,
    City VARCHAR(30) ,
    State VARCHAR(2),
    Zip VARCHAR(10),
--adding constraint for PK
    CONSTRAINT Retailer_PK PRIMARY KEY (Retailer_Id)
);

-- create table Store
CREATE TABLE Store(
    Store_Id INT(10) NOT NULL,
    Store_Name VARCHAR(30) NOT NULL ,
    Retailer_Id INT(10) NOT NULL ,
    Sales_Qty INT(30) NOT NULL ,
--adding constraint for PK and FK
    CONSTRAINT Store_PK PRIMARY KEY (Store_Id),
    CONSTRAINT Store_FK FOREIGN KEY (Retailer_Id) REFERENCES Retailer(Retailer_Id)
);

-- create table Transaction
CREATE TABLE "Transaction"(
    Sequential_Id INT(12) NOT NULL ,
    Qty INT(30) NOT NULL ,
    Scan_Date DATE NOT NULL ,
--adding constraint for PK
    CONSTRAINT Transaction_PK PRIMARY KEY (Sequential_Id)
);


-- create table Transaction type
-- CREATE TABLE Transaction_Type(
--     Sequential_Id INT(12) NOT NULL ,
--     Transaction_Type VARCHAR(2) NOT NULL,
-- --adding constraint for PK and FK
--     CONSTRAINT Transaction_Type_PK PRIMARY KEY (Sequential_Id, Transaction_Type),
--     CONSTRAINT Transaction_Type_FK FOREIGN KEY (Sequential_Id) REFERENCES "Transaction"(Sequential_Id)
-- );

-- create table Item
CREATE TABLE Item(
    UPC_Num INT(12) NOT NULL,
    Vendor_Sku VARCHAR(30) NOT NULL,
    Price NUMERIC(30,2) NOT NULL,
    Description VARCHAR(100),
    Language VARCHAR(10),
    Item_Type VARCHAR(10) NOT NULL,
--adding constraint for PK
    CONSTRAINT Item_PK PRIMARY KEY (UPC_Num)
);

-- create table Item details
CREATE TABLE Item_Details(
    Id INT(12) NOT NULL,
    UPC_Num INT(12) NOT NULL,
    Sequential_Id INT(12) NOT NULL,
--adding constraint for PK and FK
    CONSTRAINT Item_Details_PK PRIMARY KEY (Id),
    CONSTRAINT Item_Details_FK1 FOREIGN KEY (UPC_Num) REFERENCES Item(UPC_Num),
    CONSTRAINT Item_Details_FK2 FOREIGN KEY (Sequential_Id) REFERENCES "Transaction"(Sequential_Id)
);

