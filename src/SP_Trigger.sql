-- PROCEDIMIENTOS ALMACENADOS --


/*
Nombre de la función: lista_evento_func
Descripción: Muestra la lista de asistentes de un evento.
Fecha: 01-12-2023
Versión: 1
Propósito: Saber que clientes asistieron a un evento.
Lógica: Consulta al JOIN de las tablas Cliente y Asistir
con el ID del evento.
Input: @id: Entero que es el identificador del evento.
Output: Tabla con los datos de los asistentes a un evento.
*/
CREATE OR REPLACE FUNCTION lista_evento_func(id INT)
RETURNS TABLE (IDEvento INT, Nombre VARCHAR(50), ApellidoPaterno VARCHAR(50), ApellidoMaterno VARCHAR(50)) 
AS
$$
SELECT IDEvento, Nombre, ApellidoPaterno, ApellidoMaterno
FROM Cliente NATURAL JOIN Asistir
WHERE IDEvento = id;
$$ 
LANGUAGE sql;


/*
Nombre del procedimiento almacenado: lista_evento
Descripción: Muestra la lista de asistentes de un evento.
Fecha: 01-12-2023
Versión: 1
Propósito: Saber que clientes asistieron a un evento.
Lógica: Uso de cursor explícito para mostrar en salida
el resultado de una consulta.
Input: @id: Entero que es el identificador del evento.
Output: Notificación en output con un texto que muestre
la lista de asistentes.
*/
CREATE OR REPLACE PROCEDURE lista_evento(id IN INT) AS
$$
DECLARE
    fila record;
    cur_clientes CURSOR FOR SELECT * FROM Cliente NATURAL JOIN Asistir WHERE IDEvento = id;
    i INT := 1;
BEGIN
	OPEN cur_clientes;
	FETCH cur_clientes INTO fila;
	WHILE(found) LOOP
		raise notice 'Mostrando fila %: Nombre: % | Apellido Paterno: % | Apellido Materno: %', i, 
		fila.Nombre,fila.ApellidoPaterno,fila.ApellidoMaterno;
		FETCH cur_clientes INTO fila;
		i := i + 1;
	END LOOP;
END;
$$
LANGUAGE plpgsql;

/*
Nombre del procedimiento almacenado: agregaCliente
Descripción: Permite agregar un cliente a la tabla Cliente.
Fecha: 01-12-2023
Versión: 1
Propósito: Registrar un cliente.
Lógica: Verifica que los datos ingresados cumplan con el
dominio de las columnas e inserta la tupla.
Input: 
- @idpersona: Identificador de la persona como entero.
- @nombre: Nombre del cliente (cadena de tamaño máximo de 50).
- @apellidopaterno: Apellido paterno del cliente (cadena de tamaño máximo de 50).
- @apellidomaterno: Apellido materno del cliente (cadena de tamaño máximo de 50).
- @genero: Género M o F del cliente (carácter de longitud 1).
- @nacimiento: Fecha de nacimiento del cliente
Output: Tabla modificado con los nuevos datos.
*/
CREATE OR REPLACE PROCEDURE agregaCliente(idpersona IN INT, nombre IN VARCHAR(50), apellidopaterno IN VARCHAR(50), apellidomaterno IN VARCHAR(50), genero CHAR(1), nacimiento IN DATE)
AS $$
BEGIN
	IF idpersona <= 0 THEN
		RAISE EXCEPTION 'El identificador no es válido';
	END IF;

	BEGIN
		idpersona := idpersona::INTEGER;
		EXCEPTION
		WHEN OTHERS THEN
		RAISE EXCEPTION 'La edad debe ser un número entero.';
	END;
	
	IF nombre ~ '[0-9]' or apellidopaterno ~ '[0-9]' or apellidomaterno ~ '[0-9]' THEN
		RAISE EXCEPTION 'Los nombres y apellidos no pueden contener números';
	END IF;
	
	IF genero NOT IN ('F', 'M') THEN 
		RAISE EXCEPTION 'El género sólo puede ser F o M';
	END IF;
	
	INSERT INTO cliente(idpersona, nombre, apellidopaterno, apellidomaterno, genero, nacimiento) VALUES (idpersona, nombre, apellidopaterno, apellidomaterno, genero, nacimiento);
  END;
  $$
  LANGUAGE plpgsql;
 

