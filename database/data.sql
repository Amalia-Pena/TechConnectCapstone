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



insert into gym_session (session_id, user_id, check_in, check_out)
values (1, 1, '2020-09-01 12:23:36.772000', '2020-09-01 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (2, 1, '2020-09-02 12:23:36.772000', '2020-09-02 13:00:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (3, 1, '2020-09-03 12:23:36.772000', '2020-09-03 13:01:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (4, 1, '2020-09-06 12:23:36.772000', '2020-09-06 13:02:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (5, 1, '2020-09-08 12:23:36.772000', '2020-09-08 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (6, 1, '2020-09-09 12:23:36.772000', '2020-09-09 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (7, 1, '2020-09-10 12:23:36.772000', '2020-09-10 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (8, 1, '2020-09-12 12:23:36.772000', '2020-09-12 13:14:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (9, 1, '2020-09-13 12:23:36.772000', '2020-09-13 13:11:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (10, 1, '2020-09-14 12:23:36.772000', '2020-09-14 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (11, 1, '2020-09-15 12:23:36.772000', '2020-09-15 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (12, 1, '2020-09-16 12:23:36.772000', '2020-09-16 13:23:36.772000');

insert into gym_session (user_id, check_in, check_out)
values (1, '2020-09-17 12:23:36.772000', '2020-09-17 13:23:36.772000');

insert into gym_session (user_id, check_in, check_out)
values (1, '2020-09-18 12:23:36.772000', '2020-09-18 13:18:36.772000');

insert into gym_session (user_id, check_in, check_out)
values (1, '2020-09-20 12:23:36.772000', '2020-09-20 13:23:36.772000');

insert into gym_session (user_id, check_in, check_out)
values (1, '2020-09-21 12:23:36.772000', '2020-09-21 13:23:36.772000');

insert into gym_session (user_id, check_in, check_out)
values (1, '2020-09-22 12:23:36.772000', '2020-09-22 13:22:36.772000');

insert into gym_session (user_id, check_in, check_out)
values (1, '2020-09-23 12:23:36.772000', '2020-09-23 13:23:36.772000');

insert into gym_session (user_id, check_in, check_out)
values (1, '2020-09-24 12:23:36.772000', '2020-09-24 13:23:36.772000');

insert into gym_session (user_id, check_in, check_out)
values (1, '2020-09-25 12:23:36.772000', '2020-09-25 13:23:36.772000');

insert into gym_session (user_id, check_in, check_out)
values (1, '2020-09-26 12:23:36.772000', '2020-09-26 13:01:36.772000');

insert into gym_session (user_id, check_in, check_out)
values (1, '2020-09-27 12:23:36.772000', '2020-09-27 13:05:36.772000');

insert into gym_session (user_id, check_in, check_out)
values (23, 1, '2020-09-28 12:23:36.772000', '2020-09-28 13:17:36.772000');



insert into gym_session (session_id, user_id, check_in, check_out)
values (24, 1, '2020-10-01 12:23:36.772000', '2020-10-01 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (25, 1, '2020-10-02 12:23:36.772000', '2020-10-02 13:00:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (26, 1, '2020-10-03 12:23:36.772000', '2020-10-03 13:01:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (27, 1, '2020-10-04 12:23:36.772000', '2020-10-04 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (28, 1, '2020-10-05 12:23:36.772000', '2020-10-05 13:17:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (29, 1, '2020-10-06 12:23:36.772000', '2020-10-06 13:02:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (30, 1, '2020-10-08 12:23:36.772000', '2020-10-08 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (31, 1, '2020-10-09 12:23:36.772000', '2020-10-09 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (32, 1, '2020-10-10 12:23:36.772000', '2020-10-10 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (33, 1, '2020-10-12 12:23:36.772000', '2020-10-12 13:14:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (34, 1, '2020-10-13 12:23:36.772000', '2020-10-13 13:11:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (35, 1, '2020-10-14 12:23:36.772000', '2020-10-14 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (36, 1, '2020-10-15 12:23:36.772000', '2020-10-15 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (37, 1, '2020-10-16 12:23:36.772000', '2020-10-16 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (38, 1, '2020-10-17 12:23:36.772000', '2020-10-17 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (39, 1, '2020-10-18 12:23:36.772000', '2020-10-18 13:18:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (40, 1, '2020-10-20 12:23:36.772000', '2020-10-20 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (41, 1, '2020-10-21 12:23:36.772000', '2020-10-21 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (42, 1, '2020-10-22 12:23:36.772000', '2020-10-22 13:22:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (43, 1, '2020-10-23 12:23:36.772000', '2020-10-23 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (44, 1, '2020-10-24 12:23:36.772000', '2020-10-24 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (45, 1, '2020-10-25 12:23:36.772000', '2020-10-25 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (46, 1, '2020-10-26 12:23:36.772000', '2020-10-26 13:01:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (47, 1, '2020-10-27 12:23:36.772000', '2020-10-27 13:05:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (48, 1, '2020-10-28 12:23:36.772000', '2020-10-28 13:17:36.772000');



insert into gym_session (session_id, user_id, check_in, check_out)
values (49, 1, '2020-11-01 12:23:36.772000', '2020-11-01 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (50, 1, '2020-11-02 12:23:36.772000', '2020-11-02 13:00:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (51, 1, '2020-11-03 12:23:36.772000', '2020-11-03 13:01:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (52, 1, '2020-11-04 12:23:36.772000', '2020-11-04 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (53, 1, '2020-11-05 12:23:36.772000', '2020-11-05 13:17:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (54, 1, '2020-11-06 12:23:36.772000', '2020-11-06 13:02:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (55, 1, '2020-11-08 12:23:36.772000', '2020-11-08 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (56, 1, '2020-11-09 12:23:36.772000', '2020-11-09 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (57, 1, '2020-11-12 12:23:36.772000', '2020-11-12 13:14:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (58, 1, '2020-11-13 12:23:36.772000', '2020-11-13 13:11:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (59, 1, '2020-11-14 12:23:36.772000', '2020-11-14 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (60, 1, '2020-11-15 12:23:36.772000', '2020-11-15 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (61, 1, '2020-11-16 12:23:36.772000', '2020-11-16 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (62, 1, '2020-11-17 12:23:36.772000', '2020-11-17 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (63, 1, '2020-11-18 12:23:36.772000', '2020-11-18 13:18:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (64, 1, '2020-11-20 12:23:36.772000', '2020-11-20 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (65, 1, '2020-11-21 12:23:36.772000', '2020-11-21 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (66, 1, '2020-11-22 12:23:36.772000', '2020-11-22 13:22:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (67, 1, '2020-11-23 12:23:36.772000', '2020-11-23 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (68, 1, '2020-11-24 12:23:36.772000', '2020-11-24 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (69, 1, '2020-11-25 12:23:36.772000', '2020-11-25 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (70, 1, '2020-11-26 12:23:36.772000', '2020-11-26 13:01:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (71, 1, '2020-11-27 12:23:36.772000', '2020-11-27 13:05:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (72, 1, '2020-11-28 12:23:36.772000', '2020-11-28 13:17:36.772000');



insert into gym_session (session_id, user_id, check_in, check_out)
values (73, 1, '2020-12-01 12:23:36.772000', '2020-12-01 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (74, 1, '2020-12-02 12:23:36.772000', '2020-12-02 13:00:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (75, 1, '2020-12-03 12:23:36.772000', '2020-12-03 13:01:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (76, 1, '2020-12-04 12:23:36.772000', '2020-12-04 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (77, 1, '2020-12-05 12:23:36.772000', '2020-12-05 13:17:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (78, 1, '2020-12-06 12:23:36.772000', '2020-12-06 13:02:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (79, 1, '2020-12-08 12:23:36.772000', '2020-12-08 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (80, 1, '2020-12-09 12:23:36.772000', '2020-12-09 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (81, 1, '2020-12-14 12:23:36.772000', '2020-12-14 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (82, 1, '2020-12-15 12:23:36.772000', '2020-12-15 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (83, 1, '2020-12-16 12:23:36.772000', '2020-12-16 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (84, 1, '2020-12-17 12:23:36.772000', '2020-12-17 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (85, 1, '2020-12-18 12:23:36.772000', '2020-12-18 13:18:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (86, 1, '2020-12-20 12:23:36.772000', '2020-12-20 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (87, 1, '2020-12-21 12:23:36.772000', '2020-12-21 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (88, 1, '2020-12-22 12:23:36.772000', '2020-12-22 13:22:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (89, 1, '2020-12-23 12:23:36.772000', '2020-12-23 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (90, 1, '2020-12-24 12:23:36.772000', '2020-12-24 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (91, 1, '2020-12-25 12:23:36.772000', '2020-12-25 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (92, 1, '2020-12-26 12:23:36.772000', '2020-12-26 13:01:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (93, 1, '2020-12-27 12:23:36.772000', '2020-12-27 13:05:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (94, 1, '2020-12-28 12:23:36.772000', '2020-12-28 13:17:36.772000');



insert into gym_session (session_id, user_id, check_in, check_out)
values (95, 1, '2021-01-01 12:23:36.772000', '2021-01-01 13:00:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (96, 1, '2021-01-02 12:23:36.772000', '2021-01-02 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (97, 1, '2021-01-03 12:23:36.772000', '2021-01-03 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (98, 1, '2021-01-04 12:23:36.772000', '2021-01-04 13:01:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (99, 1, '2021-01-05 12:23:36.772000', '2021-01-05 13:33:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (100, 1, '2021-01-06 12:23:36.772000', '2021-01-06 13:22:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (101, 1, '2021-01-08 12:23:36.772000', '2021-01-08 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (102, 1, '2021-01-09 12:23:36.772000', '2021-01-09 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (103, 1, '2021-01-10 12:23:36.772000', '2021-01-10 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (104, 1, '2021-01-12 12:23:36.772000', '2021-01-12 13:13:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (105, 1, '2021-01-13 12:23:36.772000', '2021-01-13 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (106, 1, '2021-01-14 12:23:36.772000', '2021-01-14 13:16:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (107, 1, '2021-01-15 12:23:36.772000', '2021-01-15 13:19:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (108, 1, '2021-01-16 12:23:36.772000', '2021-01-16 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (109, 1, '2021-01-17 12:23:36.772000', '2021-01-17 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (110, 1, '2021-01-18 12:23:36.772000', '2021-01-18 13:22:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (111, 1, '2021-01-20 12:23:36.772000', '2021-01-20 13:29:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (112, 1, '2021-01-21 12:23:36.772000', '2021-01-21 13:30:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (113, 1, '2021-01-22 12:23:36.772000', '2021-01-22 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (114, 1, '2021-01-23 12:23:36.772000', '2021-01-23 13:22:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (115, 1, '2021-01-24 12:23:36.772000', '2021-01-24 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (116, 1, '2021-01-25 12:23:36.772000', '2021-01-25 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (117, 1, '2021-01-26 12:23:36.772000', '2021-01-26 13:18:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (118, 1, '2021-01-27 12:23:36.772000', '2021-01-27 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (119, 1, '2021-01-28 12:23:36.772000', '2021-01-28 13:18:36.772000');



insert into gym_session (session_id, user_id, check_in, check_out)
values (120, 1, '2021-02-01 12:23:36.772000', '2021-02-01 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (121, 1, '2021-02-02 12:23:36.772000', '2021-02-02 13:00:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (122, 1, '2021-02-03 12:23:36.772000', '2021-02-03 13:01:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (123, 1, '2021-02-04 12:23:36.772000', '2021-02-04 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (124, 1, '2021-02-05 12:23:36.772000', '2021-02-05 13:17:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (125, 1, '2021-02-06 12:23:36.772000', '2021-02-06 13:02:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (126, 1, '2021-02-08 12:23:36.772000', '2021-02-08 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (127, 1, '2021-02-09 12:23:36.772000', '2021-02-09 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (128, 1, '2021-02-10 12:23:36.772000', '2021-02-10 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (129, 1, '2021-02-12 12:23:36.772000', '2021-02-12 13:14:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (130, 1, '2021-02-13 12:23:36.772000', '2021-02-13 13:11:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (131, 1, '2021-02-14 12:23:36.772000', '2021-02-14 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (132, 1, '2021-02-15 12:23:36.772000', '2021-02-15 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (133, 1, '2021-02-17 12:23:36.772000', '2021-02-17 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (134, 1, '2021-02-18 12:23:36.772000', '2021-02-18 13:18:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (135, 1, '2021-02-20 12:23:36.772000', '2021-02-20 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (136, 1, '2021-02-21 12:23:36.772000', '2021-02-21 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (137, 1, '2021-02-22 12:23:36.772000', '2021-02-22 13:22:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (138, 1, '2021-02-23 12:23:36.772000', '2021-02-23 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (139, 1, '2021-02-24 12:23:36.772000', '2021-02-24 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (140, 1, '2021-02-25 12:23:36.772000', '2021-02-25 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (141, 1, '2021-02-26 12:23:36.772000', '2021-02-26 13:01:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (142, 1, '2021-02-27 12:23:36.772000', '2021-02-27 13:05:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (143, 1, '2021-02-28 12:23:36.772000', '2021-02-28 13:17:36.772000');



insert into gym_session (session_id, user_id, check_in, check_out)
values (144, 1, '2021-03-01 12:23:36.772000', '2021-02-01 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (145, 1, '2021-03-02 12:23:36.772000', '2021-02-02 13:19:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (146, 1, '2021-03-03 12:23:36.772000', '2021-02-03 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (147, 1, '2021-03-04 12:23:36.772000', '2021-02-04 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (148, 1, '2021-03-05 12:23:36.772000', '2021-02-05 13:13:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (149, 1, '2021-03-06 12:23:36.772000', '2021-02-06 13:09:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (150, 1, '2021-03-08 12:23:36.772000', '2021-02-08 13:00:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (151, 1, '2021-03-09 12:23:36.772000', '2021-02-09 13:05:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (152, 1, '2021-03-10 12:23:36.772000', '2021-02-10 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (153, 1, '2021-03-12 12:23:36.772000', '2021-02-12 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (154, 1, '2021-03-13 12:23:36.772000', '2021-02-13 13:12:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (155, 1, '2021-03-14 12:23:36.772000', '2021-02-14 13:13:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (156, 1, '2021-03-15 12:23:36.772000', '2021-02-15 13:17:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (157, 1, '2021-03-16 12:23:36.772000', '2021-02-16 13:30:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (158, 1, '2021-03-17 12:23:36.772000', '2021-02-17 13:12:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (159, 1, '2021-03-18 12:23:36.772000', '2021-02-18 13:02:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (160, 1, '2021-03-20 12:23:36.772000', '2021-02-20 13:34:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (161, 1, '2021-03-21 12:23:36.772000', '2021-02-21 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (162, 1, '2021-03-22 12:23:36.772000', '2021-02-22 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (163, 1, '2021-03-23 12:23:36.772000', '2021-02-23 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (164, 1, '2021-03-26 12:23:36.772000', '2021-02-26 13:19:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (165, 1, '2021-03-27 12:23:36.772000', '2021-02-27 13:20:36.772000');



insert into gym_session (session_id, user_id, check_in, check_out)
values (166, 1, '2021-04-01 12:23:36.772000', '2021-04-01 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (167, 1, '2021-04-02 12:23:36.772000', '2021-04-02 13:19:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (168, 1, '2021-04-03 12:23:36.772000', '2021-04-03 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (169, 1, '2021-04-04 12:23:36.772000', '2021-04-04 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (170, 1, '2021-04-05 12:23:36.772000', '2021-04-05 13:13:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (171, 1, '2021-04-06 12:23:36.772000', '2021-04-06 13:09:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (172, 1, '2021-04-08 12:23:36.772000', '2021-04-08 13:00:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (173, 1, '2021-04-10 12:23:36.772000', '2021-04-10 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (174, 1, '2021-04-12 12:23:36.772000', '2021-04-12 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (175, 1, '2021-04-13 12:23:36.772000', '2021-04-13 13:12:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (176, 1, '2021-04-14 12:23:36.772000', '2021-04-14 13:13:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (177, 1, '2021-04-15 12:23:36.772000', '2021-04-15 13:17:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (178, 1, '2021-04-16 12:23:36.772000', '2021-04-16 13:30:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (179, 1, '2021-04-17 12:23:36.772000', '2021-04-17 13:12:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (180, 1, '2021-04-18 12:23:36.772000', '2021-04-18 13:02:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (181, 1, '2021-04-20 12:23:36.772000', '2021-04-20 13:34:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (182, 1, '2021-04-21 12:23:36.772000', '2021-04-21 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (183, 1, '2021-04-22 12:23:36.772000', '2021-04-22 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (184, 1, '2021-04-23 12:23:36.772000', '2021-04-23 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (185, 1, '2021-04-24 12:23:36.772000', '2021-04-24 13:14:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (186, 1, '2021-04-25 12:23:36.772000', '2021-04-25 13:18:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (187, 1, '2021-04-26 12:23:36.772000', '2021-04-26 13:19:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (188, 1, '2021-04-28 12:23:36.772000', '2021-04-28 13:14:36.772000');



insert into gym_session (session_id, user_id, check_in, check_out)
values (189, 1, '2021-05-01 12:23:36.772000', '2021-05-01 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (190, 1, '2021-05-02 12:23:36.772000', '2021-05-02 13:19:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (191, 1, '2021-05-03 12:23:36.772000', '2021-05-03 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (192, 1, '2021-05-04 12:23:36.772000', '2021-05-04 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (193, 1, '2021-05-05 12:23:36.772000', '2021-05-05 13:13:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (194, 1, '2021-05-06 12:23:36.772000', '2021-05-06 13:09:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (195, 1, '2021-05-08 12:23:36.772000', '2021-05-08 13:00:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (196, 1, '2021-05-09 12:23:36.772000', '2021-05-09 13:05:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (197, 1, '2021-05-10 12:23:36.772000', '2021-05-10 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (198, 1, '2021-05-12 12:23:36.772000', '2021-05-12 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (199, 1, '2021-05-15 12:23:36.772000', '2021-05-15 13:17:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (200, 1, '2021-05-16 12:23:36.772000', '2021-05-16 13:30:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (201, 1, '2021-05-17 12:23:36.772000', '2021-05-17 13:12:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (202, 1, '2021-05-18 12:23:36.772000', '2021-05-18 13:02:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (203, 1, '2021-05-20 12:23:36.772000', '2021-05-20 13:34:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (204, 1, '2021-05-21 12:23:36.772000', '2021-05-21 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (205, 1, '2021-05-22 12:23:36.772000', '2021-05-22 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (206, 1, '2021-05-23 12:23:36.772000', '2021-05-23 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (207, 1, '2021-05-24 12:23:36.772000', '2021-05-24 13:14:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (208, 1, '2021-05-25 12:23:36.772000', '2021-05-25 13:18:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (209, 1, '2021-05-26 12:23:36.772000', '2021-05-26 13:19:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (210, 1, '2021-05-27 12:23:36.772000', '2021-05-27 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (211, 1, '2021-05-28 12:23:36.772000', '2021-05-28 13:14:36.772000');



insert into gym_session (session_id, user_id, check_in, check_out)
values (212, 1, '2021-06-01 12:23:36.772000', '2021-06-01 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (213, 1, '2021-06-02 12:23:36.772000', '2021-06-02 13:19:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (214, 1, '2021-06-03 12:23:36.772000', '2021-06-03 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (215, 1, '2021-06-04 12:23:36.772000', '2021-06-04 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (216, 1, '2021-06-05 12:23:36.772000', '2021-06-05 13:13:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (217, 1, '2021-06-06 12:23:36.772000', '2021-06-06 13:09:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (218, 1, '2021-06-08 12:23:36.772000', '2021-06-08 13:00:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (219, 1, '2021-06-09 12:23:36.772000', '2021-06-09 13:05:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (220, 1, '2021-06-10 12:23:36.772000', '2021-06-10 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (221, 1, '2021-06-12 12:23:36.772000', '2021-06-12 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (222, 1, '2021-06-13 12:23:36.772000', '2021-06-13 13:12:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (223, 1, '2021-06-14 12:23:36.772000', '2021-06-14 13:13:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (224, 1, '2021-06-15 12:23:36.772000', '2021-06-15 13:17:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (225, 1, '2021-06-16 12:23:36.772000', '2021-06-16 13:30:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (226, 1, '2021-06-17 12:23:36.772000', '2021-06-17 13:12:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (227, 1, '2021-06-18 12:23:36.772000', '2021-06-18 13:02:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (228, 1, '2021-06-20 12:23:36.772000', '2021-06-20 13:34:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (229, 1, '2021-06-21 12:23:36.772000', '2021-06-21 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (230, 1, '2021-06-22 12:23:36.772000', '2021-06-22 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (231, 1, '2021-06-23 12:23:36.772000', '2021-06-23 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (232, 1, '2021-06-24 12:23:36.772000', '2021-06-24 13:14:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (233, 1, '2021-06-25 12:23:36.772000', '2021-06-25 13:18:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (234, 1, '2021-06-26 12:23:36.772000', '2021-06-26 13:19:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (235, 1, '2021-06-28 12:23:36.772000', '2021-06-28 13:14:36.772000');



insert into gym_session (session_id, user_id, check_in, check_out)
values (236, 1, '2021-07-01 12:23:36.772000', '2021-07-01 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (237, 1, '2021-07-02 12:23:36.772000', '2021-07-02 13:19:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (238, 1, '2021-07-03 12:23:36.772000', '2021-07-03 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (239, 1, '2021-07-04 12:23:36.772000', '2021-07-04 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (240, 1, '2021-07-05 12:23:36.772000', '2021-07-05 13:13:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (241, 1, '2021-07-06 12:23:36.772000', '2021-07-06 13:09:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (242, 1, '2021-07-08 12:23:36.772000', '2021-07-08 13:00:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (243, 1, '2021-07-09 12:23:36.772000', '2021-07-09 13:05:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (244, 1, '2021-07-10 12:23:36.772000', '2021-07-10 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (245, 1, '2021-07-12 12:23:36.772000', '2021-07-12 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (246, 1, '2021-07-13 12:23:36.772000', '2021-07-13 13:12:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (247, 1, '2021-07-14 12:23:36.772000', '2021-07-14 13:13:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (248, 1, '2021-07-15 12:23:36.772000', '2021-07-15 13:17:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (249, 1, '2021-07-16 12:23:36.772000', '2021-07-16 13:30:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (250, 1, '2021-07-17 12:23:36.772000', '2021-07-17 13:12:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (251, 1, '2021-07-21 12:23:36.772000', '2021-07-21 13:20:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (252, 1, '2021-07-22 12:23:36.772000', '2021-07-22 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (253, 1, '2021-07-23 12:23:36.772000', '2021-07-23 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (254, 1, '2021-07-24 12:23:36.772000', '2021-07-24 13:14:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (255, 1, '2021-07-25 12:23:36.772000', '2021-07-25 13:18:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (256, 1, '2021-07-26 12:23:36.772000', '2021-07-26 13:19:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (257, 1, '2021-07-27 12:23:36.772000', '2021-07-27 13:20:36.772000');



insert into gym_session (session_id, user_id, check_in, check_out)
values (258, 1, '2021-08-01 12:23:36.772000', '2021-08-01 13:23:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (259, 1, '2021-08-02 12:23:36.772000', '2021-08-02 13:19:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (260, 1, '2021-08-03 12:23:36.772000', '2021-08-03 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (261, 1, '2021-08-04 12:23:36.772000', '2021-08-04 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (262, 1, '2021-08-05 12:23:36.772000', '2021-08-05 13:13:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (263, 1, '2021-08-06 12:23:36.772000', '2021-08-06 13:09:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (264, 1, '2021-08-08 12:23:36.772000', '2021-08-08 13:00:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (265, 1, '2021-08-09 12:23:36.772000', '2021-08-09 13:05:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (266, 1, '2021-08-10 12:23:36.772000', '2021-08-10 13:21:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (267, 1, '2021-08-12 12:23:36.772000', '2021-08-12 13:15:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (268, 1, '2021-08-13 12:23:36.772000', '2021-08-13 13:12:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (269, 1, '2021-08-14 12:23:36.772000', '2021-08-14 13:13:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (270, 1, '2021-08-15 12:23:36.772000', '2021-08-15 13:17:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (271, 1, '2021-08-16 12:23:36.772000', '2021-08-16 13:30:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (272, 1, '2021-08-17 12:23:36.772000', '2021-08-17 13:12:36.772000');

insert into gym_session (session_id, user_id, check_in, check_out)
values (273, 1, '2021-08-18 12:23:36.772000', '2021-08-18 13:02:36.772000');



update exercise_class
set class_color = 'blue'
where class_name ILIKE 'cycling';

update exercise_class
set class_color = 'green'
where class_name ILIKE 'yoga';

update exercise_class
set class_color = 'orange'
where class_name ILIKE 'HIIT';

update exercise_class
set class_color = 'red'
where class_name ILIKE 'pilates';

update exercise_class
set class_color = 'purple'
where class_name ILIKE 'zumba';

COMMIT;