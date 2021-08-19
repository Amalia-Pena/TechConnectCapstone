-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;


-- INSERT statements go here


insert into equipment_categories (name)
values ('strength');
insert into equipment_categories (name)
values ('cardio');


insert into equipment (category_id, name, met_value)
VALUES ((select category_id from equipment_categories where name = 'cardio'), 'Treadmill', 5.0);
insert into equipment (category_id, name, met_value)
VALUES ((select category_id from equipment_categories where name = 'cardio'), 'Stationary Bike', 6.8);
insert into equipment (category_id, name, met_value)
VALUES ((select category_id from equipment_categories where name = 'strength'), 'Lat Pulldown', 6.3);
insert into equipment (category_id, name, met_value)
VALUES ((select category_id from equipment_categories where name = 'strength'), 'Leg Extension Machine',
        5.8);
insert into equipment (category_id, name, met_value)
VALUES ((select category_id from equipment_categories where name = 'strength'), 'Leg Curl Machine', 6.0);
insert into equipment (category_id, name, met_value)
VALUES ((select category_id from equipment_categories where name = 'strength'), 'Leg Press Machine', 6.0);
insert into equipment (category_id, name, met_value)
VALUES ((select category_id from equipment_categories where name = 'strength'), 'Bicep Curl Machine',
        5.0);
insert into equipment (category_id, name, met_value)
VALUES ((select category_id from equipment_categories where name = 'strength'), 'Hammer Strength Machine',
        4.8);
insert into equipment (category_id, name, met_value) VALUES ((select category_id from equipment_categories where name = 'strength'),'Bench Press', 6.3 );
insert into equipment (category_id, name, met_value) VALUES ((select category_id from equipment_categories where name = 'strength'),'Incline Bench Press',6.6  );
insert into equipment (category_id, name, met_value) VALUES ((select category_id from equipment_categories where name = 'strength'),'Pullup Bar', 5.5 );
insert into equipment (category_id, name, met_value) VALUES ((select category_id from equipment_categories where name = 'strength'),'Preacher Bench',  5.8);
insert into equipment (category_id, name, met_value)
VALUES ((select category_id from equipment_categories where name = 'strength'), 'Calf Machine', 5.5);
insert into equipment (category_id, name, met_value)
VALUES ((select category_id from equipment_categories where name = 'strength'), 'Peck Deck Machine', 6.0);



insert into assistance_media (equipment_id, photo_link, photo_name)
values ((select equipment_id from equipment where name = 'Treadmill'), 'https://i.imgur.com/ktJvBNA.png',
        'Treadmill Image');
insert into assistance_media (equipment_id, photo_link, photo_name)
values ((select equipment_id from equipment where name = 'Stationary Bike'), 'https://i.imgur.com/XE4wCnX.jpg',
        'Stationary Bike Image');
insert into assistance_media (equipment_id, photo_link, photo_name)
values ((select equipment_id from equipment where name = 'Lat Pulldown'), 'https://i.imgur.com/5kfPIQR.png',
        'Lat Pulldown Image');
insert into assistance_media (equipment_id, photo_link, photo_name)
values ((select equipment_id from equipment where name = 'Leg Extension Machine'), 'https://i.imgur.com/tiipemx.jpg',
        'Leg Extension Machine Image');
insert into assistance_media (equipment_id, photo_link, photo_name)
values ((select equipment_id from equipment where name = 'Leg Curl Machine'), 'https://i.imgur.com/YBQQhDm.jpg',
        'Leg Curl Machine Image');
insert into assistance_media (equipment_id, photo_link, photo_name)
values ((select equipment_id from equipment where name = 'Leg Press Machine'), 'https://i.imgur.com/E6devtR.jpg',
        'Leg Press Machine Image');
insert into assistance_media (equipment_id, photo_link, photo_name)
values ((select equipment_id from equipment where name = 'Bicep Curl Machine'), 'https://i.imgur.com/B9vioQX.jpg',
        'Bicep Curl Machine Image');
insert into assistance_media (equipment_id, photo_link, photo_name)
values ((select equipment_id from equipment where name = 'Hammer Strength Machine'), 'https://i.imgur.com/5kaVtg0.jpg',
        'Hammer Strength Machine Image');
insert into assistance_media (equipment_id, photo_link, photo_name)
values ((select equipment_id from equipment where name = 'Bench Press'), 'https://i.imgur.com/9hvmD7q.jpg',
        'Bench Press Image');
insert into assistance_media (equipment_id, photo_link, photo_name)
values ((select equipment_id from equipment where name = 'Incline Bench Press'), 'https://i.imgur.com/8z9SCjs.jpg',
        'Incline Bench Press Image');
insert into assistance_media (equipment_id, photo_link, photo_name)
values ((select equipment_id from equipment where name = 'Pullup Bar'), 'https://i.imgur.com/XBgZ8EA.jpg',
        'Pullup Bar Image');
