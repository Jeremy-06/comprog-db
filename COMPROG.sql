--COMPROG

INSERT INTO Employee(id, first_name, last_name, age, brgy, city, salary) VALUES
(1, 'Julianne', 'Tumpap', 18, 'Sun Valley', 'Paranaque City', 80000),
(2, 'Lexes Bj', 'Acuesta', 19, 'Brgy. 201', 'Pasay City', 50000),
(3, 'John Luis', 'Pilar', 19, 'Lower Bicutan', 'Taguig City', 60000),
(4, 'Ralph Snider', 'Ordonez', 19, 'Signal Village','Taguig City', 55000),
(5, 'Ullyzes Zabdiel', 'Olorga', 18, 'Poblacion', 'Muntinlupa', 65000),
(6, 'Cyrus', 'Pagayunan', 19, 'Bagong Tanyag', 'Taguig City', 50000),
(7, 'Donn Xydney', 'Torres', 19, 'Bagong Tanyag', 'Taguig City', 55555),
(8, 'Michael Laurence', 'Agregado', 19, 'Signal Village', 'Taguig City', 50000),
(9, 'Emmanuel', 'Capuno', 19, 'Bambang', 'Taguig', 70000),
(10, 'J-rob Francis', 'Balbin', 19, 'Bagong Tanyag', 'Taguig City', 60000);

SELECT last_name, first_name, 
CASE 
	WHEN city LIKE '%Taguig%' THEN 'Taguigeño'
	WHEN city LIKE '%Pasay%' THEN 'Pasayeño'
ELSE 'Diyan Lang'
END AS Citezenship
FROM Employee;


SELECT last_name, first_name, dept_name FROM Employee
INNER JOIN Department ON Employee.dept_id = Department.dept_id;

SELECT * FROM Employee;
SELECT * FROM Department;

ALTER TABLE Employee ADD dept_id;
ALTER TABLE Department ADD building VARCHAR(50);
--building_1
--building_2
--building_3
UPDATE Department SET building = 'building_1' WHERE dept_id = 1;
UPDATE Department SET building = 'building_2' WHERE dept_id = 2;
UPDATE Department SET building = 'building_3' WHERE dept_id = 3;
UPDATE Department SET building = 'building_4' WHERE dept_id = 4;

ALTER TABLE Employee ADD Location VARCHAR(50);
ALTER TABLE Employee DROP COLUMN Locatiojn;

UPDATE Employee SET 
Location = CASE dept_id
    WHEN 1 THEN 'building_1'
    WHEN 2 THEN 'building_2'
    WHEN 3 THEN 'building_3'
    WHEN 4 THEN 'building_4'
    ELSE 'Unknown'
END;

--left join 
SELECT Employee.first_name, Employee.last_name, Department.dept_name, Department.building
FROM Employee
LEFT JOIN Department ON Employee.dept_id = Department.dept_id;

--right join
SELECT Employee.first_name, Employee.last_name, Department.dept_name, Department.building
FROM Employee
RIGHT JOIN Department ON Employee.dept_id = Department.dept_id;

--full outer join
SELECT Employee.first_name, Employee.last_name, Department.dept_name, Department.building
FROM Employee
FULL OUTER JOIN Department ON Employee.dept_id = Department.dept_id;

ALTER TABLE Employee ADD Birthday DATE;
ALTER TABLE Employee DROP COLUMN Birthday;

ALTER TABLE Employee ADD date_hired DATE;

UPDATE Employee SET 
date_hired = CASE id
    WHEN 1 THEN '2025-03-22'
    WHEN 2 THEN '2020-01-01'
    WHEN 3 THEN '2020-01-02'
    WHEN 4 THEN '2021-02-15'
    WHEN 5 THEN '2021-02-16'
    WHEN 6 THEN '2020-06-06'
    WHEN 7 THEN '2024-12-25'
    WHEN 8 THEN '2022-11-22'
    WHEN 9 THEN '2023-10-23'
    WHEN 10 THEN '2023-07-12'
ELSE NULL
END;

DELETE FROM Employee WHERE id = 2;
DELETE FROM Employee WHERE id IN (1, 2, 3);

INSERT INTO Employee (id, first_name, last_name, age, brgy, city, salary, dept_id, Location, date_hired)
VALUES (2, 'Lexes Bj', 'Acuesta', 19, 'Brgy-201', 'Pasay City', 60000, 3, 'building_3', '2020-03-04');

TRUNCATE TABLE
DROP TABLE

ALTER TABLE Employee RENAME COLUMN Location to location;
