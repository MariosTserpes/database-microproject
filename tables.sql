
---Categories table
CREATE TABLE moto_categories(
categ_id INTEGER NOT NULL,
Description VARCHAR(20),
categ_name VARCHAR(20),
PRIMARY KEY(categ_id)
);


---Stores table
CREATE TABLE stores(
store_id INTEGER NOT NULL,
telephone VARCHAR(30),
street VARCHAR(30),
street_number VARCHAR(4),
city VARCHAR(20),
PRIMARY KEY(store_id)
);


---Motorcycles table
CREATE TABLE motorcycles(
licence_plate VARCHAR(10),
color VARCHAR(20),
Cc REAL,
construction_date DATE,
brand VARCHAR(20),
model VARCHAR(20),
categ_id INTEGER,
store_id INTEGER,
PRIMARY KEY(licence_plate),
FOREIGN KEY(categ_id) REFERENCES moto_categories(categ_id),
FOREIGN KEY(store_id) REFERENCES stores(store_id)
);

---Customers table
CREATE TABLE customers(
id_number VARCHAR(10) NOT NULL,
email VARCHAR(40),
first_name VARCHAR(30),
last_name VARCHAR(30),
phone VARCHAR(20),
country_residence VARCHAR(40),
street_res VARCHAR(40),
number_res VARCHAR(40),
zip_code VARCHAR(10),
licence_categ VARCHAR(3),
PRIMARY KEY(id_number)
);

---Rentals table
CREATE TABLE rentals(
rent_id INTEGER NOT NULL,
rental_cost DECIMAL(6,2),
receipt_date DATE,
return_date DATE,
licence_plate VARCHAR(10),
id_number VARCHAR(10) NOT NULL,
PRIMARY KEY(rent_id),
FOREIGN KEY(licence_plate) REFERENCES motorcycles(licence_plate),
FOREIGN KEY(id_number) REFERENCES customers(id_number)
);

---Payments table
CREATE TABLE payments(
payment_id INTEGER NOT NULL,
deposit DECIMAL(6,2),
quittance DECIMAL(6,2),
rent_id INTEGER NOT NULL,
PRIMARY KEY(payment_id),
FOREIGN KEY(rent_id) REFERENCES rentals(rent_id)
);

---Installments table 
CREATE TABLE installments(
inst_id INTEGER NOT NULL,
installment_amount DECIMAL(6,2),
payment_id INTEGER NOT NULL,
PRIMARY KEY(inst_id),
FOREIGN KEY(payment_id) REFERENCES payments(payment_id)
);






