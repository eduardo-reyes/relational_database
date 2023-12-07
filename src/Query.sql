-- CONSULTAS --

/*
Descripción: Regresa el nombre, RFC y el 10% del salario de las veterinarias mujeres
             que atienden a animales de más de 50 kilos o que sean hervíboros
             ordenadas por el bono de menor a mayor
Fecha: 01-12-2023
Versión: 1.0
Lógica: Toma la tabla Veterinario y filtra los resultados donde el género sea
        femenino y el IDPersona esté en una subconsulta que filtra los resultados
        de las tablas Atender y Animal donde el peso sea mayor a 50 o la
        alimentación sea hervíboro.
*/
SELECT Nombre, RFC, Salario*0.10 AS Bono
FROM Veterinario 
WHERE Genero = 'F' AND 
IDPersona IN (SELECT IDPersona FROM Atender WHERE IDAnimal IN (SELECT IDAnimal FROM Animal WHERE Peso > 50.0 OR Alimentacion ='herbivoro') )
ORDER BY Bono ASC;


/*
Descripción: Regresa el nombre, refrigeración y cantidad de medicinas que necesitan
refrigeración y que se distribuyan en bioma Desierto
Fecha: 01-12-2023
Versión: 1.0
Lógica: Toma la tabla Medicina y filtra los resultados donde la refrigeración sea
        verdadero y el IDInsumo esté en una subconsulta que regresa las medicinas
        de la tabla DistribuirMedicina que se distribuyen en el bioma 1.
*/
SELECT Nombre, Cantidad, Refrigeracion
FROM Medicina
WHERE Refrigeracion='true' AND 
IDInsumo IN (SELECT IDInsumo FROM DistribuirMedicina WHERE IDBioma=1)
ORDER BY Nombre DESC ;


/*
Descripción: Regresa el nombre y año de inicio de contrato de los proveedores
             con inicio de contrato < 2005 que den alimentos a Biomas con más
             de 10 animales
Fecha: 01-12-2023
Versión: 1.0
Lógica: Toma la tabla Proveedor y filtra los resultados donde el año de inicio
        de contrato sea menor que 2005 y el IDPersona esté en una subconsulta
        que agrupa los animales por bioma y filtra los grupos donde haya al
        menos 10 animales.
*/
SELECT Nombre, EXTRACT('year' FROM InicioContrato) AS AñodeInicioContrato
FROM Proveedor 
WHERE EXTRACT('year' FROM InicioContrato) < 2005  AND IDPersona IN 
(SELECT IDPersona FROM ProveerAlimento WHERE IDInsumo IN 
(SELECT IDInsumo FROM Alimento WHERE IDInsumo IN 
(SELECT IDInsumo FROM DistribuirAlimento WHERE IDBioma IN 
(SELECT IDBioma FROM Animal GROUP BY IDBioma HAVING COUNT (*) >=10))))


/*
Descripción: Regresa toda la información de los cuidadores que cuiden a solo
             1 animal hervíboro o a un solo animal omnívoro
Fecha: 01-12-2023
Versión: 1.0
Lógica: Toma la tabla Cuidador y filtra los resultados donde el IDPersona esté
        en una subconsulta que agrupa los animales por alimentación y filtra
        los grupos donde haya exactamente 1 animal y Alimentación sea hervíboro
        u omnívoro.
*/
 SELECT *
 FROM Cuidador 
 WHERE IDPersona IN 
 (SELECT IDPersona FROM Animal WHERE Alimentacion = 'herbivoro' GROUP BY IDAnimal HAVING COUNT (*) = 1) 
  OR IDPersona IN  (SELECT IDPersona FROM Animal WHERE Alimentacion = 'omnívoro' GROUP BY IDAnimal HAVING COUNT (*) = 1)
 
 
 /*
Descripción: Regresa el número de jaula e IMC de los animales que pasen el
            IMC 3.0.
Fecha: 01-12-2023
Versión: 1.0
Lógica: Combina las tablas Animal y Jaula y filtra los resultados donde la 
        división del peso entre la altura al cuadrado esté entre 3.0 y 30.0.
        Después regresa el número de jaula y el resultado de la división.
*/

 SELECT NumJaula, Peso / (Altura * Altura) AS IMC
 FROM Animal NATURAL JOIN Jaula 
 WHERE Peso / (Altura * Altura) BETWEEN 3.0 AND 30.0


