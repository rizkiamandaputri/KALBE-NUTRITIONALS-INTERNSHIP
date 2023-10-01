---------------------- NAMA : RIZKI AMANDA PUTRI ----------------------
---------------- KALBE DATA ENGINEER VIRTUAL INTERNSHIP ---------------

-- Table: public.Inventory

-- DROP TABLE IF EXISTS public.Inventory;

CREATE TABLE IF NOT EXISTS public.inventory
(
    item_code char(4) NOT NULL,
    item_name character varying(50) COLLATE pg_catalog.default,
    item_price numeric(20,0),
    item_total numeric,
    CONSTRAINT inventory_pkey PRIMARY KEY (item_code)
)

TABLESPACE pg_default;
ALTER TABLE IF EXISTS public.inventory
    OWNER to postgres;
	
SELECT * FROM inventory

INSERT INTO inventory (item_code, item_name, item_price, item_total)
VALUES
('2341', 'Promag Tablet', '3000', '100'),
('2342', 'Hydro Coco 250ML', '7000', '20'),
('2343', 'Nutrive Benecol 100ML', '20000', '30'),
('2344', 'Blackmores Vit C 500Mg', '95000', '45'),
('2345', 'Entrasol Gold 370G', '90000', '120');
-- ('2346', 'Woods Candy', '5500', '10'); -- TEST DATA TO REMOVE THE LOWEST NUMBER --

SELECT * FROM inventory

-- TASK. 1 : Show 'item_name' that has the highest number in 'item_total' --
-- SELECT item_name, MAX(item_total) AS highest_number
-- FROM inventory
-- GROUP BY item_name;
SELECT item_name FROM inventory
WHERE item_total = (SELECT MAX(item_total) FROM inventory);

-- TASK 2 : Update the 'item_price' of the output of question bullet --
UPDATE inventory SET item_price = '92000'
WHERE item_total = (SELECT MAX(item_total) FROM inventory);

SELECT * FROM inventory;

-- No. 3 : What will happen if we insert another 'item_name' with 'item_code' of 2343 into the table --
INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES ('2343', 'New_Product', '5000', '150');
-- ERROR will happen. Because item_code is PRIMARY KEY, couldn't insert same 'item_code' into another product --

-- No. 4 : Delete the 'item_name' that has the lowest number of 'item_total' --
-- INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
-- VALUES ('2346', 'Woods Candy', '5500', '10'); -> TEST DATA

DELETE FROM inventory
WHERE item_total = (SELECT MIN(item_total) FROM inventory);

SELECT * FROM inventory;

DROP TABLE inventory;

-- TASK 5 :
-- Create 'customer_orders' table

-- Table: public.customer_orders

-- DROP TABLE IF EXISTS public.customer_orders;

CREATE TABLE IF NOT EXISTS public.customer_orders
(
    order_no char(5) NOT NULL,
    purchase_amount char(4) COLLATE pg_catalog.default,
    order_date character varying,
    customer_id char(4),
	salesman_id char(4),
    CONSTRAINT customer_orders_pkey PRIMARY KEY (order_no)
)

TABLESPACE pg_default;
ALTER TABLE IF EXISTS public.customer_orders
    OWNER to postgres;
	
SELECT * FROM customer_orders

INSERT INTO customer_orders (order_no, purchase_amount, order_date, customer_id, salesman_id)
VALUES
('10001', '150', '2022-10-05', '2005', '3002'),
('10009', '270', '2022-09-10', '2001', '3005'),
('10002', '65', '2022-10-05', '2002', '3001'),
('10004', '110', '2022-08-17', '2009', '3003'),
('10007', '948', '2022-09-10', '2005', '3002'),
('10005', '2400', '2022-07-27', '2007', '3001');

SELECT * FROM customer_orders

-- Create a Query to display all customer orders
-- Where purchase amount is less than 100 (<100)
-- OR exclude those orders which 'order_date' is on or greater than 25 Aug 2022 (>25Agt2022)
-- AND 'customer_id' is above 2001

SELECT * FROM customer_orders
WHERE purchase_amount < '100' OR order_date > '2022-08-25' AND customer_id > '2001';