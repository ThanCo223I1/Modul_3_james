use Storo_4Mens;
create table Categories(
category_id int auto_increment not null,
category_name varchar(30),
primary key (category_id)
);
create table Brands(
brand_id int auto_increment not null,
brand_name varchar(30),
primary key(brand_id)
);
create table Products(
product_id int auto_increment not null,
product_name varchar(30),
category_id int,
brand_id int,
price float,
descriptionas varchar(300), -- Mô tả sản phẩm
image_url varchar(100),
primary key(product_id),
foreign key(brand_id) references Brands(brand_id),
foreign key(category_id) references Categories(category_id)
);
create table Customers(
customer_id int auto_increment not null,
customer_name varchar(30),
email varchar(30),
address varchar(30),
phone varchar(30),
primary key (customer_id)
);
create table Orders(
order_id int auto_increment not null,
customer_id int,
order_date datetime,
total_amount float default 0,
primary key (order_id),
foreign key(customer_id) references Customers(customer_id)
);
create table Order_Items(
order_item_id int auto_increment not null,
order_id int,
product_id int ,
quantity int,
price float,
primary key (order_item_id),
foreign key (order_id) references Orders(order_id),
foreign key (product_id) references Products(product_id)
);
create table Reviews( -- Dánh Giá
review_id int auto_increment not null,
product_id int, 
customer_id int, 
rating int ,
comments varchar (60),
primary key (review_id),
foreign key (product_id) references Products(product_id),
foreign key (customer_id) references Customers(customer_id)
);