BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user,person, employee, classes, person_classes, equipment, assistance_media, workout_profile, gym_session, equipment_usage, workout, goal, person_goals;
CREATE TABLE app_user
(
    user_id   SERIAL PRIMARY KEY,
    user_name varchar(32)  NOT NULL UNIQUE,
    password  varchar(32)  NOT NULL,
    role      varchar(32),
    salt      varchar(255) NOT NULL
);

CREATE TABLE person
(
    person_id  SERIAL UNIQUE,
    user_id    int NOT NULL,
    name       varchar(255),
    email      varchar(255),
    photo_path varchar(255),
    PRIMARY KEY (person_id),
    FOREIGN KEY (user_id) REFERENCES app_user (user_id)
);

CREATE TABLE workout_profile
(
    profile_id SERIAL UNIQUE,
    person_id  int NOT NULL,
    weight     varchar(255),
    height     varchar(255),
    PRIMARY KEY (profile_id),
    FOREIGN KEY (person_id) REFERENCES person (person_id)
);

CREATE TABLE employee
(
    employee_id SERIAL UNIQUE,
    person_id   int NOT NULL,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (person_id) REFERENCES Person (person_id)
);

CREATE TABLE classes
(
    class_id          SERIAL UNIQUE,
    instructor_id     int NOT NULL,
    class_name        varchar(255),
    class_description varchar(255),
    class_start_date  date,
    class_end_date    date,
    PRIMARY KEY (class_id),
    FOREIGN KEY (instructor_id) REFERENCES Employee (employee_id)
);

CREATE TABLE person_classes
(
    class_id  int NOT NULL,
    person_id int NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Classes (class_id),
    FOREIGN KEY (person_id) REFERENCES person (person_id)
);

create table equipment
(
    equipment_id serial NOT NULL UNIQUE,
    name         varchar(255),
    MET_value    int,
    PRIMARY KEY (equipment_id)
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
    profile_id int  NOT NULL,
    check_in   date NOT NULL,
    check_out  date NOT NULL,
    PRIMARY KEY (session_id),
    FOREIGN KEY (profile_id) REFERENCES Workout_Profile (profile_id)
);
create table equipment_usage
(
    equipment_usage_id serial UNIQUE,
    equipment_id       int NOT NULL,
    distance           varchar(255),
    incline            boolean,
    decline            boolean,
    reps               int,
    weight_per_rep     int,
    check_in           date,
    check_out          date,
    PRIMARY KEY (equipment_usage_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment (equipment_id)
);

create table workout
(
    equipment_usage_id int NOT NULL,
    session_id         int NOT NULL,
    FOREIGN KEY (equipment_usage_id) REFERENCES Equipment_Usage (equipment_usage_id),
    FOREIGN KEY (session_id) REFERENCES Gym_Session (session_id)
);



CREATE TABLE goal
(
    goal_id     SERIAL UNIQUE,
    person_id   int NOT NULL,
    description varchar(255),
    PRIMARY KEY (goal_id),
    FOREIGN KEY (person_id) REFERENCES person (person_id)
);



CREATE TABLE person_goals
(
    goal_id   int NOT NULL,
    person_id int NOT NULL,
    FOREIGN KEY (goal_id) REFERENCES goal (goal_id),
    FOREIGN KEY (person_id) REFERENCES person (person_id)
);

COMMIT;