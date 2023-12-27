-- Leer datos de una tabla
-- SELECT campo1, campo2, campo3, .... FROM tabla

SELECT email FROM users;

-- Seleccionamos todos los datos
SELECT * FROM users;

-- Insertar datos en una tabla
-- INSERT INTO tabla(campo1, campo2, campo3, .....) VALUES(valor1, valor2, valor3, ....)
-- Nota: Los valores se insertan en el mismo orden que en la definicion de la tabla

-- INSERT INTO tabla VALUES (valor1, valor2, .....)
-- Nota: Los valores se insertan en el mismo orden que la definicón de la tabla

INSERT INTO users VALUES (1000, 'bedu', 'beto@bedu.org', '123123', '555555555', NULL);
INSERT INTO users VALUES (1001, 'Homero', 'homero_morones@bedu.org', '123123', '6666666666', NULL);
--INSERT INTO users VALUES (username, email, password, id, telephone) VALUES ('Luis', 'luiscastanion@ejemplo.mx', '123123', 1002, '2222222222');
-- BULK INSERT
INSERT INTO songs VALUES
  (789089,'MOJABI GHOST',3,'POP',2023),
  (18335, 'Shooting Star', 5, 'J-Pop', 2002),
  (48,'Black ice',250,'rock',1900),
  (1212,'Fiesta Pagana', 120, 'Folk-Metal',1999),
  (1, 'Perfecta', 3, 'Pop', 2010),
  (NULL, 'pegasus fantasy', '400', 'j-rock', 1985),
  (112,'master fo puppets',8,'metal',1996),
  (28, 'Somewhere only we know', 180, 'alternative', 2004),
  (3452786, 'comfortably numb', 300,'rock', 1979);

SELECT * FROM songs;

-- Eliminar todos los datos
-- DELETE FROM tabla;
DELETE FROM songs;

-- Actualizar todos los registros (cuidado)
-- UPDATE tabla SET campo = valor, campo2 = valor2;

-- Para actualizar una cantidad de registros en particular
-- UPDATE tabla SET campo = valor WHERE condicion
UPDATE songs SET title = 'Pegasus Fantasy' WHERE id = 789090;

-- Para borrar un elemento de la tabla songs se usa el id
DELETE FROM songs WHERE id = 12

-- Obtener todas las canciones cuya duracion es entre 3 a 5 min
SELECT * FROM songs WHERE length BETWEEN 180 AND 300;
SELECT * FROM songs WHERE length >= 180 AND length <= 300;

-- Los operadores logicos de SQL: AND, OR, NOT

-- Ordenamiento
-- SELECT ... ORDER BY campo
SELECT * FROM songs ORDER BY title;