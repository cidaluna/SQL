
--
-- 1. Select the names of all the products in the store. 

SELECT NAME
FROM
    PRODUCTS
;

-- 2. Select the names and the prices of all the products in the store.
SELECT NAME, PRICE
FROM
    PRODUCTS;


-- 3. Select the name of the products with a price less than or equal to $200. 
SELECT NAME
FROM
    PRODUCTS
WHERE
    PRICE <= 200
;
