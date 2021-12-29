--
-- Database: bgames
--

-- --------------------------------------------------------

--
-- Table structure for table board_game
--

CREATE TABLE board_game (
  board_game_id SERIAL PRIMARY KEY,
  description text,
  designer character varying(255),
  image_path character varying(255),
  min_age bigint,
  players character varying(255),
  playing_time character varying(255),
  release_year bigint,
  title character varying(255)
);

--
-- Table structure for table board_game_category
--

CREATE TABLE board_game_category (
  board_game_id bigint NOT NULL,
  category_id bigint NOT NULL
);

--
-- Table structure for table category
--

CREATE TABLE category (
  category_id SERIAL PRIMARY KEY,
  description text,
  name character varying(255) NOT NULL
);

--
-- Table structure for table favourite
--

CREATE TABLE favourite (
  favourite_id SERIAL PRIMARY KEY,
  creation_date timestamp,
  board_game_id bigint,
  user_id bigint
);

--
-- Table structure for table password_token
--

CREATE TABLE password_token (
  password_token_id SERIAL PRIMARY KEY,
  email character varying(255),
  expiration_date timestamp,
  password_token character varying(255)
);

--
-- Table structure for table role
--

CREATE TABLE role (
  role_id SERIAL PRIMARY KEY,
  role character varying(50)  NOT NULL
);

--
-- Table structure for table app_user
--

CREATE TABLE app_user (
  user_id SERIAL PRIMARY KEY,
  active bigint NOT NULL,
  email character varying(255) NOT NULL,
  first_name character varying(50) NOT NULL,
  last_name character varying(50) NOT NULL,
  login character varying(30) NOT NULL,
  password character varying(100) NOT NULL,
  activation_token character varying(40),
  image_path character varying(255)
);

--
-- Table structure for table user_role
--

CREATE TABLE user_role (
  user_id bigint NOT NULL,
  role_id bigint NOT NULL
);

-- --------------------------------------------------------

--
-- Constraints
--

ALTER TABLE board_game_category ADD CONSTRAINT FKset0ikuyeupb30084xlx3cf7n FOREIGN KEY (board_game_id) REFERENCES board_game;
ALTER TABLE board_game_category ADD CONSTRAINT FKkrnqpjg7uys41j5rpuj50aynd FOREIGN KEY (category_id) REFERENCES category;
ALTER TABLE favourite ADD CONSTRAINT FKds9jephh0iyrk3vpnjiqm2rhj FOREIGN KEY (board_game_id) REFERENCES board_game ON DELETE CASCADE;
ALTER TABLE favourite ADD CONSTRAINT FKe9tsyem8mrxy49pb0p0rcib56 FOREIGN KEY (user_id) REFERENCES app_user ON DELETE CASCADE;
ALTER TABLE user_role ADD CONSTRAINT FKa68196081fvovjhkek5m97n3y FOREIGN KEY (role_id) REFERENCES role;
ALTER TABLE user_role ADD CONSTRAINT FKg7fr1r7o0fkk41nfhnjdyqn7b FOREIGN KEY (user_id) REFERENCES app_user;

-- --------------------------------------------------------

--
-- Data for table role
--

INSERT INTO role (role) VALUES
('ROLE_ADMIN'),
('ROLE_USER');