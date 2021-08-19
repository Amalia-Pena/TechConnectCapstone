BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user,person, employee, exercise_class, class_members, equipment, assistance_media, workout_profile, gym_session, equipment_usage, session_equipment, goal, person_goals;
CREATE TABLE app_user
(
    user_id    SERIAL PRIMARY KEY,
    user_name  varchar(32)  NOT NULL UNIQUE,
    password   varchar(32)  NOT NULL,
    role       varchar(32),
    salt       varchar(255) NOT NULL,
    first_name varchar(255),
    last_name  varchar(255),
    email      varchar(255),
    photo_path bytea,
    height     decimal,
    weight     decimal
);

CREATE TABLE exercise_class
(
    class_id          SERIAL UNIQUE,
    instructor_id     int NOT NULL,
    class_name        varchar(255),
    class_description varchar(500),
    class_start_date  TIMESTAMP,
    class_end_date    TIMESTAMP,
    class_color       varchar(45),
    PRIMARY KEY (class_id),
    FOREIGN KEY (instructor_id) REFERENCES app_user (user_id)
);

CREATE TABLE class_members
(
    class_id int NOT NULL,
    user_id  int NOT NULL,
    FOREIGN KEY (class_id) REFERENCES exercise_class (class_id),
    FOREIGN KEY (user_id) REFERENCES app_user (user_id)
);
CREATE TABLE equipment_categories
(
    category_id serial NOT NULL,
    name varchar (255),
    PRIMARY KEY (category_id)
);

create table equipment
(
    equipment_id serial NOT NULL UNIQUE,
    category_id int NOT NULL,
    name         varchar(255),
    MET_value    decimal,
    PRIMARY KEY (equipment_id),
    FOREIGN KEY (category_id) REFERENCES equipment_categories(category_id)
);



CREATE TABLE assistance_media
(
    assistance_id  SERIAL UNIQUE,
    equipment_id   int NOT NULL,
    photo_link     varchar(255),
    photo_name     varchar(255),
    video_link     varchar(255),
    video_name     varchar(255),
    animation_link varchar(255),
    animation_name varchar(255),
    PRIMARY KEY (assistance_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment (equipment_id)
);



create table gym_session
(
    session_id serial UNIQUE,
    user_id    int  NOT NULL,
    check_in   timestamp NOT NULL,
    check_out  timestamp NOT NULL,
    PRIMARY KEY (session_id),
    FOREIGN KEY (user_id) REFERENCES app_user (user_id)
);

create table equipment_usage
(
    equipment_usage_id serial UNIQUE,
    equipment_id       int NOT NULL,
    session_id         int NOT NULL,
    reps               int,
    weight_per_rep     int,
    distance           decimal,
    check_in           timestamp,
    check_out          timestamp,
    PRIMARY KEY (equipment_usage_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment (equipment_id),
    FOREIGN KEY (session_id) REFERENCES gym_session (session_id)
);

CREATE TABLE goal
(
    goal_id     SERIAL UNIQUE,
    user_id     int NOT NULL,
    description varchar(255),
    PRIMARY KEY (goal_id),
    FOREIGN KEY (user_id) REFERENCES app_user (user_id)
);

CREATE TABLE person_goals
(
    goal_id int NOT NULL,
    user_id int NOT NULL,
    FOREIGN KEY (goal_id) REFERENCES goal (goal_id),
    FOREIGN KEY (user_id) REFERENCES app_user (user_id)
);

COMMIT;