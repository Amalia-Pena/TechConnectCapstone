--------------------------------------------------------------------
-- Views workout metrics per member
---------------------------------------------------------------------
-- View for time spent at gym based on user, need to calculate total time spent based on sum of all checked out - checked in times.
SELECT SUM(check_out - check_in) AS total_gym_time
FROM GYM_SESSION
         JOIN APP_USER ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?;

-- View for gym time in a specific year:
SELECT SUM(check_out - check_in) AS total_gym_time
FROM GYM_SESSION
         JOIN APP_USER ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND EXTRACT(YEAR FROM check_in) = ?
  AND EXTRACT(YEAR FROM check_out) = ?;

-- View for gym time in a specific month:
SELECT SUM(check_out - check_in) AS total_gym_time
FROM GYM_SESSION
         JOIN APP_USER ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND EXTRACT(MONTH FROM check_in) = ?
  AND EXTRACT(MONTH FROM check_out) = ?;

-- View for gym time in a specific week:
SELECT SUM(check_out - check_in) AS total_gym_time
FROM GYM_SESSION
         JOIN APP_USER ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND date(check_in) >= ?
  AND date(check_out) <= ?;

-- View for gym time in a specific day:
SELECT SUM(check_out - check_in) AS total_gym_time
FROM GYM_SESSION
         JOIN APP_USER ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND extract(dow FROM check_in) = ?
  AND EXTRACT(dow FROM check_out) = ?
  AND EXTRACT(WEEK FROM CHECK_IN) = ?;
--------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- Views for all equipment
-----------------------------------------------------------------------------------------------------------------------------
-- View for equipment used all time
SELECT equipment.name, SUM(equipment_usage.check_out - equipment_usage.check_in) AS total_equipment_usage
FROM equipment_usage
         JOIN equipment ON equipment_usage.equipment_id = equipment.equipment_id
         JOIN gym_session ON equipment_usage.session_id = gym_session.session_id
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
GROUP BY equipment.name;

-- View total equipment use per year
SELECT equipment.name, SUM(equipment_usage.check_out - equipment_usage.check_in) AS total_equipment_usage
FROM equipment_usage
         JOIN equipment ON equipment_usage.equipment_id = equipment.equipment_id
         JOIN gym_session ON equipment_usage.session_id = gym_session.session_id
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND EXTRACT(YEAR FROM equipment_usage.check_in) = ?
  AND EXTRACT(YEAR FROM equipment_usage.check_out) = ?
GROUP BY equipment.name;

-- View total equipment use per month
SELECT equipment.name, SUM(equipment_usage.check_out - equipment_usage.check_in) AS total_equipment_usage
FROM equipment_usage
         JOIN equipment ON equipment_usage.equipment_id = equipment.equipment_id
         JOIN gym_session ON equipment_usage.session_id = gym_session.session_id
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND EXTRACT(MONTH FROM equipment_usage.check_in) = ?
  AND EXTRACT(MONTH FROM equipment_usage.check_out) = ?
GROUP BY equipment.name;

-- View total equipment use per week
SELECT equipment.name, SUM(equipment_usage.check_out - equipment_usage.check_in) AS total_equipment_usage
FROM equipment_usage
         JOIN equipment ON equipment_usage.equipment_id = equipment.equipment_id
         JOIN gym_session ON equipment_usage.session_id = gym_session.session_id
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND date(equipment_usage.check_in) >= ?
  AND date(equipment_usage.check_out) <= ?
GROUP BY equipment.name;

-- View total equipment use per day
SELECT equipment.name, SUM(equipment_usage.check_out - equipment_usage.check_in) AS total_equipment_usage
FROM equipment_usage
         JOIN equipment ON equipment_usage.equipment_id = equipment.equipment_id
         JOIN gym_session ON equipment_usage.session_id = gym_session.session_id
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND EXTRACT(dow FROM equipment_usage.check_in) = ?
  AND EXTRACT(dow FROM equipment_usage.check_out) = ?
  AND DATE(equipment_usage.check_in) >= ?
  AND DATE(equipment_usage.check_out) <= ?
GROUP BY equipment.name;