/*
Nombre del procedimiento almacenado: eliminaProveedor
Descripción: Elimina un proveedor usando su identificador.
Fecha: 01-12-2023
Versión: 1
Propósito: Borrar la información almacenada en la BD de un proveedor.
Lógica: Verifica que el identificador sea válido y elimina
al proveedor con esa llave de la tabla Proveedor.
Input: @idproveedor: Identificador único del proveedor (entero).
Output: Base de datos modificada sin el proveedor especificado.
*/
 CREATE OR REPLACE PROCEDURE eliminaProveedor(idproveedor IN INT)
 AS $$
 BEGIN 
	IF idproveedor <= 0 THEN
	RAISE EXCEPTION 'El identificador no es válido';
	END IF;

	DELETE FROM proveedor WHERE idpersona = idproveedor; 	
END;
$$
LANGUAGE plpgsql;


/*
Nombre del procedimiento almacenado: descuento_ticket
Descripción: Calcula el precio total en un ticket al que
ya s ele aplicó un descuento.
Fecha: 01-12-2023
Versión: 1
Propósito: Obtener la ganacia final del pago de un ticket.
Lógica: Se hace una consulta del precio original de un
ticket y del descuento aplicable. Se realiza el descuento
y se muestra el precio final. También se altera la tabla
Ticket para que contenga ese costo.
Input: @t: Número del ticket (entero).
Output: Total pagado por un cliente para un ticket.
*/
CREATE OR REPLACE PROCEDURE descuento_ticket(t IN INT)
AS 
$$
DECLARE
	a FLOAT8;
	b FLOAT8;
	c FLOAT8;
BEGIN
	SET client_min_messages = 'notice';
	a := (SELECT CostoTotal FROM Ticket WHERE NumTicket = t);
	b := (SELECT Descuento FROM Ticket WHERE NumTicket = t);
	c := a*((100-b)/100);
	RAISE NOTICE 'Precio final del ticket con descuento: %', c;
	ALTER TABLE Ticket ADD column IF NOT EXISTS CostoUnitario INTEGER;
	UPDATE Ticket SET CostoUnitario = c WHERE NumTicket = t;
END;
$$
LANGUAGE plpgsql;


-- DISPARADORES --


/*
Nombre del disparador: cuenta_asistentes
Descripción: Se encarga de contar a las personas que asisten a un evento, 
y agregarlo como atributo en evento. Cada vez que se inserte, 
se debera actualizar el campo.
Fecha: 01-12-2023
Versión: 1
Propósito: Llevar un registro de la asistencia a los eventos.
Lógica: Consulta con la función de agregación "count" sobre la tabla Asistir
en donde corresponda al evento. Posterior actualización de la asistencia en
la tabla Evento.
Dependencias: contar_asistencia()
*/
CREATE OR REPLACE FUNCTION contar_asistencia() RETURNS TRIGGER
AS 
$$
DECLARE
	a INT;
BEGIN
	ALTER TABLE Evento ADD column IF NOT EXISTS Asistencia INTEGER;
	a:= (SELECT count(*) FROM Asistir WHERE IDEvento = NEW.IDEvento);
	UPDATE Evento SET Asistencia = a WHERE IDEvento = NEW.IDEvento;
return null;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cuenta_asistentes
AFTER INSERT
ON Asistir
FOR EACH ROW
EXECUTE PROCEDURE contar_asistencia();


