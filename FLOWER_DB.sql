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

ALTER TABLE