-------------------------------------------------------------------------------------------------------------------
-- Views for specific equipment
-----------------------------------------------------------------------------------------------------------------------
-- View for equipment used all time
SELECT equipment.name, SUM(equipment_usage.check_out - equipment_usage.check_in) AS total_equipment_usage
FROM equipment_usage
         JOIN equipment ON equipment_usage.equipment_id = equipment.equipment_id
         JOIN gym_session ON equipment_usage.session_id = gym_session.session_id
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND equipment.equipment_id = ?
GROUP BY equipment.name;

-- View total equipment use per year
SELECT equipment.name, SUM(equipment_usage.check_out - equipment_usage.check_in) AS total_equipment_usage
FROM equipment_usage
         JOIN equipment ON equipment_usage.equipment_id = equipment.equipment_id
         JOIN gym_session ON equipment_usage.session_id = gym_session.session_id
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND EXTRACT(YEAR FROM equipment_usage.check_in) = ?
  AND EXTRACT(YEAR FROM equipment_usage.check_out) = ?
  AND equipment.equipment_id = ?
GROUP BY equipment.name;

-- View total equipment use per month
SELECT equipment.name, SUM(equipment_usage.check_out - equipment_usage.check_in) AS total_equipment_usage
FROM equipment_usage
         JOIN equipment ON equipment_usage.equipment_id = equipment.equipment_id
         JOIN gym_session ON equipment_usage.session_id = gym_session.session_id
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND EXTRACT(MONTH FROM equipment_usage.check_in) = ?
  AND EXTRACT(MONTH FROM equipment_usage.check_out) = ?
  AND equipment.equipment_id = ?
GROUP BY equipment.name;

-- View total equipment use per week
SELECT equipment.name, SUM(equipment_usage.check_out - equipment_usage.check_in) AS total_equipment_usage
FROM equipment_usage
         JOIN equipment ON equipment_usage.equipment_id = equipment.equipment_id
         JOIN gym_session ON equipment_usage.session_id = gym_session.session_id
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND date(equipment_usage.check_in) >= ?
  AND date(equipment_usage.check_out) <= ?
  AND equipment.equipment_id = ?
GROUP BY equipment.name;

-- View total equipment use per day
SELECT equipment.name, SUM(equipment_usage.check_out - equipment_usage.check_in) AS total_equipment_usage
FROM equipment_usage
         JOIN equipment ON equipment_usage.equipment_id = equipment.equipment_id
         JOIN gym_session ON equipment_usage.session_id = gym_session.session_id
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND EXTRACT(dow FROM equipment_usage.check_in) = ?
  AND EXTRACT(dow FROM equipment_usage.check_out) = ?
  AND DATE(equipment_usage.check_in) >= ?
  AND DATE(equipment_usage.check_out) <= ?
  AND equipment.equipment_id = ?
GROUP BY equipment.name;

-------------------------------------------------------------------------------------------------------
-- Views for Gym member visits
-----------------------------------------------------------------------------------------------------
-- View for how long gym visit total
SELECT SUM(check_out - check_in) AS total_gym_time
FROM gym_session
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?;

-- View total equipment use per year
SELECT SUM(check_out - check_in) AS total_gym_time
FROM gym_session
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND EXTRACT(YEAR FROM check_out) = ?;

-- View total equipment use per month
SELECT SUM(check_out - check_in) AS total_gym_time
FROM gym_session
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND EXTRACT(MONTH FROM check_in) = ?
  AND EXTRACT(MONTH FROM check_out) = ?;

-- View total equipment use per week
SELECT SUM(check_out - check_in) AS total_gym_time
FROM gym_session
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND date(check_in) >= ?
  AND date(check_out) <= ?;

-- View total equipment use per day
SELECT SUM(check_out - check_in) AS total_gym_time
FROM gym_session
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?
  AND EXTRACT(dow FROM check_in) = ?
  AND EXTRACT(dow FROM check_out) = ?
  AND DATE(check_in) >= ?
  AND DATE(check_out) <= ?;

-- View for average visit duration
SELECT AVG(check_out - check_in) AS average_gym_time
FROM gym_session
         JOIN app_user ON gym_session.user_id = app_user.user_id
WHERE app_user.user_id = ?;



