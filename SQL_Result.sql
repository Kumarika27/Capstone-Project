#Table 1#
SELECT 
    *
FROM
    Properties
ORDER BY rental_price ASC;

SELECT 
    city, stste, AVG(rental_price) AS Avg_Rental_Price
FROM
    Properties
GROUP BY city , states;

SELECT 
    address, city, deposit
FROM
    Properties
ORDER BY deposit DESC
LIMIT 5;

SELECT 
    country,
    COUNT(*) AS record_count,
    SUM(deposit) AS deposit_amount
FROM
    Properties
GROUP BY country;

SELECT 
    *
FROM
    Properties
WHERE
    rental_price > (SELECT 
            AVG(rental_price)
        FROM
            Properties);

#Table 2#
SELECT 
    bedrooms, AVG(area) AS Avg_area
FROM
    Properties_2
GROUP BY bedrooms;

SELECT 
    *
FROM
    Properties_2
WHERE
    bedrooms > 1 AND pets = 'Yes';
    
SELECT 
    *
FROM
    Properties_2
ORDER BY (bedrooms + bathrooms) DESC
LIMIT 3;

SELECT 
    bedrooms, bathrooms, COUNT(*) AS record_count
FROM
    Properties_2
GROUP BY bathrooms , bedrooms;

SELECT 
    *
FROM
    Properties_2
WHERE
    pets = 'Yes'
GROUP BY area DESC
LIMIT 1;


#Table 3#
SELECT 
    *
FROM
    Properties_3
WHERE
    washer = 'Yes' AND AC = ' Yes'
ORDER BY Sno;

SELECT 
    *
FROM
    Properties_3
WHERE
    hardwood_floors = 'Yes'
        AND roofdrek = 'No'
        AND storage = 'No'
ORDER BY Sno DESC;

SELECT 
    *
FROM
    Properties_3
WHERE
    (AC = 'Yes') + (parking = 'Yes') + (dishwasher = 'Yes') + (fireplace = 'Yes') >= 4
ORDER BY Sno;

SELECT 
    COUNT(*) AS record_count
FROM
    Properties_3
WHERE
    roofdeck = 'No' AND storage = 'No';
    
SELECT 
    COUNT(CASE
        WHEN parking = 'Yes' THEN 1
    END) AS parking_count,
    COUNT(CASE
        WHEN fireplace = 'Yes' OR dishwasher = 'Yes' THEN 1
    END) AS fireplace_dishwasher_count
FROM
    Properties_3
WHERE
    parking = 'Yes'
        AND (fireplace = 'Yes' OR dishwasher = 'Yes');

# Join SQL Querries#
 SELECT 
    t1.*, t2.*
FROM
    Properties t1
        JOIN
    Properties_2 t2 ON t1.Sno = t2.Sno
WHERE
    ti.area > (SELECT 
            AVG(area)
        FROM
            Properties);
            
 SELECT 
    *
FROM
    Properties
WHERE
    pets = 'Yes'
        AND id IN (SELECT 
            id
        FROM
            Properties_2
        WHERE
            beds > 3);
            
 SELECT 
    t2.*, t3.*
FROM
    Properties_2 t2
        JOIN
    Properties_3 ON t2.Sno = t3.Sno
WHERE
    t2.bedrooms > 2 AND t3.AC = 'present';
    
 SELECT 
    t2.*, t3.*
FROM
    Properties_2
        JOIN
    Properties_3 ON t2.Sno = t3.Sno
WHERE
    t2.pets = 'Yes'
        AND t2.dishwasher = 'Yes';
        
 SELECT 
    t2.*, t3.*
FROM
    Properties_2
        JOIN
    Properties_3 ON t2.Sno = t3.Sno
WHERE
    t2.area = (SELECT 
            MAX(area)
        FROM
            Properties_2)
        AND t3.roofdeck = 'present';
        
 SELECT 
    *
FROM
    Properties
        INNER JOIN
    Properties_2 ON Properties.Sno = Properties_2.Sno;
    
 SELECT 
    t1.*, t2.*, t3.*
FROM
    Properies
        JOIN
    Properties_2 ON ti.Sno = t2.Sno
        JOIN
    Properties_3 ON t1.Sno = t3.Sno
WHERE
    ti.pets = 'Yes'
        AND t1.washer_dryer = 'Yes';
 