DROP TABLE categories;
DROP TABLE tags;
DROP TABLE merchants;
DROP TABLE transactions;
DROP TABLE users;

CREATE TABLE users(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  amount INT4,
  memo VARCHAR(255),
  dates VARCHAR(255), 
  user_id INT4 REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE tags(
  id SERIAL4 PRIMARY KEY,
  tag_name VARCHAR(255),
  transaction_id INT4 REFERENCES transactions(id) ON DELETE CASCADE
);

CREATE TABLE merchants (
  id SERIAL4 PRIMARY KEY,
  merchant_name VARCHAR(255),
  transaction_id INT4 REFERENCES transactions(id) ON DELETE CASCADE
);

CREATE TABLE categories(
  id SERIAL4 PRIMARY KEY,
  category_name VARCHAR(255),
  logo VARCHAR(255),
  transaction_id INT4 REFERENCES transactions(id) ON DELETE CASCADE
);

