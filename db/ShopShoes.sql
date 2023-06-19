create database ShoesStore

use ShoesStore

create table Users (
	id bigint IDENTITY(1,1) primary key  not null,
	username nvarchar(255) not null unique,
	password nvarchar (255) not null,
	fullname  nvarchar (255) not null,
	email nvarchar (255) not null unique , /* unique : độc nhất*/
	phone varchar(15),
	activated int  default 0,  /* 0 = On, 1 = off*/
	admin int,  /* 0 = Admin, 1 = NhienVien, 2 = Khach hang*/
	address nvarchar(255),
	token varchar(10),
	createdate datetime,
)
create table Orders(
	id bigint IDENTITY(1,1) primary key,
	usernameid bigint,
	address nvarchar(255) not null,
	createdate datetime,
	status int not null, /*0 = wating, 1=delivered, 2=request cancel order */
	totalPrice float,
	foreign key (usernameid)references Users(id)

)
create table Categories(
	id char(10) primary key,
	name nvarchar(255) not null,
)

create table Products(
	id bigint IDENTITY(1,1)  primary key,
	name nvarchar(255) not null,
	price float not null,
	createdate datetime,
	brand nvarchar(50),
	quantity int ,
	description nvarchar(max),
	categoryId char(10)
	foreign key (categoryId)
		references Categories(id) on delete cascade on update cascade
)

create table ProductDetail(
	id bigint IDENTITY(1,1)  primary key,
	productID bigint NOT NULL,
	size varchar(120) NOT NULL,
    color nvarchar(50) NOT NULL,
	foreign key (productID)	references Products(id) on delete cascade on update cascade

)

create table Favorite(
	id bigint IDENTITY(1,1)  primary key,
	productId bigint not null,
	userID bigint not null,
	reviews nvarchar(250) 
	foreign key (productId) references Products(id) on delete cascade on update cascade ,
	foreign key (userID) references Users(id) on delete cascade on update cascade
)

create table OrdersDetails(
	id bigint IDENTITY(1,1)  primary key ,
	orderId bigint ,
	productId bigint not null,
	price float not null,
	size varchar(15),
	color varchar(15),
	img varchar(50),
	quantity int not null ,
	foreign key (productId)	references Products(id) ,
	foreign key (orderId) references Orders(id) on delete cascade on update cascade
)

select Orders.id, sum(OrdersDetails.quantity) as 'total product',orders.createdate, orders.status
from Orders inner join OrdersDetails on Orders.id = OrdersDetails.orderId 
group by Orders.id, orders.status,orders.createdate
having Orders.status = 1 and MONTH(Orders.createdate) = 6

select sum(totalprice) from Orders 
where Orders.status = 1 and MONTH(Orders.createdate) = 6


