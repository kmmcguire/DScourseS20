/*
PS3 5.a
Import data from CSV
*/

.mode csv
.import FL_insurance_sample.csv FL_INS

/*
PS3 5.b
Print top 10 rows
*/

SELECT "Top 10 Results";
SELECT * FROM FL_INS LIMIT 10;

/*
PS3 5.c
List all counties in sample in alphabetical order
*/

SELECT "List of Counties";
SELECT DISTINCT county FROM FL_INS ORDER BY county DESC;

/*
PS3 5.d
Compute average property appreciation from 2011 to 2012
*/

SELECT "Average property appreciation from 2011 to 2012";
SELECT AVG(tiv_2012 - tiv_2011) FROM FL_INS;

/*
PS3 5.e
Build frequency table of construction materials
*/

SELECT "Building Materials";
SELECT construction, COUNT(construction) FROM FL_INS GROUP BY construction ORDER BY construction DESC;
