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
SELECT * FROM Flowers;