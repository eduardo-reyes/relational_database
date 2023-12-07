DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

CREATE TABLE Proveedor (
   IDPersona INT,
   Nombre VARCHAR(50), 
   ApellidoPaterno VARCHAR(50),
   ApellidoMaterno VARCHAR(50),
   Nacimiento DATE,
   RFC VARCHAR(10),
   Genero CHAR(1),
   InicioContrato DATE,
   FinContrato DATE,
   NumInt INT,
   NumExt INT,
   Calle VARCHAR(50),
   Colonia VARCHAR(60),
   CodigoPostal INT,
   Estado VARCHAR(50),
   Costo FLOAT8,
   Producto VARCHAR(50),
   Frecuencia VARCHAR(20)
);
ALTER TABLE Proveedor ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE Proveedor ADD CONSTRAINT IDPersonaC1 UNIQUE (IDPersona);
ALTER TABLE Proveedor ADD CONSTRAINT Proveedor_pk PRIMARY KEY (IDPersona);
ALTER TABLE Proveedor ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Proveedor ADD CONSTRAINT NombreC1 CHECK(Nombre <> '');
ALTER TABLE Proveedor ADD CONSTRAINT NombreC2 CHECK(Nombre ~ '^[a-zÑñA-ZáéíóúÁÉÍÓÚüÜ ]*$');
ALTER TABLE Proveedor ALTER COLUMN ApellidoPaterno SET NOT NULL;
ALTER TABLE Proveedor ADD CONSTRAINT ApellidoPaternoC1 CHECK(ApellidoPaterno <> '');
ALTER TABLE Proveedor ADD CONSTRAINT ApellidoPaternoC2 CHECK(ApellidoPaterno ~ '^[A-ZÑña-zA-ZáéíóúÁÉÍÓÚüÜ ]*$');
ALTER TABLE Proveedor ALTER COLUMN ApellidoMaterno SET NOT NULL;
ALTER TABLE Proveedor ADD CONSTRAINT ApellidoMaternoC1 CHECK(ApellidoMaterno <> '');
ALTER TABLE Proveedor ADD CONSTRAINT ApellidoMaternoC2 CHECK(ApellidoMaterno ~ '^[a-zA-ZÑñáéíóúÁÉÍÓÚüÜ ]*$');
ALTER TABLE Proveedor ALTER COLUMN Nacimiento SET NOT NULL;
ALTER TABLE Proveedor ALTER COLUMN RFC SET NOT NULL;
ALTER TABLE Proveedor ADD CONSTRAINT RFCC1 CHECK(RFC <> '');
ALTER TABLE Proveedor ALTER COLUMN Genero SET NOT NULL;
ALTER TABLE Proveedor ADD CONSTRAINT GeneroC1 CHECK(Genero <> '');
ALTER TABLE Proveedor ADD CONSTRAINT GeneroC2 CHECK(Genero ~ '^[MF]$');
ALTER TABLE Proveedor ALTER COLUMN InicioContrato SET NOT NULL;
ALTER TABLE Proveedor ALTER COLUMN FinContrato SET NOT NULL;
ALTER TABLE Proveedor ALTER COLUMN NumInt SET NOT NULL;
ALTER TABLE Proveedor ALTER COLUMN NumExt SET NOT NULL;
ALTER TABLE Proveedor ALTER COLUMN Calle SET NOT NULL;
ALTER TABLE Proveedor ADD CONSTRAINT CalleC1 CHECK(Calle <> '');
ALTER TABLE Proveedor ADD CONSTRAINT CalleC2 CHECK(Calle ~ '[a-zÑñA-ZáéíóúÁÉÍÓÚüÜ0-9\. ]*$');
ALTER TABLE Proveedor ALTER COLUMN Colonia SET NOT NULL;
ALTER TABLE Proveedor ADD CONSTRAINT ColoniaC1 CHECK(Colonia <> '');
ALTER TABLE Proveedor ADD CONSTRAINT ColoniaC2 CHECK (Colonia ~ '[a-zÑñA-ZáéíóúÁÉÍÓÚüÜ0-9\. ]*$');
ALTER TABLE Proveedor ALTER COLUMN CodigoPostal SET NOT NULL;
ALTER TABLE Proveedor ALTER COLUMN Estado SET NOT NULL;
ALTER TABLE Proveedor ADD CONSTRAINT EstadoC1 CHECK(Estado <> '');
ALTER TABLE Proveedor ADD CONSTRAINT EstadoC2 CHECK(Estado ~ '[a-zÑñA-ZáéíóúÁÉÍÓÚüÜ0-9\. ]*$');
ALTER TABLE Proveedor ALTER COLUMN Costo SET NOT NULL;
ALTER TABLE Proveedor ALTER COLUMN Producto SET NOT NULL;
ALTER TABLE Proveedor ADD CONSTRAINT ProductoC1 CHECK(Producto <> '');
ALTER TABLE Proveedor ALTER COLUMN Frecuencia SET NOT NULL;
ALTER TABLE Proveedor ADD CONSTRAINT FrecuenciaC1 CHECK(Frecuencia <> '');

COMMENT ON TABLE Proveedor IS 'Tabla que contiene los proveedores';
COMMENT ON COLUMN Proveedor.IDPersona IS 'Identificador del proveedor';
COMMENT ON COLUMN Proveedor.Nombre IS 'Nombre del proveedor';
COMMENT ON COLUMN Proveedor.ApellidoPaterno IS 'Apellido paterno del proveedor';
COMMENT ON COLUMN Proveedor.ApellidoMaterno IS 'Apellido materno del proveedor';
COMMENT ON COLUMN Proveedor.Nacimiento IS 'Fecha de nacimiento';
COMMENT ON COLUMN Proveedor.RFC IS 'RFC del proveedor';
COMMENT ON COLUMN Proveedor.Genero IS 'Genero del proveedor';
COMMENT ON COLUMN Proveedor.InicioContrato IS 'Fecha de inicio del contrato';
COMMENT ON COLUMN Proveedor.FinContrato IS 'Fecha de fin del contrato';
COMMENT ON COLUMN Proveedor.NumInt IS 'Numero interior del edificio de la vivienda';
COMMENT ON COLUMN Proveedor.NumExt IS 'Numero exterior de la vivienda';
COMMENT ON COLUMN Proveedor.Calle IS 'Calle de la vivienda';
COMMENT ON COLUMN Proveedor.Colonia IS 'Colonia de la vivienda';
COMMENT ON COLUMN Proveedor.CodigoPostal IS 'Codigo postal de la vivienda';
COMMENT ON COLUMN Proveedor.Estado IS 'Estado de la vivienda';
COMMENT ON COLUMN Proveedor.Costo IS 'Costo del insumo que vende el proveedor';
COMMENT ON COLUMN Proveedor.Frecuencia IS 'Frecuencia de entregas del proveedor';
COMMENT ON CONSTRAINT Proveedor_pk ON Proveedor IS 'La llave primaria de la tabla proveedor';
COMMENT ON CONSTRAINT IDPersonaC1 ON Proveedor IS 'Restriccion unique para el atributo IDPersona de Proveedor';
COMMENT ON CONSTRAINT NombreC1 ON Proveedor IS 'Restriccion check el cual nos asegura que Nombre no es la cadena vacia';
COMMENT ON CONSTRAINT NombreC2 ON Proveedor IS 'Restriccion check para nombres únicamente con letras';
COMMENT ON CONSTRAINT ApellidoPaternoC1 ON Proveedor IS 'Restriccion check el cual nos asegura que ApellidoPaterno no es la cadena vacia';
COMMENT ON CONSTRAINT ApellidoPaternoC2 ON Proveedor IS 'Restriccion check para ApellidoPaternos únicamente con letras';
COMMENT ON CONSTRAINT ApellidoMaternoC1 ON Proveedor IS 'Restriccion check el cual nos asegura que ApellidoMaterno no es la cadena vacia';
COMMENT ON CONSTRAINT ApellidoMaternoC2 ON Proveedor IS 'Restriccion check para ApellidoMaternos únicamente con letras';
COMMENT ON CONSTRAINT RFCC1 ON Proveedor IS 'Restriccion check el cual nos asegura que RFC no es la cadena vacia';
COMMENT ON CONSTRAINT GeneroC1 ON Proveedor IS 'Restriccion check el cual nos asegura que Genero no es la cadena vacia';
COMMENT ON CONSTRAINT GeneroC2 ON Proveedor IS 'Restriccion check para admitir sólo dos géneros M o F';
COMMENT ON CONSTRAINT RFCC1 ON Proveedor IS 'Restriccion check el cual nos asegura que RFC no es la cadena vacia';
COMMENT ON CONSTRAINT CalleC1 ON Proveedor IS 'Restriccion check el cual nos asegura que Calle no es la cadena vacia';
COMMENT ON CONSTRAINT CalleC2 ON Proveedor IS 'Restriccion check para Calles únicamente con letras';
COMMENT ON CONSTRAINT ColoniaC1 ON Proveedor IS 'Restriccion check el cual nos asegura que Colonia no es la cadena vacia';
COMMENT ON CONSTRAINT ColoniaC2 ON Proveedor IS 'Restriccion check para Colonias únicamente con letras';
COMMENT ON CONSTRAINT EstadoC1 ON Proveedor IS 'Restriccion check el cual nos asegura que Estado no es la cadena vacia';
COMMENT ON CONSTRAINT EstadoC2 ON Proveedor IS 'Restriccion check para Estados únicamente con letras';
COMMENT ON CONSTRAINT ProductoC1 ON Proveedor IS 'Restriccion check el cual nos asegura que Producto no es la cadena vacia';
COMMENT ON CONSTRAINT FrecuenciaC1 ON Proveedor IS 'Restriccion check el cual nos asegura que Frecuencia no es la cadena vacia';


CREATE TABLE CorreoProveedor (
   IDPersona INT,
   Correo VARCHAR(50)
);
ALTER TABLE CorreoProveedor ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE CorreoProveedor ALTER COLUMN Correo SET NOT NULL;
ALTER TABLE CorreoProveedor ADD CONSTRAINT CorreoC1 UNIQUE (Correo);
ALTER TABLE CorreoProveedor ADD CONSTRAINT CorreoC2 CHECK(Correo <> '');
ALTER TABLE CorreoProveedor ADD CONSTRAINT CorreoC3 CHECK(Correo ~ '^[a-zA-Z0-9._-]*@[0-9a-z.-]*\.[a-zA-Z]{2,}$');
ALTER TABLE CorreoProveedor ADD CONSTRAINT CorreoProveedor_pk PRIMARY KEY (IDPersona,Correo);
ALTER TABLE CorreoProveedor ADD CONSTRAINT CorreoProveedor_fk FOREIGN KEY (IDPersona) REFERENCES Proveedor(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE CorreoProveedor IS 'Tabla que contiene los correos electrónicos de los proveedores';
COMMENT ON COLUMN CorreoProveedor.IDPersona IS 'Identificador del Proveedor';
COMMENT ON COLUMN CorreoProveedor.Correo IS 'Correo electrónico del Proveedor';
COMMENT ON CONSTRAINT CorreoProveedor_pk ON CorreoProveedor IS 'La llave primaria de la tabla CorreoProveedor';
COMMENT ON CONSTRAINT CorreoProveedor_fk ON CorreoProveedor IS 'La llave foránea de la tabla CorreoProveedor que hace referencia a la columna IDPersona de la tabla Proveedor';
COMMENT ON CONSTRAINT CorreoC1 ON CorreoProveedor IS 'Restriccion unique para el atributo Correo de CorreoProveedor';
COMMENT ON CONSTRAINT CorreoC2 ON CorreoProveedor IS 'Restriccion check el cual nos asegura que Correo no es la cadena vacia';
COMMENT ON CONSTRAINT CorreoC3 ON CorreoProveedor IS 'Restriccion check para Correos únicamente con letras';


CREATE TABLE TelefonoProveedor (
   IDPersona INT,
   Telefono CHAR(10)
);
ALTER TABLE TelefonoProveedor ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE TelefonoProveedor ADD CONSTRAINT IDPersonaC3 UNIQUE (IDPersona);
ALTER TABLE TelefonoProveedor ALTER COLUMN Telefono SET NOT NULL;
ALTER TABLE TelefonoProveedor ADD CONSTRAINT TelefonoC1 UNIQUE (Telefono);
ALTER TABLE TelefonoProveedor ADD CONSTRAINT TelefonoC2 CHECK(Telefono <> '');
ALTER TABLE TelefonoProveedor ADD CONSTRAINT TelefonoProveedor_pk PRIMARY KEY (IDPersona,Telefono);
ALTER TABLE TelefonoProveedor ADD CONSTRAINT TelefonoProveedor_fk FOREIGN KEY (IDPersona) REFERENCES Proveedor(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE TelefonoProveedor IS 'Tabla que contiene los teléfonos de los proveedores';
COMMENT ON COLUMN TelefonoProveedor.IDPersona IS 'Identificador del TelefonoProveedor';
COMMENT ON COLUMN TelefonoProveedor.Telefono IS 'Teléfono del Proveedor';
COMMENT ON CONSTRAINT TelefonoProveedor_pk ON TelefonoProveedor IS 'La llave primaria de la tabla TelefonoProveedor';
COMMENT ON CONSTRAINT TelefonoProveedor_fk ON TelefonoProveedor IS 'La llave foránea de la tabla TelefonoProveedor que hace referencia a la columna IDPersona de la tabla Proveedor';
COMMENT ON CONSTRAINT IDPersonaC3 ON TelefonoProveedor IS 'Restriccion unique para el atributo IDPersona de TelefonoProveedor';
COMMENT ON CONSTRAINT TelefonoC1 ON TelefonoProveedor IS 'Restriccion unique para el atributo Telefono de TelefonoProveedor';
COMMENT ON CONSTRAINT TelefonoC2 ON TelefonoProveedor IS 'Restriccion check el cual nos asegura que Telefono no es la cadena vacia';


CREATE TABLE Alimento (
   IDInsumo INT,
   Nombre VARCHAR(40),
   Caducidad DATE,
   Cantidad FLOAT8,
   Refrigeracion BOOL,
   Tipo VARCHAR(20)
);
ALTER TABLE Alimento ALTER COLUMN IDInsumo SET NOT NULL;
ALTER TABLE Alimento ADD CONSTRAINT IDInsumoC1 UNIQUE (IDInsumo);
ALTER TABLE Alimento ADD CONSTRAINT Alimento_pk PRIMARY KEY (IDInsumo);
ALTER TABLE Alimento ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Alimento ADD CONSTRAINT NombreC3 CHECK(Nombre <> '');
ALTER TABLE Alimento ADD CONSTRAINT NombreC4 CHECK(Nombre ~ '^[a-zA-ZáéíóúÁÉÍÓÚüÜÑñ ]*$');
ALTER TABLE Alimento ALTER COLUMN Caducidad SET NOT NULL;
ALTER TABLE Alimento ALTER COLUMN Cantidad SET NOT NULL;
ALTER TABLE Alimento ALTER COLUMN Refrigeracion SET NOT NULL;
ALTER TABLE Alimento ALTER COLUMN Tipo SET NOT NULL;
ALTER TABLE Alimento ADD CONSTRAINT TipoC1 CHECK(Tipo <> '');

COMMENT ON TABLE Alimento IS 'Tabla que contiene los alimentos del zoológico';
COMMENT ON COLUMN Alimento.IDInsumo IS 'Identificador del Alimento';
COMMENT ON COLUMN Alimento.Nombre IS 'Nombre del Alimento';
COMMENT ON COLUMN Alimento.Caducidad IS 'Caducidad del Alimento';
COMMENT ON COLUMN Alimento.Cantidad IS 'Cantidad del Alimento';
COMMENT ON COLUMN Alimento.Refrigeracion IS 'Si el Alimento necesita refrigeración';
COMMENT ON COLUMN Alimento.Tipo IS 'Tipo de Alimento';
COMMENT ON CONSTRAINT Alimento_pk ON Alimento IS 'La llave primaria de la tabla Alimento';
COMMENT ON CONSTRAINT IDInsumoC1 ON Alimento IS 'Restriccion unique para el atributo IDInsumo de Alimento';
COMMENT ON CONSTRAINT NombreC3 ON Alimento IS 'Restriccion check el cual nos asegura que Nombre no es la cadena vacia';
COMMENT ON CONSTRAINT NombreC4 ON Alimento IS 'Restriccion check para Nombres únicamente con letras';
COMMENT ON CONSTRAINT TipoC1 ON Alimento IS 'Restriccion check el cual nos asegura que Tipo no es la cadena vacia';


CREATE TABLE Medicina (
   IDInsumo INT,
   Nombre VARCHAR(50),
   Caducidad DATE,
   Cantidad FLOAT8,
   Refrigeracion BOOL,
   Tipo VARCHAR(50),
   Laboratorio VARCHAR(50),
   Lote VARCHAR(8)
);
ALTER TABLE Medicina ALTER COLUMN IDInsumo SET NOT NULL;
ALTER TABLE Medicina ADD CONSTRAINT IDInsumoC2 Unique(IDInsumo);
ALTER TABLE Medicina ADD CONSTRAINT IDInsumo_pk PRIMARY KEY (IDInsumo);
ALTER TABLE Medicina ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Medicina ADD CONSTRAINT NombreC1 CHECK(Nombre <> '');
ALTER TABLE Medicina ADD CONSTRAINT NombreC2 CHECK(Nombre ~ '^[a-zA-ZáéíóúÁÉÍÓÚüÜÑñ ]*$');
ALTER TABLE Medicina ALTER COLUMN Caducidad SET NOT NULL;
ALTER TABLE Medicina ALTER COLUMN Cantidad SET NOT NULL;
ALTER TABLE Medicina ALTER COLUMN Refrigeracion SET NOT NULL;
ALTER TABLE Medicina ALTER COLUMN Tipo SET NOT NULL;
ALTER TABLE Medicina ADD CONSTRAINT TipoC1 CHECK(Tipo <> '');
ALTER TABLE Medicina ALTER COLUMN Laboratorio SET NOT NULL;
ALTER TABLE Medicina ADD CONSTRAINT LaboratorioC1 CHECK(Laboratorio <> '');
ALTER TABLE Medicina ALTER COLUMN Lote SET NOT NULL;
ALTER TABLE Medicina ADD CONSTRAINT LoteC1 CHECK(Lote <> '');

COMMENT ON TABLE Medicina IS 'Tabla que contiene los datos de las medicinas para los animales.';
COMMENT ON COLUMN Medicina.IDInsumo IS 'Identificador de la medicina.';
COMMENT ON COLUMN Medicina.Nombre IS 'Nombre de la medicina.';
COMMENT ON COLUMN Medicina.Caducidad IS 'Fecha de caducidad de la medicina.';
COMMENT ON COLUMN Medicina.Cantidad IS 'Cantidad de ese tipo medicina.';
COMMENT ON COLUMN Medicina.Refrigeracion IS 'Indica si la medicina necesita refrigeración o no.';
COMMENT ON COLUMN Medicina.Tipo IS 'Tipo de la medicina.';
COMMENT ON COLUMN Medicina.Laboratorio IS 'Laboratorio de donde viene la medicina.';
COMMENT ON COLUMN Medicina.Lote IS 'Lote del medicamento.';
COMMENT ON CONSTRAINT IDInsumoC2 ON Medicina IS 'Restricción de unicidad para el ID de medicina.';
COMMENT ON CONSTRAINT IDInsumo_pk ON Medicina IS 'Llave primaria de la medicina.';
COMMENT ON CONSTRAINT NombreC1 ON Medicina IS 'Check que nos asegura que el nombre no sea la cadena vacía.';
COMMENT ON CONSTRAINT NombreC2 ON Medicina IS 'Check que nos asegura que el nombre de la medicina sólo esté conformado por letras.';
COMMENT ON CONSTRAINT TipoC1 ON Medicina IS 'Check que nos asegura que el tipo de la medicina no sea la cadena vacía.';
COMMENT ON CONSTRAINT LaboratorioC1 ON Medicina IS 'Check que nos asegura que el laboratorio de la medicina no sea la cadena vacía.';
COMMENT ON CONSTRAINT LoteC1 ON Medicina is 'Check que nos asegura que el lote no sea la cadena vacía.';

CREATE TABLE Cliente (
   IDPersona INT,
   Nombre VARCHAR(50),
   ApellidoPaterno VARCHAR(50),
   ApellidoMaterno VARCHAR(50),
   Genero CHAR(1),
   Nacimiento DATE
);
ALTER TABLE Cliente ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE Cliente ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Cliente ADD CONSTRAINT NombreC1 CHECK(Nombre <> '');
ALTER TABLE Cliente ADD CONSTRAINT NombreC2 CHECK(Nombre ~ '^[a-zA-ZáéíóúÁÉÍÓÚüÜÑñ ]*$');
ALTER TABLE Cliente ALTER COLUMN ApellidoPaterno SET NOT NULL;
ALTER TABLE Cliente ADD CONSTRAINT ApellidoPaternoC1 CHECK(ApellidoPaterno <> '');
ALTER TABLE Cliente ADD CONSTRAINT ApellidoPaternoC2 CHECK(ApellidoPaterno ~ '^[a-zA-ZáéíóúÁÉÍÓÚüÜÑñ ]*$');
ALTER TABLE Cliente ALTER COLUMN ApellidoMaterno SET NOT NULL;
ALTER TABLE Cliente ADD CONSTRAINT ApellidoMaternoC1 CHECK(ApellidoMaterno <> '');
ALTER TABLE Cliente ADD CONSTRAINT ApellidoMaternoC2 CHECK(ApellidoMaterno ~ '^[a-zA-ZáéíóúÁÉÍÓÚüÜÑñ ]*$');
ALTER TABLE Cliente ALTER COLUMN Genero SET NOT NULL;
ALTER TABLE Cliente ADD CONSTRAINT GeneroC1 CHECK(Genero <> '');
ALTER TABLE Cliente ADD CONSTRAINT GeneroC2 CHECK(Genero ~ '^[MF]$');
ALTER TABLE Cliente ADD CONSTRAINT Cliente_pk PRIMARY KEY (IDPersona);
ALTER TABLE Cliente ALTER COLUMN Nacimiento SET NOT NULL;

COMMENT ON TABLE Cliente IS 'Tabla que contiene los datos de un cliente.';
COMMENT ON COLUMN Cliente.IDPersona IS 'ID del cliente.';
COMMENT ON COLUMN Cliente.Nombre IS 'Nombre del cliente.';
COMMENT ON COLUMN Cliente.ApellidoPaterno IS 'Apellido paterno del cliente.';
COMMENT ON COLUMN Cliente.ApellidoMaterno IS 'Apellido materno del cliente.';
COMMENT ON COLUMN Cliente.Genero IS 'Género del cliente.';
COMMENT ON COLUMN Cliente.Nacimiento IS 'Fecha de nacimiento del cliente.';
COMMENT ON CONSTRAINT NombreC1 ON Cliente IS 'Check que impide que el nombre del cliente sea la cadena vacía.';
COMMENT ON CONSTRAINT NombreC2 ON Cliente IS 'Check que verifica que el nombre del cliente contenga sólo letras.';
COMMENT ON CONSTRAINT ApellidoPaternoC1 ON Cliente IS 'Check que impide que el apellido paterno del cliente sea la cadena vacía.';
COMMENT ON CONSTRAINT ApellidoPaternoC2 ON Cliente IS 'Check que verifica que el apellido paterno del cliente contenga sólo letras.';
COMMENT ON CONSTRAINT ApellidoMaternoC1 ON Cliente IS 'Check que impide que el apellido materno del cliente sea la cadena vacía.';
COMMENT ON CONSTRAINT ApellidoMaternoC2 ON Cliente IS 'Check que verifica que el apellido materno del cliente contenga sólo letras.';
COMMENT ON CONSTRAINT GeneroC1 ON Cliente IS 'Check que verifica que el género no sea la cadena vacía.';
COMMENT ON CONSTRAINT GeneroC2 ON Cliente IS 'Check que verifica que el género sólo sea M o F, es decir masculino o femenino.';
COMMENT ON CONSTRAINT Cliente_pk ON Cliente IS 'Llave primaria del cleinte';


CREATE TABLE CorreoCliente (
   IDPersona INT,
   Correo VARCHAR(50)
);
ALTER TABLE CorreoCliente ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE CorreoCliente ALTER COLUMN Correo SET NOT NULL;
ALTER TABLE CorreoCliente ADD CONSTRAINT CorreoC1 CHECK(Correo <> '');
ALTER TABLE CorreoCliente ADD CONSTRAINT CorreoC2 CHECK(Correo ~ '^[a-zA-Z0-9._-]*@[a-z.-]*\.[a-zA-Z]{2,}$');
ALTER TABLE CorreoCliente ADD CONSTRAINT CorreoCliente_pk PRIMARY KEY(IDPersona, Correo);
ALTER TABLE CorreoCliente ADD CONSTRAINT CorreoCliente_fk FOREIGN KEY (IDPersona) REFERENCES Cliente(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE CorreoCliente IS 'Tabla para los correos de un cliente.';
COMMENT ON COLUMN CorreoCliente.IDPersona IS 'ID del clietne.';
COMMENT ON COLUMN CorreoCliente.Correo IS 'Correo electrónico del cliente.';
COMMENT ON CONSTRAINT CorreoC1 ON CorreoCliente IS 'Check que verifica que el correo no sea la cadena vacía.';
COMMENT ON CONSTRAINT CorreoC2 ON CorreoCliente IS 'Check que verifica que el correo tenga una estructura válida.';
COMMENT ON CONSTRAINT CorreoCliente_pk ON CorreoCliente IS 'Llave primaria de la tabla.';
COMMENT ON CONSTRAINT CorreoCliente_fk ON CorreoCliente IS 'Llave foránea de la tabla.';


CREATE TABLE TelefonoCliente (
   IDPersona INT,
   Telefono CHAR(10)
);
ALTER TABLE TelefonoCliente ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE TelefonoCliente ALTER COLUMN Telefono SET NOT NULL;
ALTER TABLE TelefonoCliente ADD CONSTRAINT TelefonoC1 CHECK(Telefono <> '');
ALTER TABLE TelefonoCliente ADD CONSTRAINT TelefonoC2 CHECK(Telefono ~ '[0-9]*$');
ALTER TABLE TelefonoCliente ADD CONSTRAINT TelefonoCLiente_pk PRIMARY KEY(IDPersona, Telefono);
ALTER TABLE TelefonoCliente ADD CONSTRAINT TelefonoCLiente_fk FOREIGN KEY (IDPersona) REFERENCES Cliente(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE TelefonoCliente IS 'Tabla con el teléfono del cliente.';
COMMENT ON COLUMN TelefonoCliente.IDPersona IS 'ID del cliente al que pertenece el teléfono.';
COMMENT ON COLUMN TelefonoCliente.Telefono IS 'Telefono del cliente.';
COMMENT ON CONSTRAINT TelefonoC1 ON TelefonoCliente IS 'Check que verifica que el teléfono no sea la cadena vacía.';
COMMENT ON CONSTRAINT TelefonoC2 ON TelefonoCliente IS 'Check para verificar que la cadena del teléfono solo contenga números.';
COMMENT ON CONSTRAINT TelefonoCliente_pk ON TelefonoCliente IS 'Llave primaria de la tabla.';
COMMENT ON CONSTRAINT TelefonoCliente_fk ON TelefonoCliente IS 'Llave foránea de la tabla.';


CREATE TABLE Evento (
   IDEvento INT,
   Fecha DATE,
   Tipo VARCHAR(20),
   Capacidad INT
);
ALTER TABLE Evento ALTER COLUMN IDEvento SET NOT NULL;
ALTER TABLE Evento ALTER COLUMN Fecha SET NOT NULL;
ALTER TABLE Evento ALTER COLUMN Tipo SET NOT NULL;
ALTER TABLE Evento ADD CONSTRAINT TipoC1 CHECK(Tipo <> '');
ALTER TABLE Evento ALTER COLUMN Capacidad SET NOT NULL;
ALTER TABLE Evento ADD CONSTRAINT Evento_pk PRIMARY KEY (IDEvento);

COMMENT ON TABLE Evento IS 'Tabla que contiene los datos de los eventos.';
COMMENT ON COLUMN Evento.IDEvento IS 'ID del evento.';
COMMENT ON COLUMN Evento.Fecha IS 'Fecha del evento.';
COMMENT ON COLUMN Evento.Tipo IS 'Tipo del evento.';
COMMENT ON COLUMN Evento.Capacidad IS 'Capacidad de asistentes del evento.';
COMMENT ON CONSTRAINT TipoC1 ON Evento IS 'Check para verificar que el tipo del evento no sea la cadena vacía.';
COMMENT ON CONSTRAINT Evento_pk ON Evento IS 'Llave primaria de la tabla Evento.';

CREATE TABLE Bioma (
IDBioma INT,
Tipo VARCHAR(30)
);
ALTER TABLE Bioma ALTER COLUMN IDBioma SET NOT NULL;
ALTER TABLE Bioma ADD CONSTRAINT IDBiomaC1 UNIQUE (IDBioma);
ALTER TABLE Bioma ALTER COLUMN Tipo SET NOT NULL;
ALTER TABLE Bioma ADD CONSTRAINT TipoC1 CHECK(Tipo <> '');
ALTER TABLE Bioma ADD CONSTRAINT Bioma_pk PRIMARY KEY (IDBioma);

COMMENT ON TABLE Bioma IS 'Tabla que contiene los datos de cada bioma.';
COMMENT ON COLUMN Bioma.IDBioma IS 'ID del bioma.';
COMMENT ON COLUMN Bioma.Tipo IS 'Tipo de bioma.';
COMMENT ON CONSTRAINT IDBiomaC1 ON Bioma IS 'Restriccion unique para el atributo Bioma';
COMMENT ON CONSTRAINT TipoC1 ON Bioma IS 'Restriccion check el cual nos asegura que Tipo de bioma no sea la cadena vacia';
COMMENT ON CONSTRAINT Bioma_pk ON Bioma IS 'La llave primaria de la tabla Bioma';

CREATE TABLE Jaula (
IDBioma INT,
NumJaula INT
);
ALTER TABLE Jaula ALTER COLUMN IDBioma SET NOT NULL;
ALTER TABLE Jaula ALTER COLUMN NumJaula SET NOT NULL;
ALTER TABLE Jaula add CONSTRAINT NumJaulaC1 UNIQUE (NumJaula);
ALTER TABLE Jaula ADD CONSTRAINT Jaula_pk PRIMARY KEY (IDBioma, NumJaula);
ALTER TABLE Jaula ADD CONSTRAINT Jaula_fk FOREIGN KEY (IDBioma) REFERENCES Bioma(IDBioma)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE Jaula IS 'Tabla que contiene los datos de cada jaula.';
COMMENT ON COLUMN Jaula.IDBioma IS 'ID de la jaula.';
COMMENT ON COLUMN Jaula.NumJaula IS 'Número de la jaula.';
COMMENT ON CONSTRAINT NumJaulaC1 ON Jaula IS 'Restriccion unique para el atributo NumJaula';
COMMENT ON CONSTRAINT Jaula_pk ON Jaula IS 'La llave primaria de la tabla Jaula';
COMMENT ON CONSTRAINT Jaula_fk ON Jaula IS 'La llave foránea de la tabla Jaula que hace referencia a la columna IDBioma de la tabla Bioma';

CREATE TABLE Servicio (
IDBioma INT,
Tipo VARCHAR(10)
);
ALTER TABLE Servicio ALTER COLUMN IDBioma SET NOT NULL;
ALTER TABLE Servicio ALTER COLUMN Tipo SET NOT NULL;
ALTER TABLE Servicio ADD CONSTRAINT TipoC1 CHECK(Tipo <> '');
ALTER TABLE Servicio ADD CONSTRAINT Servicio_pk PRIMARY KEY (IDBioma, Tipo);
ALTER TABLE Servicio ADD CONSTRAINT Servicio_fk FOREIGN KEY (IDBioma) REFERENCES Bioma(IDBioma)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE Servicio IS 'Tabla que contiene los datos de cada Servicio.';
COMMENT ON COLUMN Servicio.IDBioma IS 'ID del Bioma.';
COMMENT ON COLUMN Servicio.Tipo IS 'Tipo del servicio.';
COMMENT ON CONSTRAINT TipoC1 ON Servicio IS 'Restriccion check el cual nos asegura que Tipo de Servicio no sea la cadena vacia';
COMMENT ON CONSTRAINT Servicio_pk ON Servicio IS 'La llave primaria de la tabla Servicio';
COMMENT ON CONSTRAINT Servicio_fk ON Servicio IS 'La llave foránea de la tabla Servicio que hace referencia a la columna IDBioma de la tabla Bioma';

CREATE TABLE Ticket (
NumTicket INT,
IDBioma INT,
Tipo VARCHAR(10),
IDPersona INT,
Fecha DATE,
CostoTotal FLOAT8,
Descuento FLOAT8
);
ALTER TABLE Ticket ALTER COLUMN NumTicket SET NOT NULL;
ALTER TABLE Ticket ALTER COLUMN IDBioma SET NOT NULL;
ALTER TABLE Ticket ALTER COLUMN Tipo SET NOT NULL;
ALTER TABLE Ticket ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE Ticket ALTER COLUMN Fecha SET NOT NULL;
ALTER TABLE Ticket ALTER COLUMN CostoTotal SET NOT NULL;
ALTER TABLE Ticket ALTER COLUMN Descuento SET NOT NULL;
ALTER TABLE Ticket ADD CONSTRAINT TipoC1 CHECK(Tipo <> '');
ALTER TABLE Ticket ADD CONSTRAINT Ticket_pk PRIMARY KEY (NumTicket, IDBioma, Tipo);
ALTER TABLE Ticket ADD CONSTRAINT Ticket_fkey FOREIGN KEY(IDPersona) REFERENCES Cliente(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Ticket ADD CONSTRAINT Ticket_fk FOREIGN KEY (IDBioma,Tipo) REFERENCES Servicio(IDBioma,Tipo)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE Ticket IS 'Tabla que contiene los datos de cada Ticket.';
COMMENT ON COLUMN Ticket.NumTicket IS 'Numero del Ticket.';
COMMENT ON COLUMN Ticket.IDBioma IS 'ID del Bioma.';
COMMENT ON COLUMN Ticket.Tipo IS 'Tipo del servicio.';
COMMENT ON COLUMN Ticket.IDPersona IS 'ID de la Persona.';
COMMENT ON COLUMN Ticket.Fecha IS 'Fecha del Ticket.';
COMMENT ON COLUMN Ticket.CostoTotal IS 'Costo Total del Ticket.';
COMMENT ON COLUMN Ticket.Descuento IS 'Descuento del Ticket.';
COMMENT ON CONSTRAINT TipoC1 ON Ticket IS 'Restriccion check el cual nos asegura que Tipo de Servicio no sea la cadena vacia';
COMMENT ON CONSTRAINT Ticket_pk ON Ticket IS 'La llave primaria de la tabla Ticket';
COMMENT ON CONSTRAINT Ticket_fkey ON Ticket IS 'La llave foránea de la tabla Ticket que hace referencia a la columna IDPersona de la tabla Cliente';
COMMENT ON CONSTRAINT Ticket_fk ON Ticket IS 'La llave foránea de la tabla Ticket que hace referencia a las columnas IDBioma y Tipo de la tabla Servicio';


CREATE TABLE Cuidador (
IDPersona INT,
IDBioma INT,
Nombre VARCHAR(50),
ApellidoPaterno VARCHAR(50),
ApellidoMaterno VARCHAR(50),
Nacimiento DATE,
RFC VARCHAR(10),
Genero CHAR(1),
InicioContrato DATE,
FinContrato DATE,
NumInt INT,
NumExt Int,
Calle VARCHAR(50),
Colonia VARCHAR(50),
CodigoPostal INT,
Estado VARCHAR(20),
Salario FLOAT8,
DiasLabor INT,
HorarioInicio TIME,
HorarioFin TIME
);
ALTER TABLE Cuidador ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN IDBioma SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN ApellidoPaterno SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN ApellidoMaterno SET NOT NULL;
ALTER TABLE Cuidador ADD CONSTRAINT NombreC1 CHECK(Nombre <> '');
ALTER TABLE Cuidador ADD CONSTRAINT NombreC2 CHECK(Nombre ~ '^[a-zñÑA-ZáéíóúÁÉÍÓÚüÜ ]*$');
ALTER TABLE Cuidador ADD CONSTRAINT ApellidoPaternoC1 CHECK(ApellidoPaterno <> '');
ALTER TABLE Cuidador ADD CONSTRAINT ApellidoPaternoC2 CHECK(ApellidoPaterno ~ '^[a-zA-ZÑñáéíóúÁÉÍÓÚüÜ ]*$');
ALTER TABLE Cuidador ADD CONSTRAINT ApellidoMaternoC1 CHECK(ApellidoMaterno <> '');
ALTER TABLE Cuidador ADD CONSTRAINT ApellidoMaternoC2 CHECK(ApellidoMaterno ~ '^[a-zA-ZÑñáéíóúÁÉÍÓÚüÜ ]*$');
ALTER TABLE Cuidador ALTER COLUMN Nacimiento SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN RFC SET NOT NULL;
ALTER TABLE Cuidador ADD CONSTRAINT RFCC1 CHECK(RFC <> '');
ALTER TABLE Cuidador ALTER COLUMN Genero SET NOT NULL;
ALTER TABLE Cuidador ADD CONSTRAINT GeneroC1 CHECK(Genero <> '');
ALTER TABLE Cuidador ADD CONSTRAINT GeneroC2 CHECK(Genero ~ '^[MF]$');
ALTER TABLE Cuidador ALTER COLUMN InicioContrato SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN FinContrato SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN NumInt SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN NumExt SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN Calle SET NOT NULL;
ALTER TABLE Cuidador ADD CONSTRAINT CalleC1 CHECK(Calle <> '');
ALTER TABLE Cuidador ADD constraint CalleC2 CHECK(Calle ~ '[a-zÑñA-ZáéíóúÁÉÍÓÚüÜ0-9\.: ]*$');
ALTER TABLE Cuidador ALTER COLUMN Colonia SET NOT NULL;
ALTER TABLE Cuidador ADD CONSTRAINT ColoniaC1 CHECK(Colonia <> '');
ALTER TABLE Cuidador ADD CONSTRAINT ColoniaC2 CHECK (Colonia ~ '[a-zÑñA-ZáéíóúÁÉÍÓÚüÜ0-9\. ]*$');
ALTER TABLE Cuidador ALTER COLUMN CodigoPostal SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN Estado SET NOT NULL;
ALTER TABLE Cuidador ADD CONSTRAINT EstadoC1 CHECK(Estado <> '');
ALTER TABLE Cuidador ADD CONSTRAINT EstadoC2 CHECK(Estado ~ '[a-zÑñA-ZáéíóúÁÉÍÓÚüÜ0-9\. ]*$');
ALTER TABLE Cuidador ALTER COLUMN Salario SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN DiasLabor SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN HorarioInicio SET NOT NULL;
ALTER TABLE Cuidador ALTER COLUMN HorarioFin SET NOT NULL;
ALTER TABLE Cuidador ADD CONSTRAINT Cuidador_pk PRIMARY KEY (IDPersona);
ALTER TABLE Cuidador ADD CONSTRAINT Cuidador_fkey FOREIGN KEY(IDBioma) REFERENCES Bioma(IDBioma)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE Cuidador IS 'Tabla que contiene los Cuidadores';
COMMENT ON COLUMN Cuidador.IDBioma IS 'Identificador del bioma';
COMMENT ON COLUMN Cuidador.Nombre IS 'Nombre del Cuidador';
COMMENT ON COLUMN Cuidador.ApellidoPaterno IS 'Apellido paterno del Cuidador';
COMMENT ON COLUMN Cuidador.ApellidoMaterno IS 'Apellido materno del Cuidador';
COMMENT ON COLUMN Cuidador.Nacimiento IS 'Fecha de nacimiento';
COMMENT ON COLUMN Cuidador.RFC IS 'RFC del Cuidador';
COMMENT ON COLUMN Cuidador.Genero IS 'Genero del Cuidador';
COMMENT ON COLUMN Cuidador.InicioContrato IS 'Fecha de inicio del contrato';
COMMENT ON COLUMN Cuidador.FinContrato IS 'Fecha de fin del contrato';
COMMENT ON COLUMN Cuidador.NumInt IS 'Numero interior del edificio de la vivienda';
COMMENT ON COLUMN Cuidador.NumExt IS 'Numero exterior de la vivienda';
COMMENT ON COLUMN Cuidador.Calle IS 'Calle de la vivienda';
COMMENT ON COLUMN Cuidador.Colonia IS 'Colonia de la vivienda';
COMMENT ON COLUMN Cuidador.CodigoPostal IS 'Codigo postal de la vivienda';
COMMENT ON COLUMN Cuidador.Estado IS 'Estado de la vivienda';
COMMENT ON COLUMN Cuidador.Salario IS 'Salario del Cuidador';
COMMENT ON COLUMN Cuidador.DiasLabor IS 'Días laborales del Cuidador';
COMMENT ON COLUMN Cuidador.HorarioInicio IS 'Horario de incio del Cuidador';
COMMENT ON COLUMN Cuidador.HorarioFin IS 'Horario de fin del Cuidador';
COMMENT ON CONSTRAINT NombreC1 ON Cuidador IS 'Restriccion check el cual nos asegura que Nombre no es la cadena vacia';
COMMENT ON CONSTRAINT NombreC2 ON Cuidador IS 'Restriccion check para nombres únicamente con letras';
COMMENT ON CONSTRAINT ApellidoPaternoC1 ON Cuidador IS 'Restriccion check el cual nos asegura que ApellidoPaterno no es la cadena vacia';
COMMENT ON CONSTRAINT ApellidoPaternoC2 ON Cuidador IS 'Restriccion check para ApellidoPaternos únicamente con letras';
COMMENT ON CONSTRAINT ApellidoMaternoC1 ON Cuidador IS 'Restriccion check el cual nos asegura que ApellidoMaterno no es la cadena vacia';
COMMENT ON CONSTRAINT ApellidoMaternoC2 ON Cuidador IS 'Restriccion check para ApellidoMaternos únicamente con letras';
COMMENT ON CONSTRAINT RFCC1 ON Cuidador IS 'Restriccion check el cual nos asegura que RFC no es la cadena vacia';
COMMENT ON CONSTRAINT GeneroC1 ON Cuidador IS 'Restriccion check el cual nos asegura que Genero no es la cadena vacia';
COMMENT ON CONSTRAINT GeneroC2 ON Cuidador IS 'Restriccion check para admitir sólo dos géneros M o F';
COMMENT ON CONSTRAINT CalleC1 ON Cuidador IS 'Restriccion check el cual nos asegura que Calle no es la cadena vacia';
COMMENT ON CONSTRAINT CalleC2 ON Cuidador IS 'Restriccion check para Calles únicamente con letras';
COMMENT ON CONSTRAINT ColoniaC1 ON Cuidador IS 'Restriccion check el cual nos asegura que Colonia no es la cadena vacia';
COMMENT ON CONSTRAINT ColoniaC2 ON Cuidador IS 'Restriccion check para Colonias únicamente con letras';
COMMENT ON CONSTRAINT EstadoC1 ON Cuidador IS 'Restriccion check el cual nos asegura que Estado no es la cadena vacia';
COMMENT ON CONSTRAINT EstadoC2 ON Cuidador IS 'Restriccion check para Estados únicamente con letras';
COMMENT ON CONSTRAINT Cuidador_pk ON Cuidador IS 'La llave primaria de la tabla Cuidador';
COMMENT ON CONSTRAINT Cuidador_fkey ON Cuidador IS 'La llave foránea de la tabla Cuidador que hace referencia a la columna IDBioma de la tabla Bioma';


CREATE TABLE CorreoCuidador (
   IDPersona INT,
   Correo VARCHAR(50)
);
ALTER TABLE CorreoCuidador ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE CorreoCuidador ALTER COLUMN Correo SET NOT NULL;
ALTER TABLE CorreoCuidador ADD CONSTRAINT CorreoCuidadorC1 CHECK(Correo <> '');
ALTER TABLE CorreoCuidador ADD CONSTRAINT CorreoCuidadorC2 CHECK(Correo ~ '^[a-zA-Z0-9._-]*@[a-z.-]*\.[a-zA-Z]{2,}$');
ALTER TABLE CorreoCuidador ADD CONSTRAINT CorreoCuidador_pk PRIMARY KEY(IDPersona, Correo);
ALTER TABLE CorreoCuidador ADD CONSTRAINT CorreoCuidador_fk FOREIGN KEY (IDPersona) REFERENCES Cuidador(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE CorreoCuidador IS 'Tabla para los correos de un cuidador.';
COMMENT ON COLUMN CorreoCuidador.IDPersona IS 'ID del clietne.';
COMMENT ON COLUMN CorreoCuidador.Correo IS 'Correo electrónico del cuidador.';
COMMENT ON CONSTRAINT CorreoCuidadorC1 ON CorreoCuidador IS 'Check que verifica que el correo no sea la cadena vacía.';
COMMENT ON CONSTRAINT CorreoCuidadorC2 ON CorreoCuidador IS 'Check que verifica que el correo tenga una estructura válida.';
COMMENT ON CONSTRAINT CorreoCuidador_pk ON CorreoCuidador IS 'Llave primaria de la tabla.';
COMMENT ON CONSTRAINT CorreoCuidador_fk ON CorreoCuidador IS 'Llave foránea de la tabla.';


CREATE TABLE TelefonoCuidador (
   IDPersona INT NOT NULL,
   Telefono CHAR(10) CHECK(Telefono <> '') NOT NULL
);
ALTER TABLE TelefonoCuidador ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE TelefonoCuidador ALTER COLUMN Telefono SET NOT NULL;
ALTER TABLE TelefonoCuidador ADD CONSTRAINT TelefonoCuidadorC1 CHECK(Telefono <> '');
ALTER TABLE TelefonoCuidador ADD CONSTRAINT TelefonoCuidadorC2 UNIQUE(Telefono);
ALTER TABLE TelefonoCuidador ADD CONSTRAINT TelefonoCuidador_pk PRIMARY KEY(IDPersona, Telefono);
ALTER TABLE TelefonoCuidador ADD CONSTRAINT TelefonoCuidador_fk FOREIGN KEY (IDPersona) REFERENCES Cuidador(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE TelefonoCuidador IS 'Tabla con el teléfono del cuidador.';
COMMENT ON COLUMN TelefonoCuidador.IDPersona IS 'ID del cuidador al que pertenece el teléfono.';
COMMENT ON COLUMN TelefonoCuidador.Telefono IS 'Telefono del cuidador.';
COMMENT ON CONSTRAINT TelefonoCuidadorC1 ON TelefonoCuidador IS 'Check que verifica que el teléfono no sea la cadena vacía.';
COMMENT ON CONSTRAINT TelefonoCuidadorC2 ON TelefonoCuidador IS 'Check para verificar que la cadena del teléfono solo contenga números.';
COMMENT ON CONSTRAINT TelefonoCuidador_pk ON TelefonoCuidador IS 'Llave primaria de la tabla.';
COMMENT ON CONSTRAINT TelefonoCuidador_fk ON TelefonoCuidador IS 'Llave foránea de la tabla.';


CREATE TABLE Animal (
   IDAnimal INT,
   IDPersona INT,
   NumJaula INT,
   IDBioma INT,
   Nombre VARCHAR(20),
   Especie TEXT,
   Sexo CHAR(1),
   Peso FLOAT8,
   Alimentacion TEXT,
   Altura FLOAT8
);
ALTER TABLE Animal ALTER COLUMN IDAnimal SET NOT NULL;
ALTER TABLE Animal ADD CONSTRAINT IDAnimalC1 UNIQUE (IDAnimal);
ALTER TABLE Animal ADD CONSTRAINT IDAnimal_pk PRIMARY KEY (IDAnimal);
ALTER TABLE Animal ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE Animal ADD CONSTRAINT IDPersonaC5 UNIQUE (IDPersona);
ALTER TABLE Animal ADD CONSTRAINT IDPersona_fk FOREIGN KEY (IDPersona) REFERENCES Cuidador(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Animal ALTER COLUMN NumJaula SET NOT NULL;
ALTER TABLE Animal ADD CONSTRAINT NumJaulaC2 UNIQUE (NumJaula);
ALTER TABLE Animal ADD CONSTRAINT NumJaula_fk FOREIGN KEY (NumJaula,IDBioma) REFERENCES Jaula(NumJaula,IDBioma)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Animal ALTER COLUMN IDBioma SET NOT NULL;
ALTER TABLE Animal ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Animal ADD CONSTRAINT NombreAnimalC1 CHECK(Nombre <> '');
ALTER TABLE Animal ADD CONSTRAINT NombreAnimalC2 CHECK(Nombre ~ '^[a-zA-ZáéíóúÁÉÍÓÚüÜÑñ ]*$');
ALTER TABLE Animal ALTER COLUMN Especie SET NOT NULL;
ALTER TABLE Animal ADD CONSTRAINT EspecieAnimalC1 CHECK(Especie <> '');
ALTER TABLE Animal ADD CONSTRAINT EspecieAnimalC2 CHECK(Nombre ~ '^[a-zA-ZáéíóúÁÉÍÓÚüÜÑñ ]*$');
ALTER TABLE Animal ALTER COLUMN Sexo SET NOT NULL;
ALTER TABLE Animal ADD CONSTRAINT SexoAnimalC1 CHECK(Sexo <> '');
ALTER TABLE Animal ADD CONSTRAINT SexoAnimalC2 CHECK(Sexo <> '^[M-F]*$');
ALTER TABLE Animal ALTER COLUMN Peso SET NOT NULL;
ALTER TABLE Animal ALTER COLUMN Alimentacion SET NOT NULL;
ALTER TABLE Animal ADD CONSTRAINT AlimentacionAnimalC1 CHECK(Alimentacion <> '');
ALTER TABLE Animal ALTER COLUMN Altura SET NOT NULL;

COMMENT ON TABLE Animal IS 'Tabla que contiene los datos de un Animal.';
COMMENT ON COLUMN Animal.IDAnimal IS 'ID del Animal.';
COMMENT ON COLUMN Animal.IDPersona IS 'ID del cuidador del Animal.';
COMMENT ON COLUMN Animal.NumJaula IS 'Jaula en la que se enjaula en Animal.';
COMMENT ON COLUMN Animal.IDBioma IS 'ID del bioama en el que esta el Animal.';
COMMENT ON COLUMN Animal.Nombre IS 'Nombre comun del Animal.';
COMMENT ON COLUMN Animal.Especie IS 'Especie del Animal.';
COMMENT ON COLUMN Animal.Sexo IS 'Sexo del Animal.';
COMMENT ON COLUMN Animal.Peso IS 'Peso del Animal.';
COMMENT ON COLUMN Animal.Alimentacion IS 'Alimentacion que tiene el Animal.';
COMMENT ON COLUMN Animal.Altura IS 'Altura del Animal.';
COMMENT ON CONSTRAINT IDAnimalC1 ON Animal IS 'Check que verifica que IDAnimal sea unico.';
COMMENT ON CONSTRAINT IDAnimal_pk ON Animal IS 'Llave primaria de la tabla';
COMMENT ON CONSTRAINT IDPersonaC5 ON Animal IS 'Check que verifica que IDPersona sea unico.';
COMMENT ON CONSTRAINT IDPersona_fk ON Animal IS 'Llave foranea de la tabla.';
COMMENT ON CONSTRAINT NumJaulaC2 ON Animal IS 'Check que verifica que NumJaula sea unico.';
COMMENT ON CONSTRAINT NumJaula_fk ON Animal IS 'Llave foranea de la tabla.';
COMMENT ON CONSTRAINT NombreAnimalC1 ON Animal IS 'Check que verifica que el nombre del animal no sea la cadena vacia.';
COMMENT ON CONSTRAINT NombreAnimalC2 ON Animal IS 'Check que verifica que el nombre del animal tenga una estructura valida.';
COMMENT ON CONSTRAINT EspecieAnimalC1 ON Animal IS 'Check que verifica que la especie del animal no sea la cadena vacia.';
COMMENT ON CONSTRAINT EspecieAnimalC2 ON Animal IS 'Check que verifica que la especie del animal tenga una estructura valida.';
COMMENT ON CONSTRAINT SexoAnimalC1 ON Animal IS 'Check que verifica que el sexo del animal no sea la cadena vacia.';
COMMENT ON CONSTRAINT SexoAnimalC2 ON Animal IS 'Check que verifica que el seco del animal tenga una estructura valida.';
COMMENT ON CONSTRAINT AlimentacionAnimalC1 ON Animal IS 'Check que verifica que la alimentacion del animal no sea la cadena vacia.';

CREATE TABLE Veterinario (
   IDPersona INT,
   Nombre VARCHAR(50),
   ApellidoPaterno VARCHAR(50),
   ApellidoMaterno VARCHAR(50),
   Nacimiento DATE,
   RFC VARCHAR(10),
   Genero CHAR(1),
   InicioContrato DATE,
   FinContrato DATE,
   NumInt INT,
   NumExt Int,
   Calle VARCHAR(50),
   Colonia VARCHAR(50),
   CodigoPostal INT,
   Estado VARCHAR(30),
   Salario FLOAT8,
   DiasLabor INT,
   Horario TIME
);
ALTER TABLE Veterinario ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE Veterinario ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Veterinario ADD CONSTRAINT NombreC1 CHECK(Nombre <> '');
ALTER TABLE Veterinario ADD CONSTRAINT NombreC2 CHECK(Nombre ~ '^[a-zñÑA-ZáéíóúÁÉÍÓÚüÜ ]*$');
ALTER TABLE Veterinario ALTER COLUMN ApellidoPaterno SET NOT NULL;
ALTER TABLE Veterinario ADD CONSTRAINT ApellidoPaternoC1 CHECK(ApellidoPaterno <> '');
ALTER TABLE Veterinario ADD CONSTRAINT ApellidoPaternoC2 CHECK(ApellidoPaterno ~ '^[a-zA-ZÑñáéíóúÁÉÍÓÚüÜ ]*$');
ALTER TABLE Veterinario ALTER COLUMN ApellidoMaterno SET NOT NULL;
ALTER TABLE Veterinario ADD CONSTRAINT ApellidoMaternoC1 CHECK(ApellidoMaterno <> '');
ALTER TABLE Veterinario ADD CONSTRAINT ApellidoMaternoC2 CHECK(ApellidoMaterno ~ '^[a-zA-ZÑñáéíóúÁÉÍÓÚüÜ ]*$');
ALTER TABLE Veterinario ALTER COLUMN Nacimiento SET NOT NULL;
ALTER TABLE Veterinario ALTER COLUMN RFC SET NOT NULL;
ALTER TABLE Veterinario ADD CONSTRAINT RFCC1 CHECK(RFC <> '');
ALTER TABLE Veterinario ALTER COLUMN Genero SET NOT NULL;
ALTER TABLE Veterinario ADD CONSTRAINT GeneroC1 CHECK(Genero <> '');
ALTER TABLE Veterinario ADD CONSTRAINT GeneroC2 CHECK(Genero ~ '^[MF]$');
ALTER TABLE Veterinario ALTER COLUMN InicioContrato SET NOT NULL;
ALTER TABLE Veterinario ALTER COLUMN FinContrato SET NOT NULL;
ALTER TABLE Veterinario ALTER COLUMN NumInt SET NOT NULL;
ALTER TABLE Veterinario ALTER COLUMN NumExt SET NOT NULL;
ALTER TABLE Veterinario ALTER COLUMN Calle SET NOT NULL;
ALTER TABLE Veterinario ADD CONSTRAINT CalleC1 CHECK(Calle <> '');
ALTER TABLE Veterinario ADD constraint CalleC2 CHECK(Calle ~ '[a-zÑñA-ZáéíóúÁÉÍÓÚüÜ0-9\.: ]*$');
ALTER TABLE Veterinario ALTER COLUMN Colonia SET NOT NULL;
ALTER TABLE Veterinario ADD CONSTRAINT ColoniaC1 CHECK(Colonia <> '');
ALTER TABLE Veterinario ADD CONSTRAINT ColoniaC2 CHECK (Colonia ~ '[a-zÑñA-ZáéíóúÁÉÍÓÚüÜ0-9\. ]*$');
ALTER TABLE Veterinario ALTER COLUMN CodigoPostal SET NOT NULL;
ALTER TABLE Veterinario ALTER COLUMN Estado SET NOT NULL;
ALTER TABLE Veterinario ADD CONSTRAINT EstadoC1 CHECK(Estado <> '');
ALTER TABLE Veterinario ADD CONSTRAINT EstadoC2 CHECK(Estado ~ '[a-zÑñA-ZáéíóúÁÉÍÓÚüÜ0-9\. ]*$');
ALTER TABLE Veterinario ALTER COLUMN Salario SET NOT NULL;
ALTER TABLE Veterinario ALTER COLUMN DiasLabor SET NOT NULL;
ALTER TABLE Veterinario ALTER COLUMN Horario SET NOT NULL;
ALTER TABLE Veterinario ADD CONSTRAINT Veterinario_pk PRIMARY KEY (IDPersona);

COMMENT ON TABLE Veterinario IS 'Tabla que contiene los datos de los veterinarios.';
COMMENT ON COLUMN Veterinario.IDPersona IS 'Identificador del veterinario.';
COMMENT ON COLUMN Veterinario.Nombre IS 'Nombre del veterinario.';
COMMENT ON CONSTRAINT NombreC1 ON Veterinario IS 'Check que verifica que el nombre no sea la cadena vacía.';
COMMENT ON CONSTRAINT NombreC2 ON Veterinario IS 'Check que verifica que el nombre sólo contenga letras y espacios.';
COMMENT ON COLUMN Veterinario.ApellidoPaterno IS 'Apellido paterno del veterinario.';
COMMENT ON CONSTRAINT ApellidoPaternoC1 ON Veterinario IS 'Check que verifica que el apellido paterno no sea la cadena vacía.';
COMMENT ON CONSTRAINT ApellidoPaternoC2 ON Veterinario IS 'Check que verifica que el apellido paterno sólo contenga letras y espacios.';
COMMENT ON COLUMN Veterinario.ApellidoMaterno IS 'Apellido materno del veterinario.';
COMMENT ON CONSTRAINT ApellidoMaternoC1 ON Veterinario IS 'Check que verifica que el apellido materno no sea la cadena vacía.';
COMMENT ON CONSTRAINT ApellidoMaternoC2 ON Veterinario IS 'Check que verifica que el apellido materno sólo contenga letras y espacios.';
COMMENT ON COLUMN Veterinario.Nacimiento IS 'Fecha de nacimiento de Veterinario';
COMMENT ON COLUMN Veterinario.RFC IS 'RFC del veterinario.';
COMMENT ON CONSTRAINT RFCC1 ON Veterinario IS 'Check que verifica que el RFC no sea la cadena vacía.';
COMMENT ON COLUMN Veterinario.Genero IS 'Género del veterinario.';
COMMENT ON CONSTRAINT GeneroC1 ON Veterinario IS 'Check que verifica que el género no sea la cadena vacía.';
COMMENT ON CONSTRAINT GeneroC2 ON Veterinario IS 'Check que verifica que el género sólo sea M o F';
COMMENT ON COLUMN Veterinario.InicioContrato IS 'Fecha de inicio del contrato del veterinario.';
COMMENT ON COLUMN Veterinario.FinContrato IS 'Fecha de fin del contrato del veterinario.';
COMMENT ON COLUMN Veterinario.NumInt IS 'Número interior de la dirección del veterinario.';
COMMENT ON COLUMN Veterinario.NumExt IS 'Número exterior de la dirección del veterinario.';
COMMENT ON COLUMN Veterinario.Calle IS 'Calle donde vive el veterinario.';
COMMENT ON CONSTRAINT CalleC1 ON Veterinario IS 'Check que verifica que la calle no sea la cadena vacía.';
COMMENT ON CONSTRAINT CalleC2 ON Veterinario IS 'Check que verifica que la calle sólo contenga letras y espacios.';
COMMENT ON COLUMN Veterinario.Colonia IS 'Colonia donde vive el veterinario.';
COMMENT ON CONSTRAINT ColoniaC1 ON Veterinario IS 'Check que verifica que la colonia no sea la cadena vacía.';
COMMENT ON CONSTRAINT ColoniaC2 ON Veterinario IS 'Check que verifica que la colonia sólo contenga letras y espacios.';
COMMENT ON COLUMN Veterinario.CodigoPostal IS 'Código postal del veterinario.';
COMMENT ON COLUMN Veterinario.Estado IS 'Estado donde vive el veterinario.';
COMMENT ON CONSTRAINT EstadoC1 ON Veterinario IS 'Check que verifica que el estado no sea la cadena vacía.';
COMMENT ON CONSTRAINT EstadoC2 ON Veterinario IS 'Check que verifica que el estado sólo contenga letras y espacios.';
COMMENT ON COLUMN Veterinario.Salario IS 'Salario del veterinario.';
COMMENT ON COLUMN Veterinario.DiasLabor IS 'Número de días laborales del veterinario.';
COMMENT ON COLUMN Veterinario.Horario IS 'Horario del veterinario.';
COMMENT ON CONSTRAINT Veterinario_pk ON Veterinario IS 'Llave primaria del veterinario.';


CREATE TABLE Especialidad (
   IDPersona INT,
   Especialidad VARCHAR(50)
);
ALTER TABLE Especialidad ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE Especialidad ALTER COLUMN Especialidad SET NOT NULL;
ALTER TABLE Especialidad ADD CONSTRAINT EspecialidadC1 CHECK (Especialidad <> '');
ALTER TABLE Especialidad ADD CONSTRAINT EspecialidadC2 CHECK (Especialidad <> '^[a-zA-ZáéíóúÁÉÍÓÚüÜÑñ ]*$');
ALTER TABLE Especialidad ADD CONSTRAINT IDPersonaEspecialidadC1 UNIQUE(IDPersona);
ALTER TABLE Especialidad ADD CONSTRAINT Especialidad_pk PRIMARY KEY(IDPersona,Especialidad);
ALTER TABLE Especialidad ADD CONSTRAINT Especialidad_fk FOREIGN KEY (IDPersona) REFERENCES Veterinario(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE Especialidad IS 'Tabla para las especialidades de un veterinario.';
COMMENT ON COLUMN Especialidad.IDPersona IS 'ID del veterinario.';
COMMENT ON COLUMN Especialidad.Especialidad IS 'Especialidad del veterinario.';
COMMENT ON CONSTRAINT EspecialidadC1 ON Especialidad IS 'Check que verifica que la especialidad no sea la cadena vacia.';
COMMENT ON CONSTRAINT EspecialidadC2 ON Especialidad IS 'Check que verifica que la especialidad tenga una estructura valuda.';
COMMENT ON CONSTRAINT Especialidad_pk ON Especialidad IS 'Llave primaria de la tabla.';
COMMENT ON CONSTRAINT Especialidad_fk ON Especialidad IS 'Llave foránea de la tabla.';


CREATE TABLE CorreoVeterinario (
   IDPersona INT NOT NULL,
   Correo VARCHAR(50)
);
ALTER TABLE CorreoVeterinario ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE CorreoVeterinario ALTER COLUMN Correo SET NOT NULL;
ALTER TABLE CorreoVeterinario ADD CONSTRAINT CorreoVeterinarioC1 CHECK(Correo <> '');
ALTER TABLE CorreoVeterinario ADD CONSTRAINT CorreoVeterinarioC2 CHECK (Correo ~ '^[a-zA-Z0-9._-]*@[0-9a-zA-Z._-]*$');
ALTER TABLE CorreoVeterinario ADD CONSTRAINT CorreoVeterinario_pk PRIMARY KEY(IDPersona, Correo);
ALTER TABLE CorreoVeterinario ADD CONSTRAINT CorreoVeterinario_fk FOREIGN KEY (IDPersona) REFERENCES Veterinario(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE CorreoVeterinario IS 'Tabla para los correos de un veterinario.';
COMMENT ON COLUMN CorreoVeterinario.IDPersona IS 'ID del veterinario.';
COMMENT ON COLUMN CorreoVeterinario.Correo IS 'Correo electrónico del veterinario.';
COMMENT ON CONSTRAINT CorreoVeterinarioC1 ON CorreoVeterinario IS 'Check que verifica que el correo no sea la cadena vacía.';
COMMENT ON CONSTRAINT CorreoVeterinarioC2 ON CorreoVeterinario IS 'Check que verifica que el correo tenga una estructura válida.';
COMMENT ON CONSTRAINT CorreoVeterinario_pk ON CorreoVeterinario IS 'Llave primaria de la tabla.';
COMMENT ON CONSTRAINT CorreoVeterinario_fk ON CorreoVeterinario IS 'Llave foránea de la tabla.';

CREATE TABLE TelefonoVeterinario (
   IDPersona INT NOT NULL,
   Telefono CHAR(10) CHECK(Telefono <> '') NOT NULL
);
ALTER TABLE TelefonoVeterinario ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE TelefonoVeterinario ALTER COLUMN Telefono SET NOT NULL;
ALTER TABLE TelefonoVeterinario ADD CONSTRAINT TelefonoVeterinarioC1 CHECK(Telefono <> '');
ALTER TABLE TelefonoVeterinario ADD CONSTRAINT TelefonoVeterinarioC2 UNIQUE(Telefono);
ALTER TABLE TelefonoVeterinario ADD CONSTRAINT TelefonoVeterinario_pk PRIMARY KEY(IDPersona, Telefono);
ALTER TABLE TelefonoVeterinario ADD CONSTRAINT TelefonoVeterinario_fk FOREIGN KEY (IDPersona) REFERENCES Veterinario(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;


CREATE TABLE ProveerAlimento (
IDPersona INT,
IDInsumo INT
);
ALTER TABLE ProveerAlimento ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE ProveerAlimento ALTER COLUMN IDInsumo SET NOT NULL;
ALTER TABLE ProveerAlimento ADD CONSTRAINT ProveerAlimento_fkey FOREIGN KEY(IDPersona) REFERENCES Proveedor(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ProveerAlimento ADD CONSTRAINT ProveerAlimento_fkey2 FOREIGN KEY(IDInsumo) REFERENCES Alimento(IDInsumo)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE ProveerAlimento IS 'Relación entre proveedor y alimento.';
COMMENT ON COLUMN ProveerAlimento.IDPersona IS 'Identificador del proveedor.';
COMMENT ON COLUMN ProveerAlimento.IDInsumo IS 'Identificador del alimento proveído.';
COMMENT ON CONSTRAINT ProveerAlimento_fkey ON ProveerAlimento IS 'Llave foránea del proveedor.';
COMMENT ON CONSTRAINT ProveerAlimento_fkey2 ON ProveerAlimento IS 'Llave foránea del alimento proveído.';


CREATE TABLE ProveerMedicina (
IDPersona INT,
IDInsumo INT
);
ALTER TABLE ProveerMedicina ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE ProveerMedicina ALTER COLUMN IDInsumo SET NOT NULL;
ALTER TABLE ProveerMedicina ADD CONSTRAINT ProveerMedicina_fkey FOREIGN KEY(IDPersona) REFERENCES Proveedor(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ProveerMedicina ADD CONSTRAINT ProveerMedicina_fkey2 FOREIGN KEY(IDInsumo) REFERENCES Medicina(IDInsumo)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE ProveerMedicina IS 'Relación entre proveedor y medicina.';
COMMENT ON COLUMN ProveerMedicina.IDPersona IS 'Identificador del proveedor.';
COMMENT ON COLUMN ProveerMedicina.IDInsumo IS 'Identificador de la medicina proveída.';
COMMENT ON CONSTRAINT ProveerMedicina_fkey ON ProveerMedicina IS 'Llave foránea del proveedor.';
COMMENT ON CONSTRAINT ProveerMedicina_fkey2 ON ProveerMedicina IS 'Llave foránea de la medicina proveída.';


CREATE TABLE Atender (
IDPersona INT,
IDAnimal INT,
IndicacionMedica text
);
ALTER TABLE Atender ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE Atender ALTER COLUMN IDAnimal SET NOT NULL;
ALTER TABLE Atender ALTER COLUMN IndicacionMedica SET NOT NULL;
ALTER TABLE Atender ADD CONSTRAINT Atender_fkey FOREIGN KEY(IDPersona) REFERENCES Veterinario(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Atender ADD CONSTRAINT Atender_fkey2 FOREIGN KEY(IDAnimal) REFERENCES Animal(IDAnimal)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE Atender IS 'Relación entre veterinario y animal.';
COMMENT ON COLUMN Atender.IDPersona IS 'Identificador del veterinario.';
COMMENT ON COLUMN Atender.IDAnimal IS 'Identificador del animal atendido.';
COMMENT ON COLUMN Atender.IndicacionMedica IS 'Indicación médica del animal.';
COMMENT ON CONSTRAINT Atender_fkey ON Atender IS 'Llave foránea del veterinario.';
COMMENT ON CONSTRAINT Atender_fkey2 ON Atender IS 'Llave foránea del animal.';


CREATE TABLE DistribuirAlimento (
IDBioma INT,
IDInsumo INT
);
ALTER TABLE DistribuirAlimento ALTER COLUMN IDBioma SET NOT NULL;
ALTER TABLE DistribuirAlimento ALTER COLUMN IDInsumo SET NOT NULL;
ALTER TABLE DistribuirAlimento ADD CONSTRAINT DistribuirAlimento_fkey FOREIGN KEY(IDBioma) REFERENCES Bioma(IDBioma)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE DistribuirAlimento ADD CONSTRAINT DistribuirAlimento_fkey2 FOREIGN KEY(IDInsumo) REFERENCES Alimento(IDInsumo)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE DistribuirAlimento IS 'Relación de distribuir un alimento en un bioma.';
COMMENT ON COLUMN DistribuirAlimento.IDBioma IS 'Identificador del bioma.';
COMMENT ON COLUMN DistribuirAlimento.IDInsumo IS 'Identificador del alimento.';
COMMENT ON CONSTRAINT DistribuirAlimento_fkey ON DistribuirAlimento IS 'Llave foránea del bioma.';
COMMENT ON CONSTRAINT DistribuirAlimento_fkey2 ON DistribuirAlimento IS 'Llave foránea del alimento.';


CREATE TABLE DistribuirMedicina (
IDBioma INT,
IDInsumo INT
);
ALTER TABLE DistribuirMedicina ALTER COLUMN IDBioma SET NOT NULL;
ALTER TABLE DistribuirMedicina ALTER COLUMN IDInsumo SET NOT NULL;
ALTER TABLE DistribuirMedicina ADD CONSTRAINT DistribuirMedicina_fkey FOREIGN KEY(IDBioma) REFERENCES Bioma(IDBioma)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE DistribuirMedicina ADD CONSTRAINT DistribuirMedicina_fkey2 FOREIGN KEY(IDInsumo) REFERENCES Medicina(IDInsumo)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE DistribuirMedicina IS 'Relación de distribuir medicina en un bioma.';
COMMENT ON COLUMN DistribuirMedicina.IDBioma IS 'Identificador del bioma.';
COMMENT ON COLUMN DistribuirMedicina.IDInsumo IS 'Identificador de la medicina.';
COMMENT ON CONSTRAINT DistribuirMedicina_fkey ON DistribuirMedicina IS 'Llave foránea del bioma.';
COMMENT ON CONSTRAINT DistribuirMedicina_fkey2 ON DistribuirMedicina IS 'Llave foránea de la medicina.';


CREATE TABLE Notificar (
IDPersona INT,
IDEvento INT
);
ALTER TABLE Notificar ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE Notificar ALTER COLUMN IDEvento SET NOT NULL;
ALTER TABLE Notificar ADD CONSTRAINT Notificar_fkey FOREIGN KEY(IDPersona) REFERENCES Cliente(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Notificar ADD CONSTRAINT Notificar_fkey2 FOREIGN KEY(IDEvento) REFERENCES Evento(IDEvento)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE Notificar IS 'Relación de notificar a un cliente que hay un evento.';
COMMENT ON COLUMN Notificar.IDPersona IS 'Identificador del cliente.';
COMMENT ON COLUMN Notificar.IDEvento IS 'Identificador del evento.';
COMMENT ON CONSTRAINT Notificar_fkey ON Notificar IS 'Llave foránea del cliente.';
COMMENT ON CONSTRAINT Notificar_fkey2 ON Notificar IS 'Llave foránea del evento.';


CREATE TABLE Asistir (
IDPersona INT,
IDEvento INT
);
ALTER TABLE Asistir ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE Asistir ALTER COLUMN IDEvento SET NOT NULL;
ALTER TABLE Asistir ADD CONSTRAINT Asistir_fkey FOREIGN KEY(IDEvento) REFERENCES Evento(IDEvento)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Asistir ADD CONSTRAINT Asistir_fkey2 FOREIGN KEY(IDPersona) REFERENCES Cliente(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;


CREATE TABLE Trabajar (
IDBioma INT,
IDPersona INT
);
ALTER TABLE Trabajar ALTER COLUMN IDPersona SET NOT NULL;
ALTER TABLE Trabajar ALTER COLUMN IDBioma SET NOT NULL;
ALTER TABLE Trabajar ADD CONSTRAINT Trabajar_fkey FOREIGN KEY(IDBioma) REFERENCES Bioma(IDBioma)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Trabajar ADD CONSTRAINT Trabajar_fkey2 FOREIGN KEY(IDPersona) REFERENCES Veterinario(IDPersona)
ON UPDATE CASCADE ON DELETE CASCADE;