/*
Descripción: Regresa toda la información de los veterinarios que atiendan a un solo
             animal carnívoro
Fecha: 01-12-2023
Versión: 1.0
Lógica: Toma la tabla Veterinario y filtra los resultados donde el IDPersona esté
        en una subconsulta que agrupa los animales por alimentación y filtra
        los grupos donde haya exactamente 1 animal y Alimentación sea carnívoro.
*/
 SELECT * 
 FROM Veterinario 
 WHERE IDPersona IN 
 (SELECT IDPersona FROM Atender WHERE IDAnimal IN 
 (SELECT IDAnimal FROM Animal WHERE Alimentacion = 'carnivoro' GROUP BY IDAnimal HAVING COUNT (*) = 1)) 
 

 -- Fecha de Nacimiento, Edad, Ticket y Servicio del ticket de los clientes que hayan recibido un ticket de servicio de Comida
 -- de los Biomas Franja y Aviario 
/*
Descripción: Regresa la fecha de nacimiento, edad, número de ticket y tipo de servicio
             de los clientes que hayan recibido un ticket de servicio de comida
             de los biomas Franja y Aviario
Fecha: 01-12-2023
Versión: 1.0
Lógica: Combina las tablas Cliente, Ticket y Servicio, filtra los resultados
        donde el tipo de servicio sea comida y el IDBioma sea 3 o 6. Después
        regresa la fecha de nacimiento, edad, número de ticket y tipo de
        servicio.
*/
SELECT Nacimiento,AGE(Nacimiento) AS Edad, NumTicket, Tipo
FROM Cliente NATURAL JOIN Ticket NATURAL JOIN Servicio
WHERE Tipo = 'Comida' AND IDBioma IN (3,6)


/*
Descripción: Regresa el nombre de los clientes que tienen tickets donde el promedio
             del costo total de los tickets esté entre 10 y 100, y muestra
             ese costo total promedio
Fecha: 01-12-2023
Versión: 1.0
Lógica: Combina las tablas Ticket y Cliente, agrupa los resultados por nombre del
        cliente y regresa el nombre y el promedio del costo total de los tickets.
        Después filtra los resultados donde el promedio del costo total del costo
        esté entre 10 y 100.
*/
SELECT Nombre,to_char(avg(CostoTotal),'LFM999,999,999.00') CostoTotalPromedio
FROM Ticket NATURAL JOIN Cliente
GROUP BY Nombre
HAVING AVG(CostoTotal) BETWEEN 10 AND 100;


/*
Descripción: Regresa el nombre de los veterinarios que trabajen en un solo bioma
Fecha: 01-12-2023
Versión: 1.0
Lógica: Toma la tabla Veterinario y filtra los resultados donde el IDPersona esté
        en una subconsulta que agrupa los veterinarios por bioma y filtra los
        grupos donde haya exactamente 1 veterinario.
*/
 SELECT Nombre
 FROM Veterinario
 WHERE IDPersona IN
 (SELECT IDPersona FROM Trabajar WHERE IDBioma IN
 (SELECT IDBioma GROUP BY IDPersona HAVING COUNT (*) = 1))


