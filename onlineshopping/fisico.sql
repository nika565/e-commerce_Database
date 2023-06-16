drop database online_shopping;
create database online_shopping;
use online_shopping;



CREATE TABLE Deliver_To (
addrid INT(11),
orderNumber INT(11),
timeDelivered DATE,
primary key (addrid, orderNumber)
);

CREATE TABLE Buyer (
userid INT(11) PRIMARY KEY
);

CREATE TABLE After_Sales_Service_At (
brand VARCHAR(32),
servicePoint INT(11),
primary key (brand, servicePoint)
);

CREATE TABLE BankCard (
cardNumber char(19) PRIMARY KEY,
userid INT(11),
expiryDate DATE,
bank VARCHAR(64)
);

CREATE TABLE CreditCard (
cardNumber char(19) PRIMARY KEY,
organization VARCHAR(64)
);

CREATE TABLE Payment (
orderNumber INT(11),
cardNumber char(19),
payTime DATE,
primary key (orderNumber, cardNumber),
FOREIGN KEY(cardNumber) REFERENCES CreditCard (cardNumber)
);

CREATE TABLE Orders (
orderNumber INT(11) PRIMARY KEY,
paymentStatus ENUM('Paid', 'Unpaid'),
creationTime DATE,
totalAmount DECIMAL(8,2)
);

CREATE TABLE Contain (
orderNumber INT(11),
itemid INT(11),
quantity TINYINT(4),
primary key (orderNumber, itemid),
FOREIGN KEY(orderNumber) REFERENCES Orders (orderNumber)
);

CREATE TABLE users (
userid INT(11) PRIMARY KEY,
name VARCHAR(64),
phoneNumber VARCHAR(20)
);

CREATE TABLE DebitCard (
cardNumber char(19) PRIMARY KEY
);

CREATE TABLE Seller (
userid INT(11) PRIMARY KEY
);

CREATE TABLE Address (
addrid INT(11) PRIMARY KEY,
userid INT(11),
name VARCHAR(64),
contactPhoneNumber VARCHAR(20),
city VARCHAR(64),
province VARCHAR(64),
streetAddr VARCHAR(64),
postalCode VARCHAR(16),
FOREIGN KEY(userid) REFERENCES users (userid)
);

CREATE TABLE Store (
sid INT(11) PRIMARY KEY,
name VARCHAR(64),
province VARCHAR(64),
city VARCHAR(64),
streetAddr VARCHAR(64),
customerGrade ENUM('0', '1', '2', '3', '4', '5'),
startTime DATE
);

CREATE TABLE Product (
pid INT(11) PRIMARY KEY,
sid INT(11),
brand VARCHAR(32),
name VARCHAR(128),
type VARCHAR(32),
modelNumber VARCHAR(16),
colour VARCHAR(32),
amount TINYINT(4),
price DECIMAL(8,2),
FOREIGN KEY(sid) REFERENCES Store (sid)
);


CREATE TABLE Comments (
date DATE,
userid INT(11),
pid INT(11),
rating DECIMAL(2,1),
review VARCHAR(2048),
primary key (userid, pid),
FOREIGN KEY(userid) REFERENCES users (userid),
FOREIGN KEY(pid) REFERENCES Product (pid)
);

CREATE TABLE ServicePoint (
id INT(11) PRIMARY KEY,
streetAddr VARCHAR(64),
city VARCHAR(64),
province VARCHAR(64),
openingTime VARCHAR(8),
closingTime VARCHAR(8)
);

CREATE TABLE Brand (
`name` VARCHAR(32) PRIMARY KEY
);

CREATE TABLE OrderItem (
itemid INT(11) PRIMARY KEY,
pid INT(11),
price DECIMAL(8,2),
creationTime DATE,
FOREIGN KEY(pid) REFERENCES Product (pid)
);

CREATE TABLE Manage (
userid INT(11),
sid INT(11),
setupTime DATE,
primary key (userid, sid),
FOREIGN KEY(userid) REFERENCES users (userid),
FOREIGN KEY(sid) REFERENCES Store (sid)
);

CREATE TABLE Save_to_Shopping_Cart (
userid INT(11),
pid INT(11),
addTime DATE,
quantity TINYINT(4),
primary key (userid, pic),
FOREIGN KEY(userid) REFERENCES users (userid),
FOREIGN KEY(pid) REFERENCES Product (pid)
);

ALTER TABLE Deliver_To ADD FOREIGN KEY(addrid) REFERENCES Address (addrid);
ALTER TABLE Deliver_To ADD FOREIGN KEY(orderNumber) REFERENCES Orders (orderNumber);
ALTER TABLE After_Sales_Service_At ADD FOREIGN KEY(servicePoint) REFERENCES ServicePoint (id);
ALTER TABLE BankCard ADD FOREIGN KEY(userid) REFERENCES users (userid);
ALTER TABLE Payment ADD FOREIGN KEY(orderNumber) REFERENCES Orders (orderNumber);
ALTER TABLE Contain ADD FOREIGN KEY(itemid) REFERENCES OrderItem (itemid);
alter table Product add foreign key (brand) references Brand(`name`);

select * from product where type = 'laptop';