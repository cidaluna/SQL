
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

-- 4. Select all the products with a price between $60 and $120. 
SELECT *
FROM
    PRODUCTS
WHERE
    PRICE BETWEEN 60 AND 120
;

-- 5. Select the name and price in cents (i.e., the price must be multiplied by 100). 
SELECT NAME, (PRICE * 100) PRICE_IN_CENTS
FROM
    PRODUCTS
;

-- 6. Compute the average price of all the products. 
SELECT AVG(PRICE)
FROM
    PRODUCTS
;

-- 7. Compute the average price of all products with manufacturer code equal to 2. 
SELECT AVG(PRICE)
FROM
    PRODUCTS
WHERE
    MANUFACTURER = 2
;

-- 8. Compute the number of products with a price larger than or equal to $180. 
SELECT COUNT(PCODE)
FROM
    PRODUCTS
WHERE
    PRICE >= 180
;

-- 9. Select the name and price of all products with a price larger than or equal to $180, and 
-- sort first by price (in descending order), and then by name (in ascending order).
SELECT NAME, PRICE
FROM
    PRODUCTS
WHERE 
    PRICE >= 180
ORDER BY 2 DESC, 1 ASC
;

-- 10. Select all the data from the products, including all the data for each product's manufacturer. 
-- WITH LEFT JOIN
SELECT *
FROM
    PRODUCTS P
LEFT JOIN
    MANUFACTURERS M
ON P.MANUFACTURER = M.MCODE
;

-- WITHOUT LEFT JOIN
SELECT *
FROM
    PRODUCTS P, MANUFACTURERS M
WHERE 
    P.MANUFACTURER = M.MCODE
;

-- 11. Select the product name, price, and manufacturer name of all the products. 
SELECT P.NAME, P.PRICE, M.NAME
FROM
    PRODUCTS P
INNER JOIN
    MANUFACTURERS M
ON P.MANUFACTURER = M.MCODE
;

-- 12. Select the average price of each manufacturer's products, showing only the manufacturer's code. 
