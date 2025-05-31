CREATE DATABASE flowersDB;


CREATE TABLE Flowers (
    flower_id INT PRIMARY KEY NOT NULL,
    flower_name VARCHAR(50),
    category VARCHAR(80),
    supplier VARCHAR(100),
    price_per_stem DECIMAL(5,2),
    seller VARCHAR(100)
);

CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY NOT NULL,
    flower_id INT NOT NULL,
    quantity INT,
    last_restock DATE,
    notes VARCHAR(100),
    FOREIGN KEY (flower_id) REFERENCES Flowers(flower_id)
);

INSERT INTO Flowers (flower_id, flower_name, category, supplier, price_per_stem, seller) VALUES
(1, 'Rose', 'Cut Flower', NULL, 30, NULL ),
(2, 'Tulip', 'Imported Flower', NULL, 100, NULL),
(3, 'Daisy', 'Cut Flower', NULL, 40, NULL),
(4, 'Carnation', 'Cut Flower', NULL, 25, NULL),
(5, 'Chrysanthemum', 'Cut Flower', NULL,  20, NULL),
(6, 'Stargazer Lily', 'Premium Flower', NULL,  100, NULL),
(7, 'Anthurium', 'Tropical Flower', NULL,  50, NULL),
(8, 'Babys Breath', 'Filler Flower', NULL,  10, NULL),
(9, 'Sunflower', 'Cut Flower', NULL,  80, NULL),
(10, 'Malaysian Mums', 'Cut Flower', NULL,  30, NULL),
(11, 'Gladiolus', 'Cut Flower', NULL,  50, NULL),
(12, 'Calla Lily', 'Premium Flower', NULL,  80, NULL),
(13, 'Aster', 'Filler Flower', NULL,  15, NULL),
(14, 'Alstroemeria', 'Cut Flower', NULL,  35, NULL),
(15, 'Lisianthus', 'Premium Flower', NULL,  70, NULL);

SELECT * FROM Flowers;

INSERT INTO Inventory (inventory_id, flower_id, quantity, last_restock, notes) VALUES
(1, 1, 200, '2025-05-29', NULL),
(2, 2, 60, '2025-04-30', NULL),
(3, 3, 80, '2025-05-15', NULL),
(4, 4, 150, '2025-05-28', NULL),
(5, 5, 220, '2025-05-29', NULL),
(6, 6, 115, '2025-05-29', NULL),
(7, 7, 90, '2025-05-20', NULL),
(8, 8, 95, '2025-05-27', NULL),
(9, 9, 75, '2025-05-18', NULL),
(10, 10, 45, '2025-05-15', NULL),
(11, 11, 85, '2025-05-26', NULL),
(12, 12, 60, '2025-04-29', NULL),
(13, 13, 65, '2025-05-27', NULL),
(14, 14, 50, '2025-04-25', NULL),
(15, 15, 95, '2025-05-29', NULL);

SELECT * FROM Flowers;
SELECT * FROM Inventory;

SELECT Flowers.flower_id, Flowers.flower_name, Inventory.quantity
FROM Flowers
INNER JOIN Inventory ON Flowers.flower_id = Inventory.flower_id;

UPDATE Flowers SET 
seller = CASE flower_id
    WHEN 1 THEN 'Esmeralda'
    WHEN 2 THEN 'Lesley'
    WHEN 3 THEN 'Guinevere'
    WHEN 4 THEN 'Balmond'
    WHEN 5 THEN 'Balmond'
    WHEN 6 THEN 'Lesley'
    WHEN 7 THEN 'Layla'
    WHEN 8 THEN 'Esmeralda'
    WHEN 9 THEN 'Lesley'
    WHEN 10 THEN 'Guinevere'
    WHEN 11 THEN 'Balmond'
    WHEN 12 THEN 'Balmond'
    WHEN 13 THEN 'Lesley'
    WHEN 14 THEN 'Layla'
    WHEN 15 THEN 'Lesley'
ELSE NULL
END;

SELECT flower_id, flower_name, seller FROM Flowers;

UPDATE Flowers SET 
supplier = CASE category
    WHEN 'Cut Flower' THEN 'Philippine Cut Flower Corporation'
    WHEN 'Premium Flower' THEN 'Dangwa Flower Market'
    WHEN 'Tropical Flower' THEN 'Heaven Scent Flowers And Farms'
    WHEN 'Premium Flower' THEN 'Heaven Scent Flowers And Farms'
    WHEN 'Filler Flower' THEN 'Dangwa Flower Market'
    WHEN 'Imported Flower' THEN 'Philippine Cut Flower Corporation'
ELSE NULL
END;

SELECT flower_name, supplier FROM Flowers;

UPDATE Flowers SET 
seller = 'Lunox'
WHERE flower_id IN (6, 8);

SELECT flower_name, seller FROM Flowers;

-- AND OR NOT (OPERATORS)

SELECT * FROM Flowers
WHERE supplier = 'Philippine Cut Flower Corporation' AND seller = 'Balmond';

SELECT flower_name, seller, supplier, price_per_stem FROM Flowers
WHERE supplier = 'Dangwa Flower Market' OR seller = 'Balmond';

SELECT flower_name, seller, supplier, price_per_stem FROM Flowers
WHERE NOT seller = 'Balmond';

SELECT seller, flower_name, price_per_stem FROM Flowers
ORDER BY seller;

SELECT category, flower_name, price_per_stem FROM Flowers
ORDER BY category DESC;