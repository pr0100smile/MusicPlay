-- Добавляем исполнителей
INSERT INTO artists (artist_name, artist_country) 
VALUES ('30 Seconds to Mars','America'),('Guano Apes','Germany'),
('Bring Me The Horizon','Britain'),('Wildways','Russia'),
('M83','France'),('The Weekend','Canada'),('Tiesto','Netherlands');

-- Добавляем жанры
INSERT INTO music_genre (genre_name)
VALUES ('Rock'),('Ambient'),('Pop'),('Trance');

-- Делаем связку исполнителей с жанрами
INSERT INTO artist_genre (genre_id, artist_id)
VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(3,6),(4,7);

-- Добавляем альбомы
INSERT INTO album (album_name, album_year)
VALUES ('A Beautiful Lie', 2005),('This Is War', 2009),
('Proud Like a God', 1997),('OFFLINE', 2014),
('POST HUMAN: NeX GEn', 2023),('Sempiternal', 2013),
('Day X', 2018),('Anna', 2020),
('Hurry Up, We’re Dreaming', 2011),('Fantasy', 2023),
('Starboy', 2016),('Dawn FM', 2022),
('The London sessions', 2020),('A Town Called Paradise', 2014);

-- Делаем связку исполнителей с альбомами
INSERT INTO artist_album (album_id, artist_id)
VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4),
(9,5),(10,5),(11,6),(12,6),(13,7),(14,7);

-- Добавляем треки
INSERT INTO tracks (track_name, track_duration, album_id)
VALUES ('Attack', 189, 1),('A Beautiful Lie', 245, 1),('Kings and Queens', 347, 2),('Hurricane', 372, 2),
('Open Your Eyes', 186, 3),('Rain', 274, 3),('Close to the Sun', 222, 4),('Fake', 175, 4),
('sTraNgeRs', 195, 5),('LosT', 205, 5),('Can You Feel My Heart', 228, 6),('Sleepwalking', 230, 6),
('Sky', 188, 7),('New Level', 219, 7),('Everest', 184, 8),('The Notebook', 259, 8),
('Midnight City', 243, 9),('Train to Pluton', 75, 9),('Water Deep', 191, 10),('Amnesia', 243, 10),
('True Colors', 206, 11),('Secrets', 265, 11),('Gasoline', 212, 12),('Sacrifice', 188, 12),
('Ride', 163, 13),('Lose You', 148, 13),('Red Lights', 262, 14),('Wasted', 189, 14);

-- Добавляем сборники (плейлисты)
INSERT INTO playlist (playlist_name, playlist_year)
VALUES ('30STM Hits', 2018),('Apes Hits', 2015),('BMTH Hits', 2023),
('Wildways Hits', 2020),('M83 Hits', 2023),('Weekend Hits', 2022),('Tiesto Hits', 2020);

-- Делаем связку треков со сборниками (плейлистами)
INSERT INTO tracks_playlist (tracks_id, playlist_id)
VALUES (1,1),(2,1),(3,1),(4,1),
(5,2),(6,2),(7,2),(8,2),
(9,3),(10,3),(11,3),(12,3),
(13,4),(14,4),(15,4),(16,4),
(17,5),(18,5),(19,5),(20,5),
(21,6),(22,6),(23,6),(24,6),
(25,7),(26,7),(27,7),(28,7);
