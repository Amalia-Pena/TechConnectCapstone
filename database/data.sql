-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- INSERT statements go here
insert into equipment (name, met_value) VALUES ('Treadmill', 5.0 );
insert into equipment (name, met_value) VALUES ('Stationary Bike',  6.8 );
insert into equipment (name, met_value) VALUES ('Lat Pulldown', 6.3 );
insert into equipment (name, met_value) VALUES ('Leg Extension Machine', 5.8 );
insert into equipment (name, met_value) VALUES ('Leg Curl Machine', 6.0 );
insert into equipment (name, met_value) VALUES ('Leg Press Machine',  6.0 );
insert into equipment (name, met_value) VALUES ('Bicep Curl Machine', 5.0 );
insert into equipment (name, met_value) VALUES ('Hammer Strength Machine',  4.8);
insert into equipment (name, met_value) VALUES ('Bench Press', 6.3 );
insert into equipment (name, met_value) VALUES ('Incline Bench Press',6.6  );
insert into equipment (name, met_value) VALUES ('Pullup Bar', 5.5 );
insert into equipment (name, met_value) VALUES ('Preacher Bench',  5.8);
insert into equipment (name, met_value) VALUES ('Calf Machine',  5.5);
insert into equipment (name, met_value) VALUES ('Peck Deck Machine', 6.0 );




insert into assistance_media (equipment_id, photo_link, photo_name) values ((select equipment_id from equipment where name = 'Treadmill'), 'https://i.imgur.com/ktJvBNA.png', 'Treadmill Image');
insert into assistance_media (equipment_id, photo_link, photo_name) values ((select equipment_id from equipment where name = 'Stationary Bike'), 'https://i.imgur.com/XE4wCnX.jpg','Stationary Bike Image');
insert into assistance_media (equipment_id, photo_link, photo_name) values ((select equipment_id from equipment where name = 'Lat Pulldown'), 'https://i.imgur.com/5kfPIQR.png', 'Lat Pulldown Image');
insert into assistance_media (equipment_id, photo_link, photo_name) values ((select equipment_id from equipment where name = 'Leg Extension Machine'), 'https://i.imgur.com/tiipemx.jpg', 'Leg Extension Machine Image');
insert into assistance_media (equipment_id, photo_link, photo_name) values ((select equipment_id from equipment where name = 'Leg Curl Machine'), 'https://i.imgur.com/YBQQhDm.jpg', 'Leg Curl Machine Image');
insert into assistance_media (equipment_id, photo_link, photo_name) values ((select equipment_id from equipment where name = 'Leg Press Machine'), 'https://i.imgur.com/E6devtR.jpg', 'Leg Press Machine Image');
insert into assistance_media (equipment_id, photo_link, photo_name) values ((select equipment_id from equipment where name = 'Bicep Curl Machine'), 'https://i.imgur.com/B9vioQX.jpg', 'Bicep Curl Machine Image');
insert into assistance_media (equipment_id, photo_link, photo_name) values ((select equipment_id from equipment where name = 'Hammer Strength Machine'), 'https://i.imgur.com/5kaVtg0.jpg', 'Hammer Strength Machine Image');
insert into assistance_media (equipment_id, photo_link, photo_name) values ((select equipment_id from equipment where name = 'Bench Press'), 'https://i.imgur.com/9hvmD7q.jpg', 'Bench Press Image');
insert into assistance_media (equipment_id, photo_link, photo_name) values ((select equipment_id from equipment where name = 'Incline Bench Press'), 'https://i.imgur.com/8z9SCjs.jpg', 'Incline Bench Press Image');
insert into assistance_media (equipment_id, photo_link, photo_name) values ((select equipment_id from equipment where name = 'Pullup Bar'), 'https://i.imgur.com/XBgZ8EA.jpg', 'Pullup Bar Image');
insert into assistance_media (equipment_id, photo_link, photo_name) values ((select equipment_id from equipment where name = 'Preacher Bench'), 'https://i.imgur.com/znKzpHU.jpg', 'Preacher Bench Image');
insert into assistance_media (equipment_id, photo_link, photo_name) values ((select equipment_id from equipment where name = 'Calf Machine'), 'https://i.imgur.com/DBExv3T.jpg', 'Calf Machine Image');
insert into assistance_media (equipment_id, photo_link, photo_name) values ((select equipment_id from equipment where name = 'Peck Deck Machine'), 'https://i.imgur.com/dNFQ7RL.jpg', 'Peck Deck Machine Image');



COMMIT;