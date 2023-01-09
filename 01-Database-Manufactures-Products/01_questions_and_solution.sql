
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
SELECT AVG(PRICE), MANUFACTURER
FROM
    PRODUCTS
GROUP BY MANUFACTURER
;

-- 13. Select the average price of each manufacturer's products, showing the manufacturer's name. 
-- WITH INNER JOIN
SELECT AVG(P.PRICE), M.NAME
FROM
    PRODUCTS P
INNER JOIN
    MANUFACTURERS M 
ON
    P.MANUFACTURER = M.MCODE
GROUP BY M.NAME
;

-- WITHOUT INNER JOIN
SELECT AVG(P.PRICE), M.NAME
FROM
    PRODUCTS P, MANUFACTURERS M 
WHERE
    P.MANUFACTURER = M.MCODE
GROUP BY M.NAME
;

-- 14. Select the names of manufacturer whose products have an average price larger than or equal to $150. 
SELECT M.NAME, AVG(P.PRICE)
FROM
    MANUFACTURERS M
INNER JOIN
    PRODUCTS P 
ON
    M.MCODE = P.MANUFACTURER
GROUP BY M.NAME
HAVING AVG(P.PRICE) >= 150
;

-- 15. Select the name and price of the cheapest product. 
SELECT NAME, MIN(PRICE)  -- VERIFY
FROM
    PRODUCTS
;

-- WITH A NESTED SELECT (SELECT ANINHADO)
-- IF THERE IS MORE THAN ONE ITEM WITH THE CHEAPEST PRICE IT WILL SELECT THEM BOTH.
SELECT NAME, PRICE
FROM
    PRODUCTS
WHERE PRICE = (SELECT MIN(PRICE) FROM PRODUCTS)
;

-- 16. Select the name of each manufacturer along with the name and price of its most expensive product.
-- WITH A NESTED SELECT (SELECT ANINHADO) WITHOUT INNER JOIN
SELECT M.NAME, P.NAME, P.PRICE
FROM
    MANUFACTURERS M, PRODUCTS P
WHERE M.MCODE = P.MANUFACTURER
AND P.PRICE = (SELECT MAX(P.PRICE) FROM PRODUCTS P WHERE P.MANUFACTURER = M.MCODE)  -- TO DO TEST WITH THIS WHERE
;

-- WITH A NESTED SELECT AND INNER JOIN
SELECT M.NAME, P.NAME, P.PRICE
FROM
    PRODUCTS P 
INNER JOIN
    MANUFACTURERS M 
ON P.MANUFACTURER = M.MCODE
AND P.PRICE = (SELECT MAX(P.PRICE) FROM PRODUCTS P WHERE P.MANUFACTURER = M.MCODE) -- TO DO TEST WITH AND WITHOUT THIS WHERE
;


-- 17. Select the name of each manufacturer which have an average price above $145 and contain at least 2 different products. 
SELECT M.NAME, AVG(P.PRICE), COUNT(P.PCODE)  -- TODO: TESTAR SEM PASSAR FUNÇÕES NO SELECT
FROM
    MANUFACTURERS M
INNER JOIN
    PRODUCTS P
ON M.MCODE = P.MANUFACTURER
HAVING AVG(P.PRICE) >= 145 
AND
COUNT(P.PCODE) >= 2;


-- 18. Add a new product: Loudspeakers, $70, manufacturer 2. 
INSERT INTO PRODUCTS
VALUES (11, 'LOUDSPEAKERS',70.0, 2);  -- TODO: TESTAR CASAS DECIMAIS


-- 19. Update the name of product 8 to "Laser Printer". 
UPDATE PRODUCTS
SET NAME = 'LASER PRINTER'
WHERE PCODE = 8
;


-- 20. Apply a 10% discount to all products. 


-- 21. Apply a 10% discount to all products with a price larger than or equal to $120. 