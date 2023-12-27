/*
Usuarios
    - nombre
    - correo
    - contrasena
    - telefono
    - fecha de nacimiento

Canciones
    - titulo
    - artista
    - duracion 
    - genero
    - album
    - año

Artista
    - nombre
    - pais
    - generos
    - canciones
    - albumnes

ALBUM
    - nombre
    - año
    - artista
    - canciones
    - generos 
*/

-- Sintaxis para crear una tabla en SQL
-- CREATE TABLE nombre_de_la_tabla (
--  nombre_de_la_columna tipo RESTRICCION,
--  otra_columna tipo RESTRICCION,
-- )

-- Tipos de datos:
-- TEXT es una cadena de texto sin tamaño especifico
-- VARCHAR(n) es una cadena de texto de tamaño a lo màs n
-- DATE es unicamente la fecha
-- DATETIME es fecha con hora

-- Los campos "username", "email" y "telephone" almacenarían valores únicos
-- POR CADA REGISTRO, es decir, no habría dos usuarios con el mismo "username", etc.
-- A este tipo de atributos/columnas se les conoce como "SUPER LLAVE" :D
-- La llave primaria es aquella que el diseñador de base de datos elige.
-- Para especificar que un campo es llave primaria, se utiliza PRIMARY KEY

--Restricciones
-- Ninguna restriccion significa que el campo acepta NULL
-- UNIQUE el cual valida que un campo sea único
-- NOT NULL no permite el valor "NULL"
-- 
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username VARCHAR(30) UNIQUE NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(30) NOT NULL,
  telephone VARCHAR(12) UNIQUE NOT NULL,
  birthdate DATE
);

-- Para eliminar una tabla se utiliza la instruccion
-- DROP TABLE nombre_de_la_tabla;
DROP TABLE users;

CREATE TABLE songs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(50) NOT NULL,
  length INTEGER NOT NULL CHECK(length > 0),
  genre VARCHAR(30) NOT NULL,
  year INTEGER NOT NULL CHECK(year >= 1500)
);

CREATE TABLE artists (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(100) NOT NULL,
  country VARCHAR(5) NOT NULL
);

-- Cuando la llave primaria es de dos campos o mas
-- se utiliza PRIMARY KEY (campo1, campo2, campo3...)
CREATE TABLE songs_artists (
  id_song INTEGER, -- Es una llave foránea de la tabla "songs"
  id_artist INTEGER, -- Es una llave foránea de la tabla "artists"
  PRIMARY KEY (id_song, id_artist),
  FOREIGN KEY (id_song) REFERENCES songs(id),
  FOREIGN KEY (id_artist) REFERENCES artists(id)
);

CREATE TABLE users_songs (
  id_user INTEGER, -- Es una llave foránea de la tabla "users"
  id_song INTEGER, -- Es una llave foránea de la tabla "songs"
  PRIMARY KEY (id_user, id_song),
  FOREIGN KEY (id_user) REFERENCES users(id),
  FOREIGN KEY (id_song) REFERENCES songs(id)
);

-- Una llave foránea es una referencia de una llave primaria en otra tabla

-- Relacionar artistas con canciones

-- "Los artistas interpretan canciones"
-- "Un artista interpreta una o más canciones" (uno a muchos)
-- "Una cancion puede ser interpretada por uno o más artistas" (muchos a uno)
-- La relación "artista - cancion" es "MUCHOS A MUCHOS"

-- Tenemos que averiguar si la relación es:
-- uno a uno
-- uno a muchos/muchos a uno
-- muchas a muchas

-- "Los usuarios guardan canciones"
-- "Un usuario puede guardar una o más canciones" (uno a muchos)
-- "Una cancion puede ser guardada por uno o más usuarios" (muchos a muchos)
-- La relacion "usuario - cancion" es "MUCHOS A MUCHOS"

-- "Los albumes tienen canciones"
-- "Un album tiene muchas canciones" (una a muchos)
-- La relación "cancion - album" es "UNO A MUCHOS"

-- Cuando la relacion es MUCHOS A MUCHOS ¿se usa una tabla intermedia?