/*
Descripción: Regresa los proveedores que suministran alimentos de tipo
             Carne que caducan en noviembre o diciembre de 2023
Fecha: 01-12-2023
Versión: 1.0
Lógica: Combina las tablas Proveedor, ProveerAlimento y Alimento, filtra
        los resultados donde el tipo de alimento sea Carne
        y la fecha de caducidad esté en el rango especificado y regresa
        los datos de los proveedores que cumplen con la condición
*/
SELECT Proveedor.IDPersona,
Proveedor.Nombre,
Proveedor.ApellidoPaterno,
Proveedor.ApellidoMaterno
FROM Proveedor NATURAL JOIN ProveerAlimento
JOIN Alimento ON ProveerAlimento.IDInsumo = Alimento.IDInsumo
WHERE Alimento.Tipo = 'Carne' AND Alimento.Caducidad BETWEEN '2023-11-01' AND '2023-12-31';


/*
Descripción: Regresa los cuidadores que están a cargo de un animal que
             fue atendido por problemas respiratorios
Fecha: 01-12-2023
Versión: 1.0
Lógica: Combina las tablas Animal y atender, filtra los resultados donde
        la indicación médica sea problemas respiratorios y regresa los
        datos de los proveedores que cumplen con la condición
*/
SELECT Cuidador.IDPersona,
    Cuidador.Nombre,
    Cuidador.ApellidoPaterno,
    Cuidador.ApellidoMaterno
FROM Cuidador 
    JOIN Animal ON Cuidador.IDPersona = Animal.IDPersona
    JOIN Atender ON Animal.IDAnimal = Atender.IDAnimal
WHERE Atender.IndicacionMedica = 'Problemas respiratorios';


/*
Descripción: Regresa los animales que no han sido atendidos por veterinarios
             que fueron contratados después de 2003
Fecha: 01-12-2023
Versión: 1.0
Lógica: En una subconsulta combina las tablas Atender y Veterinario y filtra
        los resultados donde la fecha de inicio de contrato
        sea posterior a 2003. En la consulta principal toma la tabla Animal,
        filtra los resultados donde el IDAnimal no esté en la subconsulta y
        regresa los datos de los animales que cumplen con la condición.
*/
SELECT IDAnimal, Nombre
FROM Animal
WHERE IDAnimal NOT IN 
    (SELECT IDAnimal
    FROM Atender NATURAL JOIN Veterinario
    WHERE InicioContrato > '2003-01-01');


/*
Descripción: Regresa los servicios que más ingresos generaron por mes
Fecha: 01-12-2023
Versión: 1.0
Lógica: En una subconsulta se agrupan los datos de la tabla Ticket por año,
        mes y servicio y se obtienen los ingresos de cada grupo sumando el
        costo de los tickets. En la consulta principal se toman los datos
        de la subconsulta y filtra los resultados donde los ingresos sean
        iguales a los ingresos máximos de cada mes. Finalmente se regresa
        el año, mes, servicio e ingresos de los resultados que pasaron el
        filtro.
*/
SELECT
    anio, mes, servicio, ingresos
FROM 
    (SELECT
        EXTRACT(YEAR from Fecha) AS anio,
        EXTRACT(MONTH from Fecha) AS mes,
        Tipo AS servicio,
        SUM(CostoTotal) AS ingresos
    FROM Ticket
    GROUP BY anio, mes, Tipo
    ORDER BY anio, mes ASC) AS ingresos_por_servicio
WHERE ingresos IN 
    (SELECT MAX(ingresos) FROM 
        (SELECT
            EXTRACT(YEAR from Fecha) AS anio,
            EXTRACT(MONTH from Fecha) AS mes,
            Tipo AS servicio,
            SUM(CostoTotal) AS ingresos
            FROM Ticket
            GROUP BY anio, mes, Tipo
            ORDER BY anio, mes ASC) AS ingresos_por_servicio
        GROUP BY anio, mes);