/*
Nombre del disparador: cuenta_jaulas
Descripción: Cuenta el número de jaulas en un bioma.
Fecha: 01-12-2023
Versión: 1
Propósito: Llevar la cuenta de las jaulas por bioma.
Lógica: Se agrega la columna con el número de jaulas
en Bioma. Para cualquier operación, se hace una consulta
para contar las ocurrencias del bioma en la tabla Jaula.
Se actualiza la tabla Bioma con el número obtenido. 
Dependencias: contar_jaulas()
*/
CREATE OR REPLACE FUNCTION contar_jaulas() RETURNS TRIGGER
AS 
$$
DECLARE
	a INT;
BEGIN
	IF(TG_OP = 'INSERT' or TG_OP = 'UPDATE') THEN
		ALTER TABLE Bioma ADD column IF NOT EXISTS NumJaula INTEGER;
		a := (SELECT count(*) FROM Jaula WHERE IDBioma = NEW.IDBioma);
		UPDATE Bioma SET NumJaula = a WHERE IDBioma = NEW.IDBioma;
	END IF;
	IF(TG_OP = 'DELETE') THEN
		ALTER TABLE Bioma ADD column IF NOT EXISTS NumJaula INTEGER;
		a := (SELECT count(*) FROM Jaula WHERE IDBioma = OLD.IDBioma);
		UPDATE Bioma SET NumJaula = a WHERE IDBioma = OLD.IDBioma;
	END IF;
return null;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cuenta_jaulas
AFTER INSERT OR UPDATE OR DELETE
ON Jaula
FOR EACH ROW
EXECUTE PROCEDURE contar_jaulas();


/*
Nombre del disparador: cuenta_cuidadores
Descripción: Cuenta el número de cuidadores en un bioma.
Fecha: 01-12-2023
Versión: 1
Propósito: Llevar la cuenta de los cuidadores por bioma.
Lógica: Se agrega la columna con el número de cuidadores
en Bioma. Para cualquier operación, se hace una consulta
para contar las ocurrencias del bioma en la tabla Cuidador.
Se actualiza la tabla Bioma con el número obtenido. 
Dependencias: contar_cuidadores()
*/
CREATE OR REPLACE FUNCTION contar_cuidadores() RETURNS TRIGGER
AS 
$$
DECLARE
	b INT;
BEGIN
	IF(TG_OP = 'INSERT' or TG_OP = 'UPDATE') THEN
		ALTER TABLE Bioma ADD column IF NOT EXISTS NumCuidador INTEGER;
		b := (SELECT count(*) FROM Cuidador WHERE IDBioma = NEW.IDBioma);
		UPDATE Bioma SET NumCuidador = b WHERE IDBioma = NEW.IDBioma;
	END IF;
	IF(TG_OP = 'DELETE') THEN
		ALTER TABLE Bioma ADD column IF NOT EXISTS NumJaula INTEGER;
		b := (SELECT count(*) FROM Cuidador WHERE IDBioma = OLD.IDBioma);
		UPDATE Bioma SET NumCuidador = b WHERE IDBioma = OLD.IDBioma;
	END IF;
return null;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cuenta_cuidadores
AFTER INSERT OR UPDATE OR DELETE
ON Cuidador
FOR EACH ROW
EXECUTE PROCEDURE contar_cuidadores();


/*
Nombre del disparador: cuenta_veterinarios
Descripción: Cuenta el número de veterinarios en un bioma.
Fecha: 01-12-2023
Versión: 1
Propósito: Llevar la cuenta de los veterinarios por bioma.
Lógica: Se agrega la columna con el número de veterinarios
en Bioma. Para cualquier operación, se hace una consulta
para contar las ocurrencias del bioma en la tabla Veterinario.
Se actualiza la tabla Bioma con el número obtenido. 
Dependencias: contar_veterinarios()
*/
CREATE OR REPLACE FUNCTION contar_veterinarios() RETURNS TRIGGER
AS 
$$
DECLARE
	c INT;
