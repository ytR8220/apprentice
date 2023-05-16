CREATE TABLE Channel (
  Channel_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Channel_Name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO Channel (Channel_Name) VALUES ('ドラマ1');
INSERT INTO Channel (Channel_Name) VALUES ('ドラマ2');
INSERT INTO Channel (Channel_Name) VALUES ('スポーツ1');
INSERT INTO Channel (Channel_Name) VALUES ('スポーツ2');
INSERT INTO Channel (Channel_Name) VALUES ('アニメ1');
INSERT INTO Channel (Channel_Name) VALUES ('アニメ2');
INSERT INTO Channel (Channel_Name) VALUES ('音楽');
INSERT INTO Channel (Channel_Name) VALUES ('映画1');
INSERT INTO Channel (Channel_Name) VALUES ('映画2');
INSERT INTO Channel (Channel_Name) VALUES ('バラエティ');
INSERT INTO Channel (Channel_Name) VALUES ('ニュース');

CREATE TABLE Genre (
  Genre_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Genre_Name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO Genre (Genre_Name) VALUES ('映画');
INSERT INTO Genre (Genre_Name) VALUES ('ドラマ');
INSERT INTO Genre (Genre_Name) VALUES ('アニメ');
INSERT INTO Genre (Genre_Name) VALUES ('スポーツ');
INSERT INTO Genre (Genre_Name) VALUES ('モータースポーツ');
INSERT INTO Genre (Genre_Name) VALUES ('バラエティ');
INSERT INTO Genre (Genre_Name) VALUES ('音楽');
INSERT INTO Genre (Genre_Name) VALUES ('ニュース');

CREATE TABLE Program (
  Program_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Genre_ID INT NOT NULL,
  Program_Name VARCHAR(50) NOT NULL INDEX,
  Program_Description VARCHAR(255) NOT NULL,
  FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID)
);

INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (1, '番組1', '番組1の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (1, '番組2', '番組2の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (1, '番組3', '番組3の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (1, '番組4', '番組4の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (1, '番組5', '番組5の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (1, '番組6', '番組6の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (1, '番組7', '番組7の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (1, '番組8', '番組8の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (1, '番組9', '番組9の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (1, '番組10', '番組10の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組11', '番組11の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組12', '番組12の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組13', '番組13の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組14', '番組14の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組15', '番組15の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組16', '番組16の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組17', '番組17の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組18', '番組18の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組19', '番組19の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組20', '番組20の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (3, '番組21', '番組21の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (3, '番組22', '番組22の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (3, '番組23', '番組23の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (3, '番組24', '番組24の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (3, '番組25', '番組25の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (3, '番組26', '番組26の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (3, '番組27', '番組27の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (3, '番組28', '番組28の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (3, '番組29', '番組29の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (3, '番組30', '番組30の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (4, '番組31', '番組31の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (4, '番組32', '番組32の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (4, '番組33', '番組33の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (4, '番組34', '番組34の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (4, '番組35', '番組35の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (4, '番組36', '番組36の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (4, '番組37', '番組37の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (4, '番組38', '番組38の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (5, '番組39', '番組39の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (5, '番組40', '番組40の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (5, '番組41', '番組41の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (6, '番組42', '番組42の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (6, '番組43', '番組43の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (6, '番組44', '番組44の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (6, '番組45', '番組45の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (7, '番組46', '番組46の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (7, '番組47', '番組47の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (7, '番組48', '番組48の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (7, '番組49', '番組49の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (8, '番組50', '番組50の説明');

CREATE TABLE Season (
  Season_ID INT NOT NULL PRIMARY KEY,
  Season_Name VARCHAR(50) NOT NULL,
);

INSERT INTO Season (Season_ID, Season_Name) VALUES (0, 'シーズンなし');
INSERT INTO Season (Season_ID, Season_Name) VALUES (1, 'シーズン1');
INSERT INTO Season (Season_ID, Season_Name) VALUES (2, 'シーズン2');
INSERT INTO Season (Season_ID, Season_Name) VALUES (3, 'シーズン3');

CREATE TABLE Episode (
  Episode_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Program_ID INT NOT NULL,
  Season_ID INT NOT NULL DEFAULT 0,
  Episode_number INT NOT NULL,
  Episode_Name VARCHAR(50) NOT NULL INDEX,
  Episode_Description VARCHAR(255) NOT NULL,
  Release_Date DATE NOT NULL,
  FOREIGN KEY (Program_ID) REFERENCES Program(Program_ID),
  FOREIGN KEY (Season_ID) REFERENCES Season(Season_ID)
);

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (1, 0, 1, 'エピソード1', 'エピソード1の説明', '2016-10-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (2, 0, 1, 'エピソード1', 'エピソード1の説明', '2016-09-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (3, 0, 1, 'エピソード1', 'エピソード1の説明', '2017-07-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (4, 0, 1, 'エピソード1', 'エピソード1の説明', '2017-04-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (5, 0, 1, 'エピソード1', 'エピソード1の説明', '2017-02-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 0, 1, 'エピソード1', 'エピソード1の説明', '2018-11-19');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (7, 0, 1, 'エピソード1', 'エピソード1の説明', '2019-09-22');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (8, 0, 1, 'エピソード1', 'エピソード1の説明', '2021-04-29');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (9, 0, 1, 'エピソード1', 'エピソード1の説明', '2022-06-30');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (10, 0, 1, 'エピソード1', 'エピソード1の説明', '2022-03-31');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 1, 1, 'エピソード1', 'エピソード1-1の説明', '2019-01-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 1, 2, 'エピソード2', 'エピソード1-2の説明', '2019-01-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 1, 3, 'エピソード3', 'エピソード1-3の説明', '2019-01-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 1, 4, 'エピソード4', 'エピソード1-4の説明', '2019-01-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 1, 5, 'エピソード5', 'エピソード1-5の説明', '2019-01-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 2, 1, 'エピソード1', 'エピソード2-1の説明', '2019-02-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 2, 2, 'エピソード2', 'エピソード2-2の説明', '2019-02-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 2, 3, 'エピソード3', 'エピソード2-3の説明', '2019-02-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 2, 4, 'エピソード4', 'エピソード2-4の説明', '2019-02-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 2, 5, 'エピソード5', 'エピソード2-5の説明', '2019-02-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (12, 1, 1, 'エピソード1', 'エピソード1-1の説明', '2019-10-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (12, 1, 2, 'エピソード2', 'エピソード1-2の説明', '2019-10-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (12, 1, 3, 'エピソード3', 'エピソード1-3の説明', '2019-10-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (12, 1, 4, 'エピソード4', 'エピソード1-4の説明', '2019-10-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (12, 1, 5, 'エピソード5', 'エピソード1-5の説明', '2019-10-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 1, 1, 'エピソード1', 'エピソード1-1の説明', '2018-03-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 1, 2, 'エピソード2', 'エピソード1-2の説明', '2018-03-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 1, 3, 'エピソード3', 'エピソード1-3の説明', '2018-03-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 1, 4, 'エピソード4', 'エピソード1-4の説明', '2018-03-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 1, 5, 'エピソード5', 'エピソード1-5の説明', '2018-03-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 2, 1, 'エピソード1', 'エピソード2-1の説明', '2018-06-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 2, 2, 'エピソード2', 'エピソード2-2の説明', '2018-06-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 2, 3, 'エピソード3', 'エピソード2-3の説明', '2018-06-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 2, 4, 'エピソード4', 'エピソード2-4の説明', '2018-06-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 2, 5, 'エピソード5', 'エピソード2-5の説明', '2018-06-15');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 1, 1, 'エピソード1', 'エピソード3-1の説明', '2018-11-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 1, 2, 'エピソード2', 'エピソード3-2の説明', '2018-11-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 1, 3, 'エピソード3', 'エピソード3-3の説明', '2018-11-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 1, 4, 'エピソード4', 'エピソード3-4の説明', '2018-11-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 1, 5, 'エピソード5', 'エピソード3-5の説明', '2018-11-15');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 2, 1, 'エピソード1', 'エピソード1-1の説明', '2020-02-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 2, 2, 'エピソード2', 'エピソード1-2の説明', '2020-02-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 2, 3, 'エピソード3', 'エピソード1-3の説明', '2020-02-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 2, 4, 'エピソード4', 'エピソード1-4の説明', '2020-02-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 2, 5, 'エピソード5', 'エピソード1-5の説明', '2020-02-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 1, 1, 'エピソード1', 'エピソード2-1の説明', '2020-05-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 1, 2, 'エピソード2', 'エピソード2-2の説明', '2020-05-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 1, 3, 'エピソード3', 'エピソード2-3の説明', '2020-05-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 1, 4, 'エピソード4', 'エピソード2-4の説明', '2020-05-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 1, 5, 'エピソード5', 'エピソード2-5の説明', '2020-05-15');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 2, 1, 'エピソード1', 'エピソード3-1の説明', '2020-08-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 2, 2, 'エピソード2', 'エピソード3-2の説明', '2020-08-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 2, 3, 'エピソード3', 'エピソード3-3の説明', '2020-08-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 2, 4, 'エピソード4', 'エピソード3-4の説明', '2020-08-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 2, 5, 'エピソード5', 'エピソード3-5の説明', '2020-08-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (15, 0, 1, 'エピソード1', 'エピソード1の説明', '2022-10-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (15, 0, 2, 'エピソード2', 'エピソード1の説明', '2022-10-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (15, 0, 3, 'エピソード3', 'エピソード1の説明', '2022-10-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (15, 0, 4, 'エピソード4', 'エピソード1の説明', '2022-10-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (15, 0, 5, 'エピソード5', 'エピソード1の説明', '2022-10-15');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (16, 0, 1, 'エピソード1', 'エピソード1の説明', '2021-09-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (16, 0, 2, 'エピソード2', 'エピソード1の説明', '2021-09-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (16, 0, 3, 'エピソード3', 'エピソード1の説明', '2021-09-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (16, 0, 4, 'エピソード4', 'エピソード1の説明', '2021-09-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (16, 0, 5, 'エピソード5', 'エピソード1の説明', '2021-09-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (17, 0, 1, 'エピソード1', 'エピソード1の説明', '2019-12-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (17, 0, 2, 'エピソード2', 'エピソード1の説明', '2019-12-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (17, 0, 3, 'エピソード3', 'エピソード1の説明', '2019-12-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (17, 0, 4, 'エピソード4', 'エピソード1の説明', '2019-12-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (17, 0, 5, 'エピソード5', 'エピソード1の説明', '2019-12-15');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 1, 1, 'エピソード1', 'エピソード1-1の説明', '2019-10-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 1, 2, 'エピソード2', 'エピソード1-2の説明', '2019-10-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 1, 3, 'エピソード3', 'エピソード1-3の説明', '2019-10-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 1, 4, 'エピソード4', 'エピソード1-4の説明', '2019-10-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 1, 5, 'エピソード5', 'エピソード1-5の説明', '2019-10-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 2, 1, 'エピソード1', 'エピソード2-1の説明', '2020-01-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 2, 2, 'エピソード2', 'エピソード2-2の説明', '2020-01-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 2, 3, 'エピソード3', 'エピソード2-3の説明', '2020-01-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 2, 4, 'エピソード4', 'エピソード2-4の説明', '2020-01-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 2, 5, 'エピソード5', 'エピソード2-5の説明', '2020-01-15');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 3, 1, 'エピソード1', 'エピソード3-1の説明', '2020-06-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 3, 2, 'エピソード2', 'エピソード3-2の説明', '2020-06-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 3, 3, 'エピソード3', 'エピソード3-3の説明', '2020-06-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 3, 4, 'エピソード4', 'エピソード3-4の説明', '2020-06-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 3, 5, 'エピソード5', 'エピソード3-5の説明', '2020-06-15');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (19, 0, 1, 'エピソード1', 'エピソード1-1の説明', '2021-04-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (19, 0, 2, 'エピソード2', 'エピソード1-2の説明', '2021-04-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (19, 0, 3, 'エピソード3', 'エピソード1-3の説明', '2021-04-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (19, 0, 4, 'エピソード4', 'エピソード1-4の説明', '2021-04-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (19, 0, 5, 'エピソード5', 'エピソード1-5の説明', '2021-04-15');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (20, 1, 1, 'エピソード1', 'エピソード1-1の説明', '2017-10-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (20, 1, 2, 'エピソード2', 'エピソード1-2の説明', '2017-10-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (20, 1, 3, 'エピソード3', 'エピソード1-3の説明', '2017-10-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (20, 1, 4, 'エピソード4', 'エピソード1-4の説明', '2017-10-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (20, 1, 5, 'エピソード5', 'エピソード1-5の説明', '2017-10-15');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (20, 2, 1, 'エピソード1', 'エピソード2-1の説明', '2018-02-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (20, 2, 2, 'エピソード2', 'エピソード2-2の説明', '2018-02-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (20, 2, 3, 'エピソード3', 'エピソード2-3の説明', '2018-02-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (20, 2, 4, 'エピソード4', 'エピソード2-4の説明', '2018-02-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (20, 2, 5, 'エピソード5', 'エピソード2-5の説明', '2018-02-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (21, 1, 1, 'エピソード1', 'エピソード1-1の説明', '2016-06-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (21, 1, 2, 'エピソード2', 'エピソード1-2の説明', '2016-06-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (21, 1, 3, 'エピソード3', 'エピソード1-3の説明', '2016-06-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (21, 1, 4, 'エピソード4', 'エピソード1-4の説明', '2016-06-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (21, 1, 5, 'エピソード5', 'エピソード1-5の説明', '2016-06-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (21, 2, 1, 'エピソード1', 'エピソード2-1の説明', '2017-08-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (21, 2, 2, 'エピソード2', 'エピソード2-2の説明', '2017-08-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (21, 2, 3, 'エピソード3', 'エピソード2-3の説明', '2017-08-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (21, 2, 4, 'エピソード4', 'エピソード2-4の説明', '2017-08-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (21, 2, 5, 'エピソード5', 'エピソード2-5の説明', '2017-08-15');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (22, 0, 1, 'エピソード1', 'エピソード1の説明', '2023-03-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (22, 0, 2, 'エピソード2', 'エピソード1の説明', '2023-03-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (22, 0, 3, 'エピソード3', 'エピソード1の説明', '2023-03-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (22, 0, 4, 'エピソード4', 'エピソード1の説明', '2023-03-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (22, 0, 5, 'エピソード5', 'エピソード1の説明', '2023-03-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (23, 1, 1, 'エピソード1', 'エピソード1-1の説明', '2019-03-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (23, 1, 2, 'エピソード2', 'エピソード1-2の説明', '2019-03-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (23, 1, 3, 'エピソード3', 'エピソード1-3の説明', '2019-03-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (23, 1, 4, 'エピソード4', 'エピソード1-4の説明', '2019-03-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (23, 1, 5, 'エピソード5', 'エピソード1-5の説明', '2019-03-15');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (23, 2, 1, 'エピソード1', 'エピソード2-1の説明', '2019-11-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (23, 2, 2, 'エピソード2', 'エピソード2-2の説明', '2019-11-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (23, 2, 3, 'エピソード3', 'エピソード2-3の説明', '2019-11-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (23, 2, 4, 'エピソード4', 'エピソード2-4の説明', '2019-11-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (23, 2, 5, 'エピソード5', 'エピソード2-5の説明', '2019-11-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (24, 1, 1, 'エピソード1', 'エピソード1-1の説明', '2016-06-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (24, 1, 2, 'エピソード2', 'エピソード1-2の説明', '2016-06-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (24, 1, 3, 'エピソード3', 'エピソード1-3の説明', '2016-06-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (24, 1, 4, 'エピソード4', 'エピソード1-4の説明', '2016-06-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (24, 1, 5, 'エピソード5', 'エピソード1-5の説明', '2016-06-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (24, 2, 1, 'エピソード1', 'エピソード2-1の説明', '2017-04-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (24, 2, 2, 'エピソード2', 'エピソード2-2の説明', '2017-04-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (24, 2, 3, 'エピソード3', 'エピソード2-3の説明', '2017-04-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (24, 2, 4, 'エピソード4', 'エピソード2-4の説明', '2017-04-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (24, 2, 5, 'エピソード5', 'エピソード2-5の説明', '2017-04-15');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (24, 3, 1, 'エピソード1', 'エピソード3-1の説明', '2018-01-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (24, 3, 2, 'エピソード2', 'エピソード3-2の説明', '2018-01-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (24, 3, 3, 'エピソード3', 'エピソード3-3の説明', '2018-01-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (24, 3, 4, 'エピソード4', 'エピソード3-4の説明', '2018-01-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (24, 3, 5, 'エピソード5', 'エピソード3-5の説明', '2018-01-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (25, 1, 1, 'エピソード1', 'エピソード1-1の説明', '2015-10-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (25, 1, 2, 'エピソード2', 'エピソード1-2の説明', '2015-10-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (25, 1, 3, 'エピソード3', 'エピソード1-3の説明', '2015-10-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (25, 1, 4, 'エピソード4', 'エピソード1-4の説明', '2015-10-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (25, 1, 5, 'エピソード5', 'エピソード1-5の説明', '2015-10-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (25, 2, 1, 'エピソード1', 'エピソード2-1の説明', '2016-02-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (25, 2, 2, 'エピソード2', 'エピソード2-2の説明', '2016-02-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (25, 2, 3, 'エピソード3', 'エピソード2-3の説明', '2016-02-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (25, 2, 4, 'エピソード4', 'エピソード2-4の説明', '2016-02-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (25, 2, 5, 'エピソード5', 'エピソード2-5の説明', '2016-02-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (26, 0, 1, 'エピソード1', 'エピソード1の説明', '2019-11-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (26, 0, 2, 'エピソード2', 'エピソード1の説明', '2019-11-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (26, 0, 3, 'エピソード3', 'エピソード1の説明', '2019-11-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (26, 0, 4, 'エピソード4', 'エピソード1の説明', '2019-11-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (26, 0, 5, 'エピソード5', 'エピソード1の説明', '2019-11-15');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (27, 1, 1, 'エピソード1', 'エピソード1-1の説明', '2014-12-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (27, 1, 2, 'エピソード2', 'エピソード1-2の説明', '2014-12-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (27, 1, 3, 'エピソード3', 'エピソード1-3の説明', '2014-12-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (27, 1, 4, 'エピソード4', 'エピソード1-4の説明', '2014-12-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (27, 1, 5, 'エピソード5', 'エピソード1-5の説明', '2014-12-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (27, 2, 1, 'エピソード1', 'エピソード2-1の説明', '2015-06-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (27, 2, 2, 'エピソード2', 'エピソード2-2の説明', '2015-06-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (27, 2, 3, 'エピソード3', 'エピソード2-3の説明', '2015-06-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (27, 2, 4, 'エピソード4', 'エピソード2-4の説明', '2015-06-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (27, 2, 5, 'エピソード5', 'エピソード2-5の説明', '2015-06-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (27, 3, 1, 'エピソード1', 'エピソード3-1の説明', '2015-12-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (27, 3, 2, 'エピソード2', 'エピソード3-2の説明', '2015-12-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (27, 3, 3, 'エピソード3', 'エピソード3-3の説明', '2015-12-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (27, 3, 4, 'エピソード4', 'エピソード3-4の説明', '2015-12-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (27, 3, 5, 'エピソード5', 'エピソード3-5の説明', '2015-12-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (28, 1, 1, 'エピソード1', 'エピソード1-1の説明', '2018-11-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (28, 1, 2, 'エピソード2', 'エピソード1-2の説明', '2018-11-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (28, 1, 3, 'エピソード3', 'エピソード1-3の説明', '2018-11-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (28, 1, 4, 'エピソード4', 'エピソード1-4の説明', '2018-11-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (28, 1, 5, 'エピソード5', 'エピソード1-5の説明', '2018-11-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (28, 2, 1, 'エピソード1', 'エピソード2-1の説明', '2019-02-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (28, 2, 2, 'エピソード2', 'エピソード2-2の説明', '2019-02-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (28, 2, 3, 'エピソード3', 'エピソード2-3の説明', '2019-02-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (28, 2, 4, 'エピソード4', 'エピソード2-4の説明', '2019-02-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (28, 2, 5, 'エピソード5', 'エピソード2-5の説明', '2019-02-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (28, 3, 1, 'エピソード1', 'エピソード3-1の説明', '2019-06-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (28, 3, 2, 'エピソード2', 'エピソード3-2の説明', '2019-06-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (28, 3, 3, 'エピソード3', 'エピソード3-3の説明', '2019-06-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (28, 3, 4, 'エピソード4', 'エピソード3-4の説明', '2019-06-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (28, 3, 5, 'エピソード5', 'エピソード3-5の説明', '2019-06-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (29, 1, 1, 'エピソード1', 'エピソード1-1の説明', '2020-05-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (29, 1, 2, 'エピソード2', 'エピソード1-2の説明', '2020-05-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (29, 1, 3, 'エピソード3', 'エピソード1-3の説明', '2020-05-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (29, 1, 4, 'エピソード4', 'エピソード1-4の説明', '2020-05-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (29, 1, 5, 'エピソード5', 'エピソード1-5の説明', '2020-05-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (29, 2, 1, 'エピソード1', 'エピソード2-1の説明', '2020-08-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (29, 2, 2, 'エピソード2', 'エピソード2-2の説明', '2020-08-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (29, 2, 3, 'エピソード3', 'エピソード2-3の説明', '2020-08-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (29, 2, 4, 'エピソード4', 'エピソード2-4の説明', '2020-08-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (29, 2, 5, 'エピソード5', 'エピソード2-5の説明', '2020-08-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (29, 3, 1, 'エピソード1', 'エピソード3-1の説明', '2020-12-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (29, 3, 2, 'エピソード2', 'エピソード3-2の説明', '2020-12-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (29, 3, 3, 'エピソード3', 'エピソード3-3の説明', '2020-12-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (29, 3, 4, 'エピソード4', 'エピソード3-4の説明', '2020-12-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (29, 3, 5, 'エピソード5', 'エピソード3-5の説明', '2020-12-15');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (30, 1, 1, 'エピソード1', 'エピソード1-1の説明', '2021-03-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (30, 1, 2, 'エピソード2', 'エピソード1-2の説明', '2021-03-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (30, 1, 3, 'エピソード3', 'エピソード1-3の説明', '2021-03-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (30, 1, 4, 'エピソード4', 'エピソード1-4の説明', '2021-03-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (30, 1, 5, 'エピソード5', 'エピソード1-5の説明', '2021-03-15');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (30, 2, 1, 'エピソード1', 'エピソード2-1の説明', '2021-12-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (30, 2, 2, 'エピソード2', 'エピソード2-2の説明', '2021-12-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (30, 2, 3, 'エピソード3', 'エピソード2-3の説明', '2021-12-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (30, 2, 4, 'エピソード4', 'エピソード2-4の説明', '2021-12-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (30, 2, 5, 'エピソード5', 'エピソード2-5の説明', '2021-12-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (31, 0, 1, 'エピソード1', 'エピソード1の説明', '2015-02-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (32, 0, 1, 'エピソード1', 'エピソード1の説明', '2016-04-15');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (33, 0, 1, 'エピソード1', 'エピソード1の説明', '2017-06-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (34, 0, 1, 'エピソード1', 'エピソード1の説明', '2018-08-06');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (35, 0, 1, 'エピソード1', 'エピソード1の説明', '2019-10-07');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (36, 0, 1, 'エピソード1', 'エピソード1の説明', '2020-01-09');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (37, 0, 1, 'エピソード1', 'エピソード1の説明', '2022-03-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (38, 0, 1, 'エピソード1', 'エピソード1の説明', '2023-05-30');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (39, 0, 1, 'エピソード1', 'エピソード1の説明', '2016-02-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (40, 0, 1, 'エピソード1', 'エピソード1の説明', '2018-12-15');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (41, 0, 1, 'エピソード1', 'エピソード1の説明', '2021-05-09');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (42, 0, 1, 'エピソード1', 'エピソード1の説明', '2017-02-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (43, 0, 1, 'エピソード1', 'エピソード1の説明', '2017-06-17');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (44, 0, 1, 'エピソード1', 'エピソード1の説明', '2020-03-19');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (45, 0, 1, 'エピソード1', 'エピソード1の説明', '2022-12-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (46, 0, 1, 'エピソード1', 'エピソード1の説明', '2014-08-06');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (47, 0, 1, 'エピソード1', 'エピソード1の説明', '2016-10-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (48, 0, 1, 'エピソード1', 'エピソード1の説明', '2020-12-07');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (49, 0, 1, 'エピソード1', 'エピソード1の説明', '2022-02-12');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (50, 0, 1, 'エピソード1', 'エピソード1の説明', '2020-12-22');

CREATE TABLE Program_table (
  Episode_ID INT NOT NULL,
  Start_Time DATETIME NOT NULL,
  End_Time DATETIME NOT NULL,
  Channel_ID INT NOT NULL,
  Views_Count INT NOT NULL DEFAULT 0,
  PRIMARY KEY (Episode_ID, Channel_ID, Start_Time),
  FOREIGN KEY (Episode_ID) REFERENCES Episode(Episode_ID),
  FOREIGN KEY (Channel_ID) REFERENCES Channel(Channel_ID)
);

INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (1, '2023-04-01 09:00:00', '2019-04-01 11:00:00', 8, 420);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (2, '2023-04-05 09:00:00', '2019-04-05 11:00:00', 8, 332);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (3, '2023-04-10 09:00:00', '2019-04-10 11:00:00', 8, 423);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (7, '2023-04-15 09:00:00', '2019-04-15 11:00:00', 8, 244);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (8, '2023-04-20 09:00:00', '2019-04-20 11:00:00', 8, 566);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (4, '2023-04-05 09:00:00', '2019-04-05 11:00:00', 9, 453);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (5, '2023-04-10 09:00:00', '2019-04-10 11:00:00', 9, 453);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (6, '2023-04-20 09:00:00', '2019-04-20 11:00:00', 9, 123);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (9, '2023-04-25 09:00:00', '2019-04-25 11:00:00', 9, 322);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (10, '2023-04-30 09:00:00', '2019-04-30 11:00:00', 9, 411);

INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (11, '2023-04-30 09:00:00', '2019-04-30 11:00:00', 9, 331);