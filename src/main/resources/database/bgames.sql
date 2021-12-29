--
-- PostgreSQL database dump
--

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
-- Dumping data for table board_game
--

INSERT INTO board_game (board_game_id, description, designer, image_path, min_age, players, playing_time, release_year, title) VALUES
(1, 'Alternate Names: Dobble, Moomin<br>\r\nSpot it!, a.k.a. Dobble, is a simple pattern recognition game in which players try to find an image shown on two cards.<br>\r\nEach card in original Spot it! features eight different symbols, with the symbols varying in size from one card to the next. Any two cards have exactly one symbol in common. For the basic Spot it! game, reveal one card, then another. Whoever spots the symbol in common on both cards claims the first card, then another card is revealed for players to search, and so on. Whoever has collected the most cards when the 55-card deck runs out wins!\r\n', ' Denis Blanchot', 'https://i.imgur.com/zrFrdSH.jpg', 7, '2-8', '15', 2009, 'Spot it!'),
(2, 'Players take on the role of dwarves. As miners, they are in a mine, hunting for gold. Suddenly, a pick axe swings down and shatters the mine lamp. The saboteur has struck. But which of the players are saboteurs? Will you find the gold, or will the fiendish actions of the saboteurs lead them to it first? After three rounds, the player with the most gold is the winner.', 'Frederic Moyersoen', 'https://i.imgur.com/d2olQEo.jpg', 8, '3-10', '30', 2004, 'Saboteur'),
(3, 'One player is the storyteller for the turn and looks at the images on the 6 cards in her hand. From one of these, she makes up a sentence and says it out loud (without showing the card to the other players).\r\nEach other player selects the card in their hands which best matches the sentence and gives the selected card to the storyteller, without showing it to the others.\r\nThe storyteller shuffles her card with all the received cards. All pictures are shown face up and every player has to bet upon which picture was the storyteller''s.\r\nIf nobody or everybody finds the correct card, the storyteller scores 0, and each of the other players scores 2. Otherwise the storyteller and whoever found the correct answer score 3. Players score 1 point for every vote for their own card.', 'Jean-Louis Roubira', 'https://i.imgur.com/EB1QHDY.jpg', 8, '3-6', '30', 2008, 'Dixit'),
(4, 'Each player is dealt a hand of cards. In order to win you must be the first player to get rid of all of your cards. Each turn, all of the players reveal one of their cards. If two cards are identical, those players must make a grab for the Totem. The faster player then gives their cards to their unfortunate adversary.', ' Thomas Vuarchex', 'https://i.imgur.com/2FveCE9.jpg', 7, '2-8', '10', 1997, 'Jungle Speed'),
(5, 'Players take the part of land owners, attempting to buy and then develop their land. Income is gained by other players visiting their properties and money is spent when they visit properties belonging to other players. When times get tough, players may have to mortgage their properties to raise cash for fines, taxes and other misfortunes.', ' Charles Darrow', 'https://i.imgur.com/N1PEOXO.jpg', 8, '2-8', '60-180', 1933, 'Monopoly'),
(6, 'In this classic word game, players use their seven drawn letter-tiles to form words on the gameboard. Each word laid out earns points based on the commonality of the letters used, with certain board spaces giving bonuses. But a word can only be played if it uses at least one already-played tile or adds to an already-played word.', 'Alfred Mosher Butts', 'https://i.imgur.com/z9KrdSH.jpg', 10, '2-4', '90', 1948, 'Scrabble'),
(7, 'Do not get angry (originally Mensch ärgere Dich nicht) is a strategy board game for two to four players, in which the players race their four tokens from start to finish according to the rolls of a single die.', 'Josef Friedrich Schmidt', 'https://i.imgur.com/660nTkt.jpg', 7, '2-4', '30', 1914, 'Do not get angry'),
(8, 'In Codenames, two teams compete to see who can make contact with all of their agents first. Spymasters give one-word clues that can point to multiple words on the board. Their teammates try to guess words of the right colour while avoiding those that belong to the opposing team. And everyone wants to avoid the assassin.', 'Vlaada Chvátil', 'https://i.imgur.com/82KyuvY.jpg', 14, '2-8', '15', 2015, 'Codenames'),
(9, 'Polish version of Monopoly. Game mechanics is almost exactly the same like in Monopoly. Players buy properties located in various European countries, grouped by their region.', 'Uncredited', 'https://i.imgur.com/hAFE5DI.jpg', 14, '2-5', '90', 1983, 'Eurobusiness'),
(10, 'Carcassonne is a tile-placement game in which the players draw and place a tile with a piece of southern French landscape on it. The tile might feature a city, a road, a cloister, grassland or some combination thereof, and it must be placed adjacent to tiles that have already been played, in such a way that cities are connected to cities, roads to roads, etcetera. Having placed a tile, the player can then decide to place one of his meeples on one of the areas on it: on the city as a knight, on the road as a robber, on a cloister as a monk, or on the grass as a farmer. When that area is complete, that meeple scores points for its owner.', 'Klaus-Jürgen Wrede', 'https://i.imgur.com/0pQFxEi.jpg', 8, '2-5', '30-45', 2000, 'Carcassonne'),
(11, 'Monopoly Star Wars style. In this version of Monopoly players must buy up property and build homes in the Star Wars universe.', 'Uncredited', 'https://i.imgur.com/gTipwTI.jpg', 8, '2-8', '90', 1997, 'Monopoly: Star Wars');

