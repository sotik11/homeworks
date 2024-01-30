DROP SCHEMA IF EXISTS homework4 CASCADE;

-- create schema
CREATE SCHEMA homework4;

-- create table Movies
CREATE SEQUENCE homework4.movies_id_seq;
CREATE TABLE IF NOT EXISTS homework4.movies
(
    id         integer NOT NULL DEFAULT nextval('homework4.movies_id_seq')
    CONSTRAINT movies_pk
    PRIMARY KEY,
    title      varchar,
    director   varchar,
    year       integer,
    length_min integer
    );
ALTER SEQUENCE homework4.movies_id_seq
    OWNED BY homework4.movies.id;

-- create table Boxoffice
CREATE SEQUENCE homework4.boxoffice_id_seq;
CREATE TABLE IF NOT EXISTS homework4.boxoffice
(
    id                 integer NOT NULL DEFAULT nextval('homework4.boxoffice_id_seq')
    CONSTRAINT boxoffice_pk
    PRIMARY KEY,
    movie_id           integer
    CONSTRAINT boxoffice_movies_id_fk
    REFERENCES homework4.movies (id),
    rating             decimal,
    domestic_sale      bigint,
    international_sale bigint
    );
ALTER SEQUENCE homework4.boxoffice_id_seq
    OWNED BY homework4.boxoffice.id;

-- add values to table Movies
INSERT INTO homework4.movies (id, title, director, year, length_min)
VALUES (DEFAULT, 'The Shawshank Redemption'::varchar, 'Frank Darabont'::varchar, 1994::int, 142::int),
       (DEFAULT, 'The Godfather'::varchar, 'Francis Ford Coppola'::varchar, 1972::int, 175::int),
       (DEFAULT, 'The Dark Knight'::varchar, 'Christopher Nolan'::varchar, 2008::int, 152::int),
       (DEFAULT, 'The Godfather Part II'::varchar, 'Francis Ford Coppola'::varchar, 1974::int, 202::int),
       (DEFAULT, 'Star Wars: Episode V - The Empire Strikes Back'::varchar, 'Irvin Kershner'::varchar, 1980::int,
        124::int),
       (DEFAULT, 'Schindler''s List'::varchar, 'Steven Spielberg'::varchar, 1993::int, 195::int),
       (DEFAULT, 'The Lord of the Rings: The Return of the King'::varchar, 'Peter Jackson'::varchar, 2003::int,
        201::int),
       (DEFAULT, 'Pulp Fiction'::varchar, 'Quentin Tarantino'::varchar, 1994::int, 154::int),
       (DEFAULT, 'Avatar'::varchar, 'James Cameron'::varchar, 2009::int, 162::int),
       (DEFAULT, 'The Terminator'::varchar, 'James Cameron'::varchar, 1984::int, 107::int),
       (DEFAULT, 'Shutter Island'::varchar, 'Martin Scorsese'::varchar, 2010::int, 138::int),
       (DEFAULT, 'Avatar: The Way of Water'::varchar, 'James Cameron'::varchar, 2022::int, 192::int);

-- add values to table Boxoffice
INSERT INTO homework4.boxoffice (id, movie_id, rating, domestic_sale, international_sale)
VALUES (DEFAULT, 1::int, 9.3::decimal, 28767189::bigint, 28884716::bigint),
       (DEFAULT, 2::int, 9.2::decimal, 136381073::bigint, 250341073::bigint),
       (DEFAULT, 3::int, 9.0::decimal, 534987076::bigint, 1029266147::bigint),
       (DEFAULT, 4::int, 8.7::decimal, 47834595::bigint, 47961919::bigint),
       (DEFAULT, 5::int, 9.0::decimal, 292753960::bigint, 538375067::bigint),
       (DEFAULT, 6::int, 9.0::decimal, 96898818::bigint, 322161245::bigint),
       (DEFAULT, 7::int, 9.0::decimal, 379427292::bigint, 1156194180::bigint),
       (DEFAULT, 8::int, 8.9::decimal, 107928762::bigint, 213928762::bigint),
       (DEFAULT, 9::int, 7.9::decimal, 785221649::bigint, 2923706026::bigint),
       (DEFAULT, 10::int, 8.1::decimal, 38371200::bigint, 78371200::bigint),
       (DEFAULT, 11::int, 8.2::decimal, 128012934::bigint, 294805697::bigint),
       (DEFAULT, 12::int, 7.6::decimal, 684075767::bigint, 2320250281::bigint);
