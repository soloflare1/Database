select locations.city
from departments
join locations on departments.location_id = locations.location_id;

-- or
select l.city
from departments d
join locations l on d.location_id = l.location_id;

-- or 
SELECT DISTINCT l.city
FROM departments d
JOIN locations l ON d.location_id = l.location_id;

/*
departments has a location_id.
locations table has location_id and city.
Join them on location_id.
Use DISTINCT to avoid duplicate city names if multiple departments are in the same city.
*/
