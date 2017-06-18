CREATE TABLE goods (
  id INT PRIMARY KEY,
  type ENUM('bouquet', 'pot', 'composition', 'flower', 'package'),
  price INT,
  flowers NVARCHAR(400)
);

CREATE TABLE clients (
  phone INT PRIMARY KEY ,
  fio NVARCHAR(100),
  address NVARCHAR(300)
);

CREATE TABLE administrators (
  id int,
  fio NVARCHAR(100),
  passwordHash NVARCHAR(300)
);

CREATE TABLE transport (
  id INT PRIMARY KEY,
  type ENUM('courier', 'shop'),
  price INT
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY ,
  clientId INT,
  onlinePayment BOOLEAN,
  transport INT,
  time DATETIME,
  address NVARCHAR(4096),
  status ENUM('unpaid', 'active', 'completed'),

  CONSTRAINT ORDERS_CLIENT_ID_FK FOREIGN KEY (clientId) REFERENCES clients(phone),
  CONSTRAINT ORDERS_TRANSPORT_TYPE_FK FOREIGN KEY (transport) REFERENCES transport(id)
);

CREATE TABLE orderDetails (
  orderId INT,
  flowerId INT,
  count INT,
  package BOOLEAN,

  CONSTRAINT ORDER_DETAILS_ORDER_ID_FK FOREIGN KEY (orderId) REFERENCES orders(id),
  CONSTRAINT ORDER_DETAILS_FLOWER_ID_FK FOREIGN KEY (flowerId) REFERENCES goods (id),

  PRIMARY KEY (orderId, flowerId)
);

CREATE TABLE responses (
  orderId INT,
  responce NVARCHAR(4096),

  CONSTRAINT RESPONSES_ORDER_ID_FK FOREIGN KEY (orderId) REFERENCES orders(id),

  PRIMARY KEY(orderId)
);

CREATE TABLE special (
  id INT AUTO_INCREMENT PRIMARY KEY,
  filter NVARCHAR(500),
  endTime DATETIME,
  newPrice INT,
  description NVARCHAR(500)
);