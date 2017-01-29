-- Include your solutions to the More Practice problems in this file.



-- Insert a Brand
INSERT INTO brands VALUES ('sub', 'Subaru', 1953, 'Tokyo, Japan', NULL);

-- Insert Models
INSERT INTO models (year, brand_id, name) 
    VALUES (2015, (SELECT brand_id FROM brands WHERE name='Chevrolet'), 'Malibu');
INSERT INTO models (year, brand_id, name) 
    VALUES (2015, (SELECT brand_id FROM brands WHERE name='Subaru'), 'Outback');
    --Could also be done in a single query like:
    --INSERT INTO models (year, brand_id, name) 
        --VALUES (2015, (SELECT brand_id FROM brands WHERE name='Chevrolet'), 'Malibu'),
        --(2015, (SELECT brand_id FROM brands WHERE name='Subaru'), 'Outback');

-- Create an Awards Table
CREATE TABLE awards(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    year INTEGER NOT NULL,
    winner_id INTEGER 
        REFERENCES models);

-- Insert Awards
INSERT INTO awards (name, year, winner_id)
    VALUES ('IIHS Safety Award', 2015, 
        (SELECT model_id FROM models WHERE name='Outback'));

INSERT INTO awards (name, year, winner_id)
    VALUES ('IIHS Safety Award', 2015, 
        (SELECT model_id FROM models WHERE name='Malibu'));
    --We can get away with the short WHERE because there's only one Outback or
    --Malibu. If we wanted to add one of the Corvettes, we'd have to include the
    --model year as a second boolean clause
    
INSERT INTO awards (name, year) VALUES ('Best in Class', 2015);



