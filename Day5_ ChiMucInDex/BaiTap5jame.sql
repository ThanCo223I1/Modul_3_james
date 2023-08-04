use BTView_Index_Store_Procedure;
create table Products(
Id int primary key auto_increment,
productCode int, -- ma
productName varchar(60), -- ten
productPrice float, -- gia 
productAmount int, -- so luong
productDescription varchar(300), -- mo ta 
productStatus int 
);
select * from Products;	
insert into Products values (1,222, "Quan Jean",200.000,100,"Chất liệu co giãn, from rộng", 1);
insert into Products(productCode,productName,productPrice,productAmount,productDescription,productStatus) 
values (333, "Quần Tây",400.000,100,"Chất liệu co giãn, from rộng", 2);
insert into Products(productCode,productName,productPrice,productAmount,productDescription,productStatus) 
values (444, "Quần kaki",100.000,100,"Chất liệu co giãn, from rộng", 1);

-- Bước 3: Tạo chỉ mục index. cho productCode:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX index_productCode  ON Products(productCode);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE INDEX idx_ProductName_ProductPrice ON Products (productName, productPrice);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT * FROM Products WHERE productCode = 222;


-- Bước 4: 
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW ProductInfo AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;
-- Tiến hành sửa đổi view:
ALTER VIEW ProductInfo
AS
SELECT productCode, productName, productPrice, productStatus AS newProductStatus
FROM Products;
-- Tiến hành xoá view:
DROP VIEW IF EXISTS ProductInfo;


-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT *
    FROM Products;
END//
DELIMITER ;


-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE AddProduct(
    IN p_productCode INT,
    IN p_productName VARCHAR(60),
    IN p_productPrice FLOAT,
    IN p_productAmount INT,
    IN p_productDescription VARCHAR(300),
    IN p_productStatus INT)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_productCode, p_productName, p_productPrice, p_productAmount, p_productDescription, p_productStatus);
END;


-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE UpdateProduct(
    IN p_productId INT,
    IN p_productCode INT,
    IN p_productName VARCHAR(60),
    IN p_productPrice FLOAT,
    IN p_productAmount INT,
    IN p_productDescription VARCHAR(300),
    IN p_productStatus INT
)
BEGIN
    UPDATE Products
    SET productCode = p_productCode,
        productName = p_productName,
        productPrice = p_productPrice,
        productAmount = p_productAmount,
        productDescription = p_productDescription,
        productStatus = p_productStatus
    WHERE Id = p_productId;
END;


-- Tạo store procedure xoá sản phẩm theo id:
DELIMITER //
CREATE PROCEDURE DeleteProduct(
    IN p_productId INT
)
BEGIN
    DELETE FROM Products
    WHERE Id = p_productId;
END;