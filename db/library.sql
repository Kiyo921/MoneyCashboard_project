DROP TABLE transactions
DROP TABLE users

CREATE TABLE users(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  amount INT4,
  memo VARCHAR(255),
  tag VARCHAR(255),
  user_id INT4 references users(id) ON DELETE CASCADE
);
