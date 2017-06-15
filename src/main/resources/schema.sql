CREATE TABLE flowers (
  id INT PRIMARY KEY,
  type ENUM('bouquet', 'pot'),
  price INT
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

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY ,
  clientId INT,
  time DATETIME,
  status ENUM('completed', 'active'),

  CONSTRAINT ORDERS_CLIENT_ID_FK FOREIGN KEY (clientId) REFERENCES clients(phone)
);

CREATE TABLE orderDetails (
  orderId INT,
  flowerId INT,

  CONSTRAINT ORDER_DETAILS_ORDER_ID_FK FOREIGN KEY (orderId) REFERENCES orders(id),
  CONSTRAINT ORDER_DETAILS_FLOWER_ID_FK FOREIGN KEY (flowerId) REFERENCES flowers(id),

  PRIMARY KEY (orderId, flowerId)
);

CREATE TABLE responses (
  orderId INT,
  responce NVARCHAR(4096),

  CONSTRAINT RESPONSES_ORDER_ID_FK FOREIGN KEY (orderId) REFERENCES orders(id),

  PRIMARY KEY(orderId)
)

