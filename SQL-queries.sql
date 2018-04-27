/*
This file display the commands used to download the CSV files from the online database using SQL.
*/

-- Find the nearest city which is Singapore
SELECT *
FROM city_list
WHERE city LIKE 'Singapore';

/*
Extract both Singapore and global data by joining the 2 tables and
create new columns for the respective average temperature.
*/
SELECT global_data.year, city_data.city, city_data.avg_temp AS Singapore, global_data.avg_temp AS Global
FROM city_data JOIN global_data
ON city_data.year = global_data.year
WHERE city_data.city LIKE 'Singapore';

/*
There were missing average temperature data for Singapore from year 1825 to 1838. The missing data
were removed for this project for better analysis result. 
*/
SELECT global_data.year, city_data.city, city_data.avg_temp AS Singapore, global_data.avg_temp AS Global
FROM city_data JOIN global_data
ON city_data.year = global_data.year
WHERE city_data.city LIKE 'Singapore' AND global_data.year > 1838;