/*
Descripción: Regresa los animales carnívoros que están en biomas
             donde no se distribuye ternera
Fecha: 01-12-2023
Versión: 1.0
Lógica: Toma la tabla Animal y filtra los resultados donde la alimentación
        sea carnívoro. En una subconsulta combina las tablas Animal y
        DistribuirAlimento y filtra los resultados donde el alimento
        sea ternera. Después toma los resultados de la primera consulta
        y le quita los resultados de la segunda.
*/
SELECT Animal.IDAnimal,
    Animal.Nombre
FROM Animal
WHERE Animal.Alimentacion = 'carnivoro'
EXCEPT
SELECT Animal.IDAnimal,
    Animal.Nombre
FROM Animal NATURAL JOIN DistribuirAlimento
JOIN Alimento ON DistribuirAlimento.IDInsumo = Alimento.IDInsumo
WHERE Alimento.Nombre = 'ternera';


/*
Descripción: Regresa los clientes que fueron notificados para ir a un taller
             al que no asistieron
Fecha: 01-12-2023
Versión: 1.0
Lógica: Combina las tablas Cliente, Notificar y Evento, filtra los resultados
        donde el tipo de evento sea taller y el IDPersona no esté en una
        subconsulta que combina las tablas Evento y Asistir y filtra los
        resultados donde el IDEvento de la consulta principal sea igual al
        IDEvento de la subconsulta.
*/
SELECT IDPersona, Nombre, ApellidoPaterno, ApellidoMaterno
FROM Cliente NATURAL JOIN Notificar NATURAL JOIN Evento
WHERE Tipo = 'Taller' AND IDPersona NOT IN
    (SELECT IDPersona
    FROM Evento NATURAL JOIN Asistir
    WHERE Notificar.IDEvento = Evento.IDEvento);


/*
Descripción: Regresa los veterinarios que sólo han atendido animales de más
             de 3 metros de altura
Fecha: 01-12-2023
Versión: 1.0
Lógica: Combina las tablas Veterinario, Atender y Animal, filtra los resultados
        donde la altura del animal sea mayor a 3 metros. En una subconsulta
        combina las mismas tablas y filtra los resultados donde la altura
        del animal sea menor o igual a 3 metros. Finalmente toma los resultados
        de la primera consulta y le quita los resultados de la segunda.
*/
SELECT Veterinario.IDPersona,
    Veterinario.Nombre,
    Veterinario.ApellidoPaterno,
    Veterinario.ApellidoMaterno
FROM Veterinario NATURAL JOIN Atender
JOIN Animal ON Atender.IDAnimal = Animal.IDAnimal
WHERE Animal.Altura > 3
EXCEPT
SELECT Veterinario.IDPersona,
    Veterinario.Nombre,
    Veterinario.ApellidoPaterno,
    Veterinario.ApellidoMaterno
FROM Veterinario NATURAL JOIN Atender
JOIN Animal ON Atender.IDAnimal = Animal.IDAnimal
WHERE Animal.Altura <= 3;


/*
Descripción: Regresa todos los trabajadores con un contrato de más de 20 años
Fecha: 01-12-2023
Versión: 1.0
Lógica: Se hacen 3 subconsultas, una por cada tipo de trabajador, donde se
        seleccionan los datos de cada uno. Luego se unen los 3 resultados
        y se filtran los resultados donde la diferencia entre la fecha de
        fin de contrato y la fecha de inicio de contrato sea mayor a 20 años.
*/
SELECT IDPersona, Nombre, ApellidoPaterno, ApellidoMaterno, InicioContrato, FinContrato
FROM 
((SELECT IDPersona, Nombre, ApellidoPaterno, ApellidoMaterno, InicioContrato, FinContrato
FROM Cuidador)
UNION
(SELECT IDPersona, Nombre, ApellidoPaterno, ApellidoMaterno, InicioContrato, FinContrato
FROM Veterinario)
UNION
(SELECT IDPersona, Nombre, ApellidoPaterno, ApellidoMaterno, InicioContrato, FinContrato
FROM Proveedor)) AS Trabajadores
WHERE FinContrato - InicioContrato > 365 * 20;