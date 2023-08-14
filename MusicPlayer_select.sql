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

-- 5.Название треков, которые содержат слово «мой» или «my»
SELECT track_name FROM tracks
WHERE track_name LIKE '%%My%%';

-- TASK 3

-- 1.Количество исполнителей в каждом жанре
SELECT genre_name, count(artist_id) FROM music_genre
JOIN artist_genre ON music_genre.id = artist_genre.genre_id
GROUP BY genre_name;

-- 2.Количество треков, вошедших в альбомы 2019–2020 годов
SELECT album_year, count(track_name) FROM album
JOIN tracks ON album.id = tracks.album_id
WHERE album.album_year >= 2019 AND album.album_year <= 2020
GROUP BY album_year;

-- 3.Средняя продолжительность треков по каждому альбому
SELECT album_name, avg(track_duration) FROM album
JOIN tracks ON album.id = tracks.album_id
GROUP BY album_name;

-- 4.Все исполнители, которые не выпустили альбомы в 2020 году
SELECT artists, album_year FROM album
JOIN artist_album ON album.id = artist_album.album_id
JOIN artists ON artist_album.artist_id = artists.id
WHERE album.album_year != 2020;

-- 5.Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT playlist_name FROM playlist
JOIN tracks_playlist ON playlist.id = tracks_playlist.playlist_id
JOIN tracks ON tracks_playlist.tracks_id = tracks.id
JOIN album ON tracks.album_id = album.id
JOIN artist_album ON album.id = artist_album.album_id
JOIN artists ON artist_album.artist_id = artists.id
WHERE artists.artist_name LIKE 'M83';
