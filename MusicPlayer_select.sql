-- SELECT Запросы
-- TASK 2

-- 1.Название и продолжительность самого длительного трека
SELECT track_name, track_duration FROM tracks
ORDER BY track_duration DESC
LIMIT 1;

-- 2.Название треков, продолжительность которых не менее 3,5 минут
SELECT track_name, track_duration FROM tracks
WHERE track_duration >= 210;

-- 3.Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT playlist_name, playlist_year FROM playlist
WHERE playlist_year BETWEEN 2018 AND 2020;

-- 4.Исполнители, чьё имя состоит из одного слова
SELECT artist_name FROM artists
WHERE artist_name NOT LIKE '%% %%';


-- REWORK
-- 5.Название треков, которые содержат слово «мой» или «my»
-- Version_1
SELECT track_name FROM tracks
WHERE track_name ILIKE 'My %%'
OR track_name ILIKE '%% My'
OR track_name ILIKE '%% My %%'
OR track_name ILIKE 'My';

-- Version_2
SELECT track_name FROM tracks
WHERE string_to_array(lower(track_name),' ')&& ARRAY['my','мой'];

-- Version_3
SELECT track_name FROM tracks
WHERE track_name ~* '\m(my|мой)\M';

-- TASK 3
-- 1.Количество исполнителей в каждом жанре
SELECT genre_name, count(artist_id) FROM music_genre
JOIN artist_genre ON music_genre.id = artist_genre.genre_id
GROUP BY genre_name;


-- REWORK
-- 2.Количество треков, вошедших в альбомы 2019–2020 годов
SELECT count(track_name) FROM album
JOIN tracks ON album.id = tracks.album_id
WHERE album_year BETWEEN 2019 AND 2020;


-- 3.Средняя продолжительность треков по каждому альбому
SELECT album_name, avg(track_duration) FROM album
JOIN tracks ON album.id = tracks.album_id
GROUP BY album_name;


-- REWORK
-- 4.Все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT artist_name FROM artists
WHERE artist_name NOT IN (
	SELECT artists.artist_name FROM artists
	JOIN artist_album ON artists.id = artist_album.artist_id
	JOIN album ON artist_album.album_id = album.id
	WHERE album_year = 2020
);


-- REWORK
-- 5.Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT DISTINCT playlist_name FROM playlist
JOIN tracks_playlist ON playlist.id = tracks_playlist.playlist_id
JOIN tracks ON tracks_playlist.tracks_id = tracks.id
JOIN album ON tracks.album_id = album.id
JOIN artist_album ON album.id = artist_album.album_id
JOIN artists ON artist_album.artist_id = artists.id
WHERE artists.artist_name LIKE 'M83';