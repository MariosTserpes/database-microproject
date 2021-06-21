---DELETE queries
DELETE rentals
WHERE rent_id = 1

DELETE customers
WHERE id_number = "A3023432"

DELETE payments 
WHERE payment_id = 3

---Update queries
UPDATE motorcycles
SET color = "Black",
    brand = "Kawasaki"
WHERE licence_plate = "LIF06450"

UPDATE stores
SET telephone = "+030 210 5787131"
WHERE store_id = "800870578"

UPDATE customers 
SET licence_categ = "A2"
WHERE licence_categ = "A1" 
     AND country_residence != "Greece"



---Select queries
SELECT *
FROM rentals

-------------------------------------------------
SELECT m.licence_plate, m.brand, m.categ_id, m.store_id
FROM motorcycles m
WHERE m.store_id = "800000927"

-------------------------------------------------
SELECT r.rent_id, r.rental_cost, r.receipt_date
FROM rentals r
WHERE r.rental_cost >= 200
ORDER BY r.rental_cost DESC

-------------------------------------------------
SELECT c.first_name, c.last_name, c.country_residence
FROM customers c
WHERE c.country_residence = "Greece" 
      AND licence_categ != "A1"

-------------------------------------------------
SELECT DISTINCT c.first_name, c.last_name, c.phone, r.rental_cost, s.city
FROM customers c, stores s, rentals r, motorcycles m, moto_categories ca
WHERE ca.categ_name = "Enduro"
      AND m.categ_id = ca.categ_id
      AND s.store_id = m.store_id
      AND r.licence_plate = m.licence_plate
      AND c.id_number = r.id_number 
ORDER BY r.rental_cost ASC

-------------------------------------------------
SELECT COUNT(r.rent_id) AS Number_of_rentals,
         SUM(r.rental_cost) AS Total
FROM rentals r
WHERE r.rent_id != 3

-------------------------------------------------
SELECT m.brand, 
       COUNT(m.licence_plate) AS Number_of_motors,
       MAX(m.Cc) AS Max_Cc
FROM motorcycles m
WHERE m.color = "red"
GROUP BY m.brand
HAVING COUNT(m.licence_plate) >= 2


------------------UNION-------------------------------

SELECT c.first_name, c.last_name,
FROM customers c JOIN rentals r ON c.id_number = r.id_number
     JOIN motorcycles m ON r.licence_plate = m.licence_plate
WHERE m.color = "Black"
UNION
SELECT c.first_name, c.last_name,
FROM customers c JOIN rentals r ON c.id_number = r.id_number
     JOIN motorcycles m ON r.licence_plate = m.licence_plate
WHERE m.color = "Red"


---------------INTERSECT-------------------------------
SELECT c.id_number
FROM customers c, motorcycles m, rentals r
WHERE c.id_number = r.id_number 
      AND m.licence_plate = r.licence_plate
      AND m.Cc BETWEEN 0 AND 250
INTERSECT 
SELECT c.id_number
FROM customers c, motorcycles m, rentals r
WHERE c.id_number = r.id_number 
      AND m.licence_plate = r.licence_plate
      AND m.Cc > 500


--------------EXCEPT/MINUS-------------------------------

SELECT c.phone, c.country_residence
FROM customers c JOIN rentals r ON c.id_number = r.id_number
     JOIN motorcycles m ON m.licence_plate = r.licence_plate
     JOIN moto_categories ca ON ca.categ_id = m.categ_id 
EXCEPT
SELECT c.phone, c.country_residence
FROM customers c JOIN rentals r ON c.id_number = r.id_number
     JOIN motorcycles m ON m.licence_plate = r.licence_plate
     JOIN moto_categories ca ON ca.categ_id = m.categ_id 
WHERE ca.categ_name = "Enduro"