BEGIN
	IF(TG_OP = 'INSERT' or TG_OP = 'UPDATE') THEN
		ALTER TABLE Bioma ADD column IF NOT EXISTS NumVeterinario INTEGER;
		c := (SELECT count(*) FROM Trabajar WHERE IDBioma = NEW.IDBioma);
		UPDATE Bioma SET NumVeterinario = c WHERE IDBioma = NEW.IDBioma;
	END IF;
	IF(TG_OP = 'DELETE') THEN
		ALTER TABLE Bioma ADD column IF NOT EXISTS NumJaula INTEGER;
		c := (SELECT count(*) FROM Trabajar WHERE IDBioma = OLD.IDBioma);
		UPDATE Bioma SET NumVeterinario = c WHERE IDBioma = OLD.IDBioma;
	END IF;
return null;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cuenta_veterinarios
AFTER INSERT OR UPDATE OR DELETE
ON Trabajar
FOR EACH ROW
EXECUTE PROCEDURE contar_veterinarios();


/*
Nombre del disparador: cuenta_animales
Descripción: Cuenta el número de animales en un bioma.
Fecha: 01-12-2023
Versión: 1
Propósito: Llevar la cuenta de los animales por bioma.
Lógica: Se agrega la columna con el número de animales
en Bioma. Para cualquier operación, se hace una consulta
para contar las ocurrencias del bioma en la tabla Animal.
Se actualiza la tabla Bioma con el número obtenido. 
Dependencias: contar_animales()
*/
-- Un trigger que se encargue de contar los animales para llevar
-- la cuenta en la tabla Bioma --
CREATE OR REPLACE FUNCTION contar_animales() RETURNS TRIGGER
AS 
$$
DECLARE
	d INT;
BEGIN
	IF(TG_OP = 'INSERT' or TG_OP = 'UPDATE') THEN
		ALTER TABLE Bioma ADD column IF NOT EXISTS NumAnimal INTEGER;
		d := (SELECT count(*) FROM Animal WHERE IDBioma = NEW.IDBioma);
		UPDATE Bioma SET NumAnimal = d WHERE IDBioma = NEW.IDBioma;
	END IF;
	IF(TG_OP = 'DELETE') THEN
		ALTER TABLE Bioma ADD column IF NOT EXISTS NumJaula INTEGER;
		d := (SELECT count(*) FROM Animal WHERE IDBioma = OLD.IDBioma);
		UPDATE Bioma SET NumAnimal = d WHERE IDBioma = OLD.IDBioma;
	END IF;
return null;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER cuenta_animales
AFTER INSERT OR UPDATE OR DELETE
ON Animal
FOR EACH ROW
EXECUTE PROCEDURE contar_animales();


/*
Nombre del disparador: biomas_veterinario
Descripción: Verifica que un veterinario trabaja a lo más en dos biomas.
Fecha: 01-12-2023
Versión: 1
Propósito: Un veterinario no puede trabajar en más de dos biomas.
Lógica: Se hace antes de la inserción de una tupla en Trabajar.
En la tabla Trabajar, que relaciona al Veterinario con el
Bioma, contamos cuantas veces un mismo veterinario está presente.
Si hay dos o más ocurrencias, regresamos una excepción que evite
la inserción.
Dependencias: limitar_veterinario()
*/
CREATE OR REPLACE FUNCTION limitar_veterinario() RETURNS TRIGGER
AS 
$$
DECLARE
	n INT;
BEGIN
	IF(TG_OP = 'INSERT' or TG_OP = 'UPDATE') THEN
		n := (SELECT count(IDBioma) FROM Trabajar WHERE IDPersona = NEW.IDPersona);
		IF(n >= 2) THEN
			RAISE EXCEPTION 'El veterinario ya trabaja en dos biomas';
		END IF;
	END IF;
return null;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER biomas_veterinario
BEFORE INSERT OR UPDATE
ON Trabajar
FOR EACH ROW
EXECUTE PROCEDURE limitar_veterinario();