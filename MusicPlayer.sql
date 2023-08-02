CREATE TABLE IF NOT EXISTS music_genre (
	id serial PRIMARY KEY, 
	genre_name varchar(100) NOT NULL UNIQUE);

CREATE TABLE IF NOT EXISTS artists (
	id serial PRIMARY KEY, 
	artist_name varchar(100) NOT NULL UNIQUE, 
	artist_country varchar(100) UNIQUE);
	
CREATE TABLE IF NOT EXISTS artist_genre (
	genre_id integer REFERENCES music_genre(id), 
	artist_id integer REFERENCES artists(id), 
	CONSTRAINT artist_genre_pk PRIMARY KEY (genre_id, artist_id));	

CREATE TABLE IF NOT EXISTS album (
	id serial PRIMARY KEY, 
	album_name varchar(100) NOT NULL, 
	album_year integer NOT NULL);
	
CREATE TABLE IF NOT EXISTS artist_album (
	album_id integer REFERENCES album(id), 
	artist_id integer REFERENCES artists(id), 
	CONSTRAINT artist_album_pk PRIMARY KEY (artist_id, album_id));

CREATE TABLE IF NOT EXISTS tracks (
	id serial PRIMARY KEY, 
	track_name varchar(100) NOT NULL, 
	track_duration integer NOT NULL, 
	album_id integer REFERENCES album(id));

CREATE TABLE IF NOT EXISTS playlist (
	id serial PRIMARY KEY, 
	playlist_name varchar(100) NOT NULL, 
	playlist_year integer NOT NULL);

CREATE TABLE IF NOT EXISTS tracks_playlist (
	tracks_id integer REFERENCES tracks(id), 
	playlist_id integer REFERENCES playlist(id), 
	CONSTRAINT Tracks_playlist_pk PRIMARY KEY (tracks_id, playlist_id));