-- --------------------------------------------------------

--
-- Table structure for table board_game_category
--

CREATE TABLE board_game_category (
  board_game_id bigint NOT NULL,
  category_id bigint NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table category
--

CREATE TABLE category (
  category_id SERIAL PRIMARY KEY,
  description text,
  name character varying(255) NOT NULL
);

-- --------------------------------------------------------

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
-- Dumping data for table favourite
--

INSERT INTO favourite (favourite_id, creation_date, board_game_id, user_id) VALUES
(1, '2019-09-14 21:09:54.002025', 1, 1),
(2, '2019-09-15 10:13:58.658964', 5, 1),
(3, '2019-09-15 11:36:26.028256', 8, 1),
(4, '2019-09-15 12:02:54.952435', 10, 1);

-- -------------------------------------------------------

--
-- Table structure for table password_token
--

CREATE TABLE password_token (
  password_token_id SERIAL PRIMARY KEY,
  email character varying(255),
  expiration_date timestamp,
  password_token character varying(255)
);

-- --------------------------------------------------------

--
-- Table structure for table role
--

CREATE TABLE role (
  role_id SERIAL PRIMARY KEY,
  role character varying(50)  NOT NULL
);

--
-- Dumping data for table role
--

INSERT INTO role (role_id, role) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

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
-- Dumping data for table app_user
--

INSERT INTO app_user (user_id, active, email, first_name, last_name, login, password) VALUES
(1, 1, 'admin@gmail.com', 'Admin', 'Admin', 'admin', '$2a$10$Pl.mEJvC/1zsg7FFgC5ihe0ddvPNeY3ag8S8Gm2E50sgH6sE8rh22'),
(2, 1, 'test@gmail.com', 'Tester', 'Test', 'test', '$2a$10$TM92qxuC.39DpmnqX3hIxuQchUJIzUgh9h45JrU.3Alb.jzqgM5d2'),
(3, 1, 'test2@gmail.com', 'Tester', 'Test', 'test2', '$2a$10$TM92qxuC.39DpmnqX3hIxuQchUJIzUgh9h45JrU.3Alb.jzqgM5d2'),
(4, 1, 'test3@gmail.com', 'Tester', 'Test', 'test3', '$2a$10$TM92qxuC.39DpmnqX3hIxuQchUJIzUgh9h45JrU.3Alb.jzqgM5d2'),
(5, 0, 'test4@gmail.com', 'Tester', 'Test', 'test4', '$2a$10$TM92qxuC.39DpmnqX3hIxuQchUJIzUgh9h45JrU.3Alb.jzqgM5d2'),
(6, 1, 'test5@gmail.com', 'Tester', 'Test', 'test5', '$2a$10$rMQ3bRZF81x7glE4RWegauMihvnrnQw6T/Q./t.jEDMOQwF1mgB82'),
(7, 1, 'test6@gmail.com', 'Tester', 'Test', 'test6', '$2a$10$rMQ3bRZF81x7glE4RWegauMihvnrnQw6T/Q./t.jEDMOQwF1mgB82');

-- --------------------------------------------------------

--
-- Table structure for table user_role
--

CREATE TABLE user_role (
  user_id bigint NOT NULL,
  role_id bigint NOT NULL
);

--
-- Dumping data for table user_role
--

INSERT INTO user_role (user_id, role_id) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2);

--
-- Indexes for dumped tables
--

ALTER TABLE board_game_category ADD CONSTRAINT FKset0ikuyeupb30084xlx3cf7n FOREIGN KEY (board_game_id) REFERENCES board_game;
ALTER TABLE board_game_category ADD CONSTRAINT FKkrnqpjg7uys41j5rpuj50aynd FOREIGN KEY (category_id) REFERENCES category;
ALTER TABLE favourite ADD CONSTRAINT FKds9jephh0iyrk3vpnjiqm2rhj FOREIGN KEY (board_game_id) REFERENCES board_game;
ALTER TABLE favourite ADD CONSTRAINT FKe9tsyem8mrxy49pb0p0rcib56 FOREIGN KEY (user_id) REFERENCES app_user;
ALTER TABLE user_role ADD CONSTRAINT FKa68196081fvovjhkek5m97n3y FOREIGN KEY (role_id) REFERENCES role;
ALTER TABLE user_role ADD CONSTRAINT FKg7fr1r7o0fkk41nfhnjdyqn7b FOREIGN KEY (user_id) REFERENCES app_user;