insert into assistance_media (equipment_id, photo_link, photo_name)
values ((select equipment_id from equipment where name = 'Preacher Bench'), 'https://i.imgur.com/znKzpHU.jpg',
        'Preacher Bench Image');
insert into assistance_media (equipment_id, photo_link, photo_name)
values ((select equipment_id from equipment where name = 'Calf Machine'), 'https://i.imgur.com/DBExv3T.jpg',
        'Calf Machine Image');
insert into assistance_media (equipment_id, photo_link, photo_name)
values ((select equipment_id from equipment where name = 'Peck Deck Machine'), 'https://i.imgur.com/dNFQ7RL.jpg',
        'Peck Deck Machine Image');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (1, 1, 'Cycling', 'This cycling class will be intense cycling that will stress your cycling skills',
        '08-23-2021 16:00:00', '08-23-2021 16:30:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (2, 1, 'Cycling', 'This cycling class will be intense cycling that will stress your cycling skills',
        '08-25-2021 16:00:00', '08-25-2021 16:30:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (3, 1, 'Cycling', 'This cycling class will be intense cycling that will stress your cycling skills',
        '08-27-2021 16:00:00', '08-27-2021 16:30:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (4, 1, 'Cycling', 'This cycling class will be intense cycling that will stress your cycling skills',
        '08-30-2021 16:00:00', '08-30-2021 16:30:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (5, 1, 'Cycling', 'This cycling class will be intense cycling that will stress your cycling skills',
        '09-01-2021 16:00:00', '09-01-2021 16:30:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (6, 1, 'Cycling', 'This cycling class will be intense cycling that will stress your cycling skills',
        '09-03-2021 16:00:00', '09-03-2021 16:30:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (7, 1, 'Cycling', 'This cycling class will be intense cycling that will stress your cycling skills',
        '09-05-2021 16:00:00', '09-05-2021 16:30:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (8, 1, 'Cycling', 'This cycling class will be intense cycling that will stress your cycling skills',
        '09-07-2021 16:00:00', '09-07-2021 16:30:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (9, 1, 'Cycling', 'This cycling class will be intense cycling that will stress your cycling skills',
        '09-09-2021 16:00:00', '09-09-2021 16:30:00');



insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
VALUES (10, 1, 'HIIT',
        'High-Intensity Interval Training (HIIT) will shift your body from periods of aerobic activity to periods on anaerobic activity',
        '08-24-2021 10:30:00', '08-24-2021 11:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
VALUES (11, 1, 'HIIT',
        'High-Intensity Interval Training (HIIT) will shift your body from periods of aerobic activity to periods on anaerobic activity',
        '08-26-2021 10:30:00', '08-26-2021 11:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
VALUES (12, 1, 'HIIT',
        'High-Intensity Interval Training (HIIT) will shift your body from periods of aerobic activity to periods on anaerobic activity',
        '08-31-2021 10:30:00', '08-31-2021 11:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
VALUES (13, 1, 'HIIT',
        'High-Intensity Interval Training (HIIT) will shift your body from periods of aerobic activity to periods on anaerobic activity',
        '09-02-2021 10:30:00', '09-02-2021 11:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
VALUES (14, 1, 'HIIT',
        'High-Intensity Interval Training (HIIT) will shift your body from periods of aerobic activity to periods on anaerobic activity',
        '09-07-2021 10:30:00', '09-07-2021 11:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
VALUES (15, 1, 'HIIT',
        'High-Intensity Interval Training (HIIT) will shift your body from periods of aerobic activity to periods on anaerobic activity',
        '09-14-2021 10:30:00', '09-14-2021 11:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
VALUES (16, 1, 'HIIT',
        'High-Intensity Interval Training (HIIT) will shift your body from periods of aerobic activity to periods on anaerobic activity',
        '09-16-2021 10:30:00', '09-16-2021 11:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
VALUES (17, 1, 'HIIT',
        'High-Intensity Interval Training (HIIT) will shift your body from periods of aerobic activity to periods on anaerobic activity',
        '09-21-2021 10:30:00', '09-21-2021 11:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
VALUES (18, 1, 'HIIT',
        'High-Intensity Interval Training (HIIT) will shift your body from periods of aerobic activity to periods on anaerobic activity',
        '09-23-2021 10:30:00', '09-23-2021 11:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
VALUES (19, 1, 'HIIT',
        'High-Intensity Interval Training (HIIT) will shift your body from periods of aerobic activity to periods on anaerobic activity',
        '09-28-2021 10:30:00', '09-28-2021 11:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
VALUES (20, 1, 'HIIT',
        'High-Intensity Interval Training (HIIT) will shift your body from periods of aerobic activity to periods on anaerobic activity',
        '09-30-2021 10:30:00', '09-30-2021 11:00:00');



insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (21, 1, 'Yoga',
        'This yoga class will incorporate mediation and breathing which can help improve your mental-wellbeing.',
        '08-25-2021 13:30:00', '08-25-2021 14:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (22, 1, 'Yoga',
        'This yoga class will incorporate mediation and breathing which can help improve your mental-wellbeing.',
        '09-01-2021 13:30:00', '09-01-2021 14:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (23, 1, 'Yoga',
        'This yoga class will incorporate mediation and breathing which can help improve your mental-wellbeing.',
        '09-08-2021 13:30:00', '09-08-2021 14:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (24, 1, 'Yoga',
        'This yoga class will incorporate mediation and breathing which can help improve your mental-wellbeing.',
        '09-15-2021 13:30:00', '09-15-2021 14:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (25, 1, 'Yoga',
        'This yoga class will incorporate mediation and breathing which can help improve your mental-wellbeing.',
        '09-22-2021 13:30:00', '09-22-2021 14:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (26, 1, 'Yoga',
        'This yoga class will incorporate mediation and breathing which can help improve your mental-wellbeing.',
        '09-29-2021 13:30:00', '09-29-2021 14:00:00');



insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (27, 1, 'Zumba',
        'Zumba can help lower your risk of heart disease, reduce your blood pressure and bad cholesterol, and boost your good cholesterol.',
        '08-26-2021 10:00:00', '08-26-2021 11:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (28, 1, 'Zumba',
        'Zumba can help lower your risk of heart disease, reduce your blood pressure and bad cholesterol, and boost your good cholesterol.',
        '09-02-2021 10:00:00', '09-02-2021 11:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (29, 1, 'Zumba',
        'Zumba can help lower your risk of heart disease, reduce your blood pressure and bad cholesterol, and boost your good cholesterol.',
        '09-09-2021 10:00:00', '09-09-2021 11:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (30, 1, 'Zumba',
        'Zumba can help lower your risk of heart disease, reduce your blood pressure and bad cholesterol, and boost your good cholesterol.',
        '09-16-2021 10:00:00', '09-02-2021 11:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (31, 1, 'Zumba',
        'Zumba can help lower your risk of heart disease, reduce your blood pressure and bad cholesterol, and boost your good cholesterol.',
        '09-23-2021 10:00:00', '09-23-2021 11:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (32, 1, 'Zumba',
        'Zumba can help lower your risk of heart disease, reduce your blood pressure and bad cholesterol, and boost your good cholesterol.',
        '09-30-2021 10:00:00', '09-30-2021 11:00:00');



insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (33, 1, 'Pilates',
        'This pilates class will increased muscle strength and tone, particularly of your abdominal muscles, lower back, hips and buttocks (the ''core muscles'' of your body) balanced muscular strength on both sides of your body. enhanced muscular control of your back and limbs. improved stabilisation of your spine.',
        '08-27-2021 8:00:00', '08-27-2021 9:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (34, 1, 'Pilates',
        'This pilates class will increased muscle strength and tone, particularly of your abdominal muscles, lower back, hips and buttocks (the ''core muscles'' of your body) balanced muscular strength on both sides of your body. enhanced muscular control of your back and limbs. improved stabilisation of your spine.',
        '09-03-2021 8:00:00', '09-03-2021 9:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (35, 1, 'Pilates',
        'This pilates class will increased muscle strength and tone, particularly of your abdominal muscles, lower back, hips and buttocks (the ''core muscles'' of your body) balanced muscular strength on both sides of your body. enhanced muscular control of your back and limbs. improved stabilisation of your spine.',
        '09-10-2021 8:00:00', '09-10-2021 9:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (36, 1, 'Pilates',
        'This pilates class will increased muscle strength and tone, particularly of your abdominal muscles, lower back, hips and buttocks (the ''core muscles'' of your body) balanced muscular strength on both sides of your body. enhanced muscular control of your back and limbs. improved stabilisation of your spine.',
        '09-17-2021 8:00:00', '09-17-2021 9:00:00');

insert into exercise_class (class_id, instructor_id, class_name, class_description, class_start_date, class_end_date)
values (37, 1, 'Pilates',
        'This pilates class will increased muscle strength and tone, particularly of your abdominal muscles, lower back, hips and buttocks (the ''core muscles'' of your body) balanced muscular strength on both sides of your body. enhanced muscular control of your back and limbs. improved stabilisation of your spine.',
        '09-24-2021 8:00:00', '09-24-2021 9:00:00');

update exercise_class
set class_color = 'blue'
where class_name ILIKE 'cycling';

update exercise_class
set class_color = 'green'
where class_name ILIKE 'yoga';

update exercise_class
set class_color = 'yellow'
where class_name ILIKE 'HIIT';

update exercise_class
set class_color = 'red'
where class_name ILIKE 'pilates';

update exercise_class
set class_color = 'purple'
where class_name ILIKE 'zumba';

COMMIT;