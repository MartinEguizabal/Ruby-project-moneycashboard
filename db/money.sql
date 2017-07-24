DROP TABLE transactions;
DROP TABLE tags;

CREATE TABLE tags (
  id SERIAL4 PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL4 PRIMARY KEY,
  merchant VARCHAR(255),
  price FLOAT(3),
  date DATE,
  tag_id INT4
);