/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

 -- command to file to run in psql: \i /Users/honree/ambivalent-acacia/server/models/schema.sql

drop database thumbscheck;

CREATE DATABASE thumbscheck;

\c thumbscheck
    
CREATE TABLE users (
  id serial PRIMARY KEY,
  username VARCHAR(20) not null,
  password VARCHAR(20) not null,
  name VARCHAR(40) not null,
  email VARCHAR(40) not null
);

-- ---
-- Table 'presentations'
-- 
-- ---

CREATE TABLE presentations (
  id serial PRIMARY KEY,
  title VARCHAR(100) not null,
  owner_id integer REFERENCES users(id)
);

-- ---
-- Table 'questions'
-- 
-- ---

CREATE TABLE questions (
  id serial PRIMARY KEY,
  prompt VARCHAR(200) not null,
  presentation_id integer REFERENCES presentations(id),
  question_type integer not null
);

-- ---
-- Table 'question_types'
-- 
-- ---

    
CREATE TABLE question_types (
  id serial PRIMARY KEY,
  type VARCHAR(40) not null
);

-- ---
-- Table 'sessions'
-- 
-- ---

    
CREATE TABLE sessions (
  id serial PRIMARY KEY,
  presentation_id integer REFERENCES presentations(id),
  identifier VARCHAR(200) not null,
  created_at timestamp
);

-- ---
-- Table 'sessions_questions'
-- 
-- ---

    
CREATE TABLE sessions_questions (
  id serial PRIMARY KEY,
  session_id integer REFERENCES sessions(id),
  question_id integer REFERENCES questions(id),
  results_thumbs_up INTEGER NULL DEFAULT NULL,
  result_thumbs_down INTEGER NULL DEFAULT NULL,
  result_a INTEGER NULL DEFAULT NULL,
  result_b INTEGER NULL DEFAULT NULL,
  result_c INTEGER NULL DEFAULT NULL,
  result_d INTEGER NULL DEFAULT NULL,
  result_e INTEGER NULL DEFAULT NULL,
  result_open_response VARCHAR(1000) NULL DEFAULT NULL,
  question_type_snapshot INTEGER NULL DEFAULT NULL
);

-- ---
-- Foreign Keys 
-- ---

-- ALTER TABLE presentations ADD FOREIGN KEY (owner_id) REFERENCES user (id);
-- ALTER TABLE questions ADD FOREIGN KEY (presentation_id) REFERENCES presentations (id);
-- ALTER TABLE questions ADD FOREIGN KEY (question_type) REFERENCES question_types (id);
-- ALTER TABLE sessions ADD FOREIGN KEY (presentation_id) REFERENCES presentations (id);
-- ALTER TABLE sessions_questions ADD FOREIGN KEY (session_id) REFERENCES sessions (id);
-- ALTER TABLE sessions_questions ADD FOREIGN KEY (question_id) REFERENCES questions (id);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE user ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE presentations ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE questions ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE question_types ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE sessions ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE sessions_questions ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO user (id,username,password,name,email) VALUES
-- ('','','','','');
-- INSERT INTO presentations (id,title,owner_id) VALUES
-- ('','','');
-- INSERT INTO questions (id,prompt,presentation_id,question_type) VALUES
-- ('','','','');
-- INSERT INTO question_types (id,type) VALUES
-- ('','');
-- INSERT INTO sessions (id,presentation_id,identifier,time) VALUES
-- ('','','','');
-- INSERT INTO sessions_questions (id,session_id,question_id,results_thumbs_up,result_thumbs_down,result_a,result_b,result_c,result_d,result_e,result_open_response,question_type_snapshot) VALUES
-- ('','','','','','','','','','','','');