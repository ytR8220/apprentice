CREATE TABLE Channel (
  Channel_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Channel_Name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO Channel (Channel_Name) VALUES ('チャンネル1');
INSERT INTO Channel (Channel_Name) VALUES ('チャンネル2');
INSERT INTO Channel (Channel_Name) VALUES ('チャンネル3');
INSERT INTO Channel (Channel_Name) VALUES ('チャンネル4');

CREATE TABLE Genre (
  Genre_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Genre_Name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO Genre (Genre_Name) VALUES ('映画');
INSERT INTO Genre (Genre_Name) VALUES ('ドラマ');
INSERT INTO Genre (Genre_Name) VALUES ('アニメ');
INSERT INTO Genre (Genre_Name) VALUES ('スポーツ');
INSERT INTO Genre (Genre_Name) VALUES ('バラエティ');
INSERT INTO Genre (Genre_Name) VALUES ('ニュース');

CREATE TABLE Program (
  Program_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Genre_ID INT NOT NULL,
  Program_Name VARCHAR(50) NOT NULL,
  Program_Description VARCHAR(255) NOT NULL,
  FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID),
  INDEX(Program_Name)
);

INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (1, '番組1', '番組1の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (1, '番組2', '番組2の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (1, '番組3', '番組3の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組4', '番組4の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組5', '番組5の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組6', '番組6の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組7', '番組7の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組8', '番組8の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (2, '番組9', '番組9の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (3, '番組10', '番組10の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (3, '番組11', '番組11の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (3, '番組12', '番組12の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (3, '番組13', '番組13の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (3, '番組14', '番組14の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (4, '番組15', '番組15の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (4, '番組16', '番組16の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (5, '番組17', '番組17の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (5, '番組18', '番組18の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (6, '番組19', '番組19の説明');
INSERT INTO Program (Genre_ID, Program_Name, Program_Description) VALUES (6, '番組20', '番組20の説明');

CREATE TABLE Season (
  Season_ID INT NOT NULL PRIMARY KEY,
  Season_Name VARCHAR(50) NOT NULL
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
  Episode_Name VARCHAR(50) NOT NULL,
  Episode_Description VARCHAR(255) NOT NULL,
  Release_Date DATE NOT NULL,
  FOREIGN KEY (Program_ID) REFERENCES Program(Program_ID),
  FOREIGN KEY (Season_ID) REFERENCES Season(Season_ID),
  INDEX(Episode_Name)
);

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (1, 0, 1, '映画1', '映画1の説明', '2016-10-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (2, 0, 1, '映画2', '映画2の説明', '2016-09-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (3, 0, 1, '映画3', '映画3の説明', '2017-07-14');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (4, 1, 1, 'ドラマAエピソード1-1', 'ドラマAエピソード1-1の説明', '2019-01-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (4, 1, 2, 'ドラマAエピソード1-2', 'ドラマAエピソード1-2の説明', '2019-01-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (4, 1, 3, 'ドラマAエピソード1-3', 'ドラマAエピソード1-3の説明', '2019-01-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (4, 1, 4, 'ドラマAエピソード1-4', 'ドラマAエピソード1-4の説明', '2019-01-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (4, 1, 5, 'ドラマAエピソード1-5', 'ドラマAエピソード1-5の説明', '2019-01-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (4, 2, 1, 'ドラマAエピソード2-1', 'ドラマAエピソード2-1の説明', '2019-02-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (4, 2, 2, 'ドラマAエピソード2-2', 'ドラマAエピソード2-2の説明', '2019-02-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (4, 2, 3, 'ドラマAエピソード2-3', 'ドラマAエピソード2-3の説明', '2019-02-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (4, 2, 4, 'ドラマAエピソード2-4', 'ドラマAエピソード2-4の説明', '2019-02-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (4, 2, 5, 'ドラマAエピソード2-5', 'ドラマAエピソード2-5の説明', '2019-02-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (5, 0, 1, 'ドラマBエピソード1', 'ドラマBエピソード1の説明', '2019-10-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (5, 0, 2, 'ドラマBエピソード2', 'ドラマBエピソード2の説明', '2019-10-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (5, 0, 3, 'ドラマBエピソード3', 'ドラマBエピソード3の説明', '2019-10-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (5, 0, 4, 'ドラマBエピソード4', 'ドラマBエピソード4の説明', '2019-10-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (5, 0, 5, 'ドラマBエピソード5', 'ドラマBエピソード5の説明', '2019-10-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 1, 1, 'ドラマCエピソード1-1', 'ドラマCエピソード1-1の説明', '2018-03-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 1, 2, 'ドラマCエピソード1-2', 'ドラマCエピソード1-2の説明', '2018-03-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 1, 3, 'ドラマCエピソード1-3', 'ドラマCエピソード1-3の説明', '2018-03-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 1, 4, 'ドラマCエピソード1-4', 'ドラマCエピソード1-4の説明', '2018-03-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 1, 5, 'ドラマCエピソード1-5', 'ドラマCエピソード1-5の説明', '2018-03-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 2, 1, 'ドラマCエピソード2-1', 'ドラマCエピソード2-1の説明', '2018-06-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 2, 2, 'ドラマCエピソード2-2', 'ドラマCエピソード2-2の説明', '2018-06-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 2, 3, 'ドラマCエピソード2-3', 'ドラマCエピソード2-3の説明', '2018-06-6');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 2, 4, 'ドラマCエピソード2-4', 'ドラマCエピソード2-4の説明', '2018-06-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 2, 5, 'ドラマCエピソード2-5', 'ドラマCエピソード2-5の説明', '2018-06-15');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 3, 1, 'ドラマCエピソード3-1', 'ドラマCエピソード3-1の説明', '2018-11-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 3, 2, 'ドラマCエピソード3-2', 'ドラマCエピソード3-2の説明', '2018-11-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 3, 3, 'ドラマCエピソード3-3', 'ドラマCエピソード3-3の説明', '2018-11-6');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 3, 4, 'ドラマCエピソード3-4', 'ドラマCエピソード3-4の説明', '2018-11-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (6, 3, 5, 'ドラマCエピソード3-5', 'ドラマCエピソード3-5の説明', '2018-11-15');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (7, 1, 1, 'ドラマDエピソード1-1', 'ドラマDエピソード1-1の説明', '2020-02-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (7, 1, 2, 'ドラマDエピソード1-2', 'ドラマDエピソード1-2の説明', '2020-02-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (7, 1, 3, 'ドラマDエピソード1-3', 'ドラマDエピソード1-3の説明', '2020-02-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (7, 1, 4, 'ドラマDエピソード1-4', 'ドラマDエピソード1-4の説明', '2020-02-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (7, 1, 5, 'ドラマDエピソード1-5', 'ドラマDエピソード1-5の説明', '2020-02-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (7, 2, 1, 'ドラマDエピソード2-1', 'ドラマDエピソード2-1の説明', '2020-05-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (7, 2, 2, 'ドラマDエピソード2-2', 'ドラマDエピソード2-2の説明', '2020-05-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (7, 2, 3, 'ドラマDエピソード2-3', 'ドラマDエピソード2-3の説明', '2020-05-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (7, 2, 4, 'ドラマDエピソード2-4', 'ドラマDエピソード2-4の説明', '2020-05-07');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (7, 2, 5, 'ドラマDエピソード2-5', 'ドラマDエピソード2-5の説明', '2020-05-15');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (8, 0, 1, 'ドラマEエピソード1', 'ドラマEエピソード1の説明', '2022-10-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (8, 0, 2, 'ドラマEエピソード2', 'ドラマEエピソード2の説明', '2022-10-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (8, 0, 3, 'ドラマEエピソード3', 'ドラマEエピソード3の説明', '2022-10-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (8, 0, 4, 'ドラマEエピソード4', 'ドラマEエピソード4の説明', '2022-10-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (8, 0, 5, 'ドラマEエピソード5', 'ドラマEエピソード5の説明', '2022-10-15');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (9, 0, 1, 'ドラマFエピソード1', 'ドラマFエピソード1の説明', '2021-09-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (9, 0, 2, 'ドラマFエピソード2', 'ドラマFエピソード2の説明', '2021-09-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (9, 0, 3, 'ドラマFエピソード3', 'ドラマFエピソード3の説明', '2021-09-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (9, 0, 4, 'ドラマFエピソード4', 'ドラマFエピソード4の説明', '2021-09-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (9, 0, 5, 'ドラマFエピソード5', 'ドラマFエピソード5の説明', '2021-09-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (10, 0, 1, 'アニメAエピソード1', 'アニメAエピソード1の説明', '2019-12-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (10, 0, 2, 'アニメAエピソード2', 'アニメAエピソード2の説明', '2019-12-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (10, 0, 3, 'アニメAエピソード3', 'アニメAエピソード3の説明', '2019-12-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (10, 0, 4, 'アニメAエピソード4', 'アニメAエピソード4の説明', '2019-12-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (10, 0, 5, 'アニメAエピソード5', 'アニメAエピソード5の説明', '2019-12-15');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 1, 1, 'アニメBエピソード1-1', 'アニメBエピソード1-1の説明', '2019-10-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 1, 2, 'アニメBエピソード1-2', 'アニメBエピソード1-2の説明', '2019-10-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 1, 3, 'アニメBエピソード1-3', 'アニメBエピソード1-3の説明', '2019-10-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 1, 4, 'アニメBエピソード1-4', 'アニメBエピソード1-4の説明', '2019-10-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 1, 5, 'アニメBエピソード1-5', 'アニメBエピソード1-5の説明', '2019-10-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 2, 1, 'アニメBエピソード2-1', 'アニメBエピソード2-1の説明', '2020-01-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 2, 2, 'アニメBエピソード2-2', 'アニメBエピソード2-2の説明', '2020-01-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 2, 3, 'アニメBエピソード2-3', 'アニメBエピソード2-3の説明', '2020-01-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 2, 4, 'アニメBエピソード2-4', 'アニメBエピソード2-4の説明', '2020-01-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 2, 5, 'アニメBエピソード2-5', 'アニメBエピソード2-5の説明', '2020-01-15');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 3, 1, 'アニメBエピソード3-1', 'アニメBエピソード3-1の説明', '2020-06-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 3, 2, 'アニメBエピソード3-2', 'アニメBエピソード3-2の説明', '2020-06-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 3, 3, 'アニメBエピソード3-3', 'アニメBエピソード3-3の説明', '2020-06-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 3, 4, 'アニメBエピソード3-4', 'アニメBエピソード3-4の説明', '2020-06-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (11, 3, 5, 'アニメBエピソード3-5', 'アニメBエピソード3-5の説明', '2020-06-15');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (12, 0, 1, 'アニメCエピソード1', 'アニメCエピソード1の説明', '2021-04-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (12, 0, 2, 'アニメCエピソード2', 'アニメCエピソード2の説明', '2021-04-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (12, 0, 3, 'アニメCエピソード3', 'アニメCエピソード3の説明', '2021-04-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (12, 0, 4, 'アニメCエピソード4', 'アニメCエピソード4の説明', '2021-04-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (12, 0, 5, 'アニメCエピソード5', 'アニメCエピソード5の説明', '2021-04-15');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 1, 1, 'アニメDエピソード1-1', 'アニメDエピソード1-1の説明', '2017-10-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 1, 2, 'アニメDエピソード1-2', 'アニメDエピソード1-2の説明', '2017-10-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 1, 3, 'アニメDエピソード1-3', 'アニメDエピソード1-3の説明', '2017-10-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 1, 4, 'アニメDエピソード1-4', 'アニメDエピソード1-4の説明', '2017-10-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 1, 5, 'アニメDエピソード1-5', 'アニメDエピソード1-5の説明', '2017-10-15');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 2, 1, 'アニメDエピソード2-1', 'アニメDエピソード2-1の説明', '2018-02-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 2, 2, 'アニメDエピソード2-2', 'アニメDエピソード2-2の説明', '2018-02-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 2, 3, 'アニメDエピソード2-3', 'アニメDエピソード2-3の説明', '2018-02-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 2, 4, 'アニメDエピソード2-4', 'アニメDエピソード2-4の説明', '2018-02-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (13, 2, 5, 'アニメDエピソード2-5', 'アニメDエピソード2-5の説明', '2018-02-05');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 1, 1, 'アニメEエピソード1-1', 'アニメEエピソード1-1の説明', '2016-06-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 1, 2, 'アニメEエピソード1-2', 'アニメEエピソード1-2の説明', '2016-06-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 1, 3, 'アニメEエピソード1-3', 'アニメEエピソード1-3の説明', '2016-06-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 1, 4, 'アニメEエピソード1-4', 'アニメEエピソード1-4の説明', '2016-06-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 1, 5, 'アニメEエピソード1-5', 'アニメEエピソード1-5の説明', '2016-06-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 2, 1, 'アニメEエピソード2-1', 'アニメEエピソード2-1の説明', '2017-08-11');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 2, 2, 'アニメEエピソード2-2', 'アニメEエピソード2-2の説明', '2017-08-12');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 2, 3, 'アニメEエピソード2-3', 'アニメEエピソード2-3の説明', '2017-08-13');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 2, 4, 'アニメEエピソード2-4', 'アニメEエピソード2-4の説明', '2017-08-14');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (14, 2, 5, 'アニメEエピソード2-5', 'アニメEエピソード2-5の説明', '2017-08-15');

INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (15, 0, 1, 'スポーツ1', 'スポーツ1の説明', '2023-03-01');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (16, 0, 2, 'スポーツ2', 'スポーツ2の説明', '2023-03-02');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (17, 0, 3, 'バラエティ1', 'バラエティ1の説明', '2023-03-03');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (18, 0, 4, 'バラエティ2', 'バラエティ2の説明', '2023-03-04');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (19, 0, 5, 'ニュース1', 'ニュース1の説明', '2023-03-05');
INSERT INTO Episode (Program_ID, Season_ID, Episode_number, Episode_Name, Episode_Description, Release_Date) VALUES (20, 0, 5, 'ニュース2', 'ニュース2の説明', '2023-03-05');

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

INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (1, '2023-05-16 09:00:00', '2023-05-16 11:30:00', 2, 100);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (2, '2023-05-17 12:00:00', '2023-05-17 15:00:00', 4, 250);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (3, '2023-05-18 16:00:00', '2023-05-18 18:30:00', 1, 500);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (1, '2023-05-19 10:00:00', '2023-05-19 12:30:00', 3, 300);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (2, '2023-05-20 14:00:00', '2023-05-20 16:30:00', 1, 450);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (3, '2023-05-21 09:30:00', '2023-05-21 12:00:00', 2, 350);

INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (4, '2023-05-16 12:00:00', '2023-05-16 13:00:00', 4, 120);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (5, '2023-05-17 16:00:00', '2023-05-17 17:30:00', 3, 225);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (6, '2023-05-18 19:00:00', '2023-05-18 20:00:00', 2, 580);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (7, '2023-05-19 13:00:00', '2023-05-19 14:00:00', 1, 320);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (8, '2023-05-20 17:00:00', '2023-05-20 18:30:00', 4, 490);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (9, '2023-05-21 12:30:00', '2023-05-21 13:30:00', 3, 395);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (10, '2023-05-22 18:30:00', '2023-05-22 19:30:00', 2, 210);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (11, '2023-05-23 14:30:00', '2023-05-23 16:00:00', 1, 625);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (12, '2023-05-24 19:30:00', '2023-05-24 21:00:00', 4, 790);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (13, '2023-05-25 14:00:00', '2023-05-25 15:00:00', 3, 530);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (14, '2023-05-16 15:30:00', '2023-05-16 16:30:00', 1, 115);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (15, '2023-05-17 18:00:00', '2023-05-17 19:30:00', 2, 240);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (16, '2023-05-18 20:30:00', '2023-05-18 22:00:00', 3, 575);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (17, '2023-05-19 14:30:00', '2023-05-19 15:30:00', 4, 330);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (18, '2023-05-20 19:00:00', '2023-05-20 20:00:00', 1, 480);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (19, '2023-05-21 14:00:00', '2023-05-21 15:00:00', 4, 380);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (20, '2023-05-22 20:00:00', '2023-05-22 21:30:00', 3, 205);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (21, '2023-05-23 16:30:00', '2023-05-23 17:30:00', 2, 610);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (22, '2023-05-24 21:30:00', '2023-05-24 23:00:00', 1, 780);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (23, '2023-05-25 15:30:00', '2023-05-25 16:30:00', 4, 520);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (24, '2023-05-16 19:00:00', '2023-05-16 20:00:00', 4, 100);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (25, '2023-05-17 22:00:00', '2023-05-17 23:00:00', 3, 225);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (26, '2023-05-19 00:30:00', '2023-05-19 01:30:00', 2, 560);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (27, '2023-05-19 18:00:00', '2023-05-19 19:00:00', 1, 360);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (28, '2023-05-20 22:30:00', '2023-05-20 23:30:00', 2, 450);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (29, '2023-05-21 17:30:00', '2023-05-21 18:30:00', 3, 350);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (30, '2023-05-23 00:00:00', '2023-05-23 01:00:00', 4, 190);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (31, '2023-05-23 20:00:00', '2023-05-23 21:00:00', 1, 610);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (32, '2023-05-25 01:30:00', '2023-05-25 02:30:00', 2, 750);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (33, '2023-05-25 19:00:00', '2023-05-25 20:00:00', 3, 500);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (34, '2023-05-16 20:30:00', '2023-05-16 21:30:00', 1, 95);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (35, '2023-05-17 23:30:00', '2023-05-18 00:30:00', 2, 220);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (36, '2023-05-19 02:00:00', '2023-05-19 03:00:00', 3, 550);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (37, '2023-05-19 20:30:00', '2023-05-19 21:30:00', 4, 355);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (38, '2023-05-21 00:00:00', '2023-05-21 01:00:00', 1, 445);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (39, '2023-05-21 19:00:00', '2023-05-21 20:00:00', 2, 345);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (40, '2023-05-23 02:00:00', '2023-05-23 03:00:00', 3, 180);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (41, '2023-05-23 22:00:00', '2023-05-23 23:00:00', 4, 600);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (42, '2023-05-25 03:30:00', '2023-05-25 04:30:00', 1, 740);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (43, '2023-05-25 21:00:00', '2023-05-25 22:00:00', 2, 490);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (44, '2023-05-16 22:00:00', '2023-05-16 23:00:00', 4, 90);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (45, '2023-05-18 01:00:00', '2023-05-18 02:00:00', 3, 215);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (46, '2023-05-19 03:30:00', '2023-05-19 04:30:00', 2, 540);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (47, '2023-05-19 21:00:00', '2023-05-19 22:00:00', 1, 350);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (48, '2023-05-21 01:30:00', '2023-05-21 02:30:00', 2, 440);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (49, '2023-05-21 20:00:00', '2023-05-21 21:00:00', 3, 340);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (50, '2023-05-23 03:30:00', '2023-05-23 04:30:00', 4, 170);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (51, '2023-05-23 23:00:00', '2023-05-24 00:00:00', 1, 590);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (52, '2023-05-25 04:30:00', '2023-05-25 05:30:00', 2, 730);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (53, '2023-05-25 22:00:00', '2023-05-25 23:00:00', 3, 480);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (24, '2023-05-16 23:30:00', '2023-05-17 00:30:00', 1, 85);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (45, '2023-05-18 02:30:00', '2023-05-18 03:30:00', 2, 210);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (22, '2023-05-19 05:00:00', '2023-05-19 06:00:00', 3, 530);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (32, '2023-05-19 22:30:00', '2023-05-19 23:30:00', 4, 345);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (35, '2023-05-21 03:00:00', '2023-05-21 04:00:00', 1, 435);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (46, '2023-05-21 21:30:00', '2023-05-21 22:30:00', 2, 335);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (50, '2023-05-23 05:00:00', '2023-05-23 06:00:00', 3, 160);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (52, '2023-05-24 00:30:00', '2023-05-24 01:30:00', 4, 580);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (53, '2023-05-25 06:00:00', '2023-05-25 07:00:00', 1, 720);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (33, '2023-05-25 23:00:00', '2023-05-26 00:00:00', 2, 470);

INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (54, '2023-05-16 17:00:00', '2023-05-16 17:30:00', 4, 110);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (55, '2023-05-17 20:00:00', '2023-05-17 20:30:00', 1, 235);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (56, '2023-05-18 22:30:00', '2023-05-18 23:00:00', 2, 570);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (57, '2023-05-19 16:00:00', '2023-05-19 16:30:00', 3, 340);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (58, '2023-05-20 20:30:00', '2023-05-20 21:00:00', 2, 470);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (59, '2023-05-21 15:30:00', '2023-05-21 16:00:00', 1, 370);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (60, '2023-05-22 22:00:00', '2023-05-22 22:30:00', 4, 200);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (61, '2023-05-23 18:00:00', '2023-05-23 18:30:00', 3, 615);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (62, '2023-05-24 23:30:00', '2023-05-25 00:00:00', 1, 770);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (63, '2023-05-25 17:00:00', '2023-05-25 17:30:00', 2, 510);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (64, '2023-05-16 18:00:00', '2023-05-16 18:30:00', 1, 105);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (65, '2023-05-17 21:00:00', '2023-05-17 21:30:00', 2, 230);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (66, '2023-05-18 23:30:00', '2023-05-19 00:00:00', 3, 565);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (67, '2023-05-19 17:00:00', '2023-05-19 17:30:00', 4, 350);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (68, '2023-05-20 21:30:00', '2023-05-20 22:00:00', 1, 465);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (69, '2023-05-21 16:30:00', '2023-05-21 17:00:00', 4, 365);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (70, '2023-05-22 23:00:00', '2023-05-22 23:30:00', 3, 195);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (71, '2023-05-23 19:00:00', '2023-05-23 19:30:00', 2, 620);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (72, '2023-05-25 00:30:00', '2023-05-25 01:00:00', 1, 760);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (73, '2023-05-25 18:00:00', '2023-05-25 18:30:00', 3, 505);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (74, '2023-05-17 00:30:00', '2023-05-17 01:00:00', 4, 80);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (75, '2023-05-18 03:30:00', '2023-05-18 04:00:00', 3, 205);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (76, '2023-05-19 06:00:00', '2023-05-19 06:30:00', 2, 520);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (77, '2023-05-19 23:30:00', '2023-05-20 00:00:00', 1, 340);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (78, '2023-05-21 04:00:00', '2023-05-21 04:30:00', 2, 430);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (79, '2023-05-21 22:00:00', '2023-05-21 22:30:00', 3, 330);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (80, '2023-05-23 06:00:00', '2023-05-23 06:30:00', 4, 150);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (81, '2023-05-24 01:00:00', '2023-05-24 01:30:00', 1, 570);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (82, '2023-05-25 07:00:00', '2023-05-25 07:30:00', 2, 710);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (83, '2023-05-26 00:00:00', '2023-05-26 00:30:00', 3, 460);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (84, '2023-05-17 01:30:00', '2023-05-17 02:00:00', 1, 75);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (85, '2023-05-18 04:30:00', '2023-05-18 05:00:00', 2, 200);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (86, '2023-05-19 07:00:00', '2023-05-19 07:30:00', 3, 510);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (87, '2023-05-20 00:30:00', '2023-05-20 01:00:00', 4, 335);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (88, '2023-05-21 05:00:00', '2023-05-21 05:30:00', 1, 425);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (89, '2023-05-21 23:00:00', '2023-05-21 23:30:00', 2, 325);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (90, '2023-05-23 07:00:00', '2023-05-23 07:30:00', 3, 140);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (91, '2023-05-24 02:00:00', '2023-05-24 02:30:00', 4, 560);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (92, '2023-05-25 08:00:00', '2023-05-25 08:30:00', 1, 700);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (93, '2023-05-26 01:00:00', '2023-05-26 01:30:00', 2, 450);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (94, '2023-05-17 02:30:00', '2023-05-17 03:00:00', 4, 70);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (95, '2023-05-18 05:30:00', '2023-05-18 06:00:00', 3, 195);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (96, '2023-05-19 08:00:00', '2023-05-19 08:30:00', 2, 500);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (97, '2023-05-20 01:30:00', '2023-05-20 02:00:00', 1, 330);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (98, '2023-05-21 06:00:00', '2023-05-21 06:30:00', 2, 420);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (94, '2023-05-22 00:00:00', '2023-05-22 00:30:00', 3, 320);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (91, '2023-05-23 08:00:00', '2023-05-23 08:30:00', 4, 130);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (77, '2023-05-24 03:00:00', '2023-05-24 03:30:00', 1, 550);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (68, '2023-05-25 09:00:00', '2023-05-25 09:30:00', 2, 690);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (54, '2023-05-26 02:00:00', '2023-05-26 02:30:00', 3, 440);

INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (99, '2023-05-22 15:30:00', '2023-05-22 18:00:00', 4, 200);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (100, '2023-05-23 11:00:00', '2023-05-23 14:00:00', 3, 600);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (99, '2023-05-24 16:00:00', '2023-05-24 19:00:00', 1, 750);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (100, '2023-05-25 10:30:00', '2023-05-25 13:30:00', 2, 500);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (101, '2023-05-17 04:00:00', '2023-05-17 06:00:00', 1, 120);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (101, '2023-05-18 08:00:00', '2023-05-18 10:00:00', 2, 310);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (102, '2023-05-19 10:00:00', '2023-05-19 12:00:00', 4, 480);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (102, '2023-05-20 02:00:00', '2023-05-20 04:00:00', 4, 250);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (101, '2023-05-21 08:00:00', '2023-05-21 10:00:00', 1, 390);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (102, '2023-05-22 02:00:00', '2023-05-22 04:00:00', 2, 295);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (103, '2023-05-23 10:00:00', '2023-05-23 12:00:00', 3, 520);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (104, '2023-05-24 04:00:00', '2023-05-24 06:00:00', 4, 530);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (103, '2023-05-25 10:00:00', '2023-05-25 12:00:00', 1, 680);
INSERT INTO Program_table (Episode_ID, Start_Time, End_Time, Channel_ID, Views_Count) VALUES (104, '2023-05-26 04:00:00', '2023-05-26 06:00:00', 2, 430);