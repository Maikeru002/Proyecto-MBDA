--
CREATE TABLE Accidentes(
IdAccidente NUMBER(4),
FechaReporte DATE NOT NULL,
Jornada VARCHAR(10) NOT NULL,
Indemnizacion INT NOT NULL,
IdSede NUMBER(4) NOT NULL,
IdObjeto NUMBER(4) NOT NULL,
IdMecanismo NUMBER(4) NOT NULL,
Cedula_Persona VARCHAR(20) NOT NULL,
DiasIncapacidad INT
);

CREATE TABLE Mecanismo(
id NUMBER(4),
Descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE AccidenteLesiones(
IdAccidente NUMBER(4),
IdLesion NUMBER(4) NOT NULL
);

CREATE TABLE Lesiones(
id NUMBER(4),
Descripcion VARCHAR(100) NOT NULL,
Grado VARCHAR(2) NOT NULL
);

CREATE TABLE Afecta(
IdAccidente NUMBER(4) NOT NULL,
IdParte NUMBER(4) NOT NULL
);

CREATE TABLE Partes(
Id NUMBER(4),
Descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE Hospitales(
Nombre_Hospital VARCHAR(50) NOT NULL,
Ubicacion VARCHAR(30) NOT NULL,
Tiempo_Hospitalizado VARCHAR(10) NOT NULL,
Tratamiento VARCHAR(100) NOT NULL
);

CREATE TABLE Sedes(
IdSede NUMBER(4),
NombreSede VARCHAR(50) NOT NULL
);

CREATE TABLE Lugares(
Id NUMBER(4),
IdSede NUMBER(4) NOT NULL,
Descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE Personal(
Cedula VARCHAR(20) NOT NULL,
Nombres VARCHAR(30) NOT NULL,
Apellidos VARCHAR(30) NOT NULL,
Fecha_Nacimiento DATE NOT NULL,
Direccion VARCHAR(30) NOT NULL,
Telefono VARCHAR(11) NOT NULL,
Correo VARCHAR(50),
Estado VARCHAR(15) NOT NULL,
NombreHospital VARCHAR(50) NOT NULL
);

CREATE TABLE Interinos(
CedulaPersonal VARCHAR(20) NOT NULL,
Suple_Titular VARCHAR(50) NOT NULL,
TrabajoAsignado VARCHAR(100) NOT NULL
);

CREATE TABLE Eventuales(
CedulaPersonal VARCHAR(20) NOT NULL,
Funcion VARCHAR(100) NOT NULL,
AreaAsignada VARCHAR(30) NOT NULL
);

CREATE TABLE Laborales(
CedulaPersonal VARCHAR(20) NOT NULL,
Ocupacion VARCHAR(100) NOT NULL,
Cargo VARCHAR(30) NOT NULL
);  

CREATE TABLE ObjetoLesion(
Id NUMBER(4),
Descripcion VARCHAR(100) NOT NULL,
PotencialRiesgo VARCHAR(2) NOT NULL
);

CREATE TABLE Enfermedades(
IdEnfermedad NUMBER(4),
Gravedad VARCHAR(1) NOT NULL,
Descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE Profesiones(
IdProfesion NUMBER(4),
Profesion VARCHAR(100)
);


CREATE TABLE PersonalProfesion(
Cedula VARCHAR(20) NOT NULL,
IdProfesion NUMBER(4) NOT NULL
);


CREATE TABLE PersonalEnfermedad(
Cedula VARCHAR(20) NOT NULL,
idEnfermedad NUMBER(4) NOT NULL
);


CREATE TABLE Versiones_Accidentes(
Id_Version NUMBER(4),
FechaVersion DATE NOT NULL,
Version VARCHAR(225) NOT NULL,
Id_Investigacion NUMBER(4) NOT NULL
);


CREATE TABLE InvestigacionCausa(
IdInvestigacion NUMBER(4),
Id_Causa NUMBER(4) NOT NULL
);


CREATE TABLE InvestigacionDetalle(
IdInvestigacion NUMBER(4),
FechaInvestigacion DATE NOT NULL,
CedulaResponsable VARCHAR(20) NOT NULL,
idAccidente NUMBER(4) NOT NULL
);


CREATE TABLE Causas(
Id_Causa NUMBER(4),
Causa VARCHAR(100) NOT NULL
);

CREATE TABLE Controles(
Id_Control NUMBER(4),
Control VARCHAR(225) NOT NULL,
EstadoControl VARCHAR(225) NOT NULL,
Id_Investigacion NUMBER(4) NOT NULL
);

CREATE TABLE Evidencias(
Id_Evidencia NUMBER(4),
Url VARCHAR(225) NOT NULL,
Id_Investigacion NUMBER(4) NOT NULL
);

CREATE TABLE Equipo_Investigador(
Id_Equipo NUMBER(4),
Id_Investigacion NUMBER(4) NOT NULL
);

-- xTable
DROP TABLE Accidentes CASCADE CONSTRAINTS;
DROP TABLE Mecanismo CASCADE CONSTRAINTS;
DROP TABLE AccidenteLesiones CASCADE CONSTRAINTS;
DROP TABLE Lesiones CASCADE CONSTRAINTS;
DROP TABLE Afecta CASCADE CONSTRAINTS;
DROP TABLE Partes CASCADE CONSTRAINTS;
DROP TABLE Hospitales CASCADE CONSTRAINTS;
DROP TABLE Sedes CASCADE CONSTRAINTS; 
DROP TABLE Lugares CASCADE CONSTRAINTS;
DROP TABLE Personal CASCADE CONSTRAINTS;
DROP TABLE Interinos CASCADE CONSTRAINTS;
DROP TABLE Eventuales CASCADE CONSTRAINTS;
DROP TABLE Laborales CASCADE CONSTRAINTS;
DROP TABLE ObjetoLesion CASCADE CONSTRAINTS;
DROP TABLE Enfermedades CASCADE CONSTRAINTS;
DROP TABLE Profesiones CASCADE CONSTRAINTS;
DROP TABLE PersonalProfesion CASCADE CONSTRAINTS;
DROP TABLE PersonalEnfermedad CASCADE CONSTRAINTS; 
DROP TABLE Versiones_Accidentes CASCADE CONSTRAINTS;
DROP TABLE InvestigacionCausa CASCADE CONSTRAINTS;
DROP TABLE InvestigacionDetalle CASCADE CONSTRAINTS;
DROP TABLE Causas CASCADE CONSTRAINTS;
DROP TABLE Controles CASCADE CONSTRAINTS;
DROP TABLE Evidencias CASCADE CONSTRAINTS;
DROP TABLE Equipo_Investigador CASCADE CONSTRAINTS;

--INTEGRIDAD DECLARATIVA
-- LLAVES PRINCIPALES
-- Accidentes
ALTER TABLE Accidentes ADD CONSTRAINT PK_Accidentes PRIMARY KEY(IdAccidente);

-- Mecanismo
ALTER TABLE Mecanismo ADD CONSTRAINT PK_Mecanismo PRIMARY KEY(Id);

-- Accidente_Lesiones
ALTER TABLE AccidenteLesiones ADD CONSTRAINT PK_Accidente_Lesiones PRIMARY KEY(IdAccidente,IdLesion);

-- Lesiones 
ALTER TABLE Lesiones ADD CONSTRAINT PK_Lesiones PRIMARY KEY(Id);

 --Partes
ALTER TABLE Partes ADD CONSTRAINT PK_Partes PRIMARY KEY(Id);

-- Afecta
ALTER TABLE Afecta ADD CONSTRAINT PK_Afecta PRIMARY KEY(IdAccidente, IdParte);

--Hospitales
ALTER TABLE Hospitales ADD CONSTRAINT PK_Hospitales PRIMARY KEY(Nombre_Hospital);

-- Sedes
ALTER TABLE Sedes ADD CONSTRAINT PK_Sedes PRIMARY KEY(IdSede); 

-- Lugares
ALTER TABLE Lugares ADD CONSTRAINT PK_Lugares PRIMARY KEY(Id,IdSede);

-- Personal
ALTER TABLE Personal ADD CONSTRAINT PK_Personal PRIMARY KEY(Cedula);

-- Interinos
ALTER TABLE Interinos ADD CONSTRAINT PK_Interinos PRIMARY KEY(CedulaPersonal);

-- Eventuales
ALTER TABLE  Eventuales ADD CONSTRAINT PK_Eventuales PRIMARY KEY(CedulaPersonal);

-- Laborales
ALTER TABLE Laborales ADD CONSTRAINT PK_Laborales PRIMARY KEY(CedulaPersonal);

-- PersonalEnfermedad
ALTER TABLE PersonalEnfermedad ADD CONSTRAINT PK_PersonalEnfermedad PRIMARY KEY(Cedula,IdEnfermedad);

-- PersonalProfesion
ALTER TABLE PersonalProfesion ADD CONSTRAINT PK_PersonalProfesion PRIMARY KEY(Cedula,IdProfesion);

-- InvestigacionCausa
ALTER TABLE InvestigacionCausa ADD CONSTRAINT PK_InvestigacionCausa PRIMARY KEY(IdInvestigacion);

-- Investigacion_Detalle
ALTER TABLE InvestigacionDetalle ADD CONSTRAINT PK_Investigacion_Detalle PRIMARY KEY(IdInvestigacion);

-- ObjetoLesion
ALTER TABLE ObjetoLesion ADD CONSTRAINT PK_ObjetoLesion PRIMARY KEY(Id);

-- ENfermedades
ALTER TABLE Enfermedades ADD CONSTRAINT PK_Enfermedades PRIMARY KEY(IdEnfermedad);

-- Profesiones
ALTER TABLE Profesiones ADD CONSTRAINT PK_Profesiones PRIMARY KEY(IdProfesion);

--Versiones_Accidentes
ALTER TABLE Versiones_Accidentes ADD CONSTRAINT PK_Versiones_Accidentes PRIMARY KEY(Id_Version);

-- Causas
ALTER TABLE  Causas ADD CONSTRAINT PK_Causas PRIMARY KEY(Id_Causa);

-- Controles
ALTER TABLE Controles ADD CONSTRAINT PK_Controles PRIMARY KEY(Id_Control);

-- Evidencias
ALTER TABLE Evidencias ADD CONSTRAINT PK_Evidencias PRIMARY KEY(Id_Evidencia);

--Equipo_Investigador
ALTER TABLE Equipo_Investigador ADD CONSTRAINT PK_Equipo_Investigador PRIMARY KEY(Id_Equipo);


-- LLAVES FORANEAS

-- Accidentes
ALTER TABLE Accidentes ADD CONSTRAINT FK_Accidente_Mecanismo
FOREIGN KEY (IdMecanismo) REFERENCES Mecanismo(Id);

ALTER TABLE Accidentes ADD CONSTRAINT FK_Accidente_ObjetoLesion -- No funciona
FOREIGN KEY (IdObjeto) REFERENCES ObjetoLesion(Id);

ALTER TABLE Accidentes ADD CONSTRAINT FK_Accidente_IdSede -- No funciona
FOREIGN KEY (IdSede) REFERENCES Sedes(IdSede);

ALTER TABLE Accidentes ADD CONSTRAINT FK_Accidente_Personal
FOREIGN KEY(Cedula_Persona) REFERENCES Personal(Cedula);

-- Accidente_Lesiones 
ALTER TABLE AccidenteLesiones  ADD CONSTRAINT FK_AL_Accidentes
FOREIGN KEY (IdAccidente) REFERENCES Accidentes(IdAccidente);

ALTER TABLE AccidenteLesiones  ADD CONSTRAINT FK_AL_Lesiones
FOREIGN KEY (IdLesion) REFERENCES Lesiones(id);

-- Afecta
ALTER TABLE Afecta  ADD CONSTRAINT FK_Afecta_Accidentes
FOREIGN KEY (IdAccidente) REFERENCES Accidentes(IdAccidente);

ALTER TABLE Afecta  ADD CONSTRAINT FK_Afecta_Partes
FOREIGN KEY (IdParte) REFERENCES Partes(Id);

-- Lugares
ALTER TABLE Lugares  ADD CONSTRAINT FK_Lugares_Sedes
FOREIGN KEY (IdSede) REFERENCES Sedes(IdSede);

-- Investigacion Detalle
ALTER TABLE InvestigacionDetalle ADD CONSTRAINT FK_ID_Accidente
FOREIGN KEY (idAccidente)REFERENCES Accidentes(idAccidente);

-- Investigacion Causa
ALTER TABLE InvestigacionCausa ADD CONSTRAINT FK_Icausas_Causas
FOREIGN KEY (Id_Causa) REFERENCES Causas(id_causa);

ALTER TABLE InvestigacionCausa ADD CONSTRAINT FK_Icausas_Idetalle
FOREIGN KEY (Idinvestigacion) REFERENCES InvestigacionDetalle(IdInvestigacion);

-- Personal Enfermedad
ALTER TABLE PersonalEnfermedad ADD CONSTRAINT FK_Penfermedad_Personal
FOREIGN KEY (Cedula) REFERENCES Personal(Cedula);

ALTER TABLE PersonalEnfermedad ADD CONSTRAINT FK_Penfermedad_Enfermedades
FOREIGN KEY (idEnfermedad) REFERENCES Enfermedades(idEnfermedad);

-- Personal Profesion
ALTER TABLE PersonalProfesion ADD CONSTRAINT FK_Pprofesion_Personal
FOREIGN KEY (Cedula) REFERENCES Personal(Cedula);

ALTER TABLE PersonalProfesion ADD CONSTRAINT FK_Pprofesion_Profesiones
FOREIGN KEY (IdProfesion) REFERENCES Profesiones(IdProfesion);

-- Laborales
ALTER TABLE Laborales ADD CONSTRAINT FK_Personal_Personal
FOREIGN KEY (CedulaPersonal) REFERENCES Personal(Cedula);

-- Eventuales
ALTER TABLE Eventuales ADD CONSTRAINT FK_Eventuales_Personal
FOREIGN KEY (CedulaPersonal) REFERENCES Personal(Cedula);

-- interinos
ALTER TABLE Interinos ADD CONSTRAINT FK_Interinos_Personal
FOREIGN KEY (CedulaPersonal) REFERENCES Personal(Cedula);

-- Personal
ALTER TABLE Personal ADD CONSTRAINT FK_Personal_Hospitales
FOREIGN KEY (NombreHospital) REFERENCES Hospitales(Nombre_Hospital);

-- Versiones Accidentes
ALTER TABLE Versiones_Accidentes ADD CONSTRAINT FK_Vaccidentes_Idetalle
FOREIGN KEY (Id_Investigacion) REFERENCES InvestigacionDetalle(IdInvestigacion);


-- Controles    
ALTER TABLE Controles ADD CONSTRAINT FK_Controles_IV
FOREIGN KEY (Id_Investigacion) REFERENCES InvestigacionDetalle(IdInvestigacion);

-- Evidencias
ALTER TABLE Evidencias ADD CONSTRAINT FK_Evidencias_IV 
FOREIGN KEY (Id_Investigacion) REFERENCES InvestigacionDetalle(IdInvestigacion);

-- Equipo_investigador
ALTER TABLE Equipo_investigador ADD CONSTRAINT FK_Equipoinvestigador_IV 
FOREIGN KEY (Id_Investigacion) REFERENCES InvestigacionDetalle(IdInvestigacion);

--UK
-- Personal
ALTER TABLE Personal ADD CONSTRAINT UK_PERSONAL UNIQUE(Correo);
-- Sede
ALTER TABLE Sedes ADD CONSTRAINT UK_Sede UNIQUE(NombreSede);

--CK

--Personal--
ALTER TABLE Personal ADD CONSTRAINT TCorreo
CHECK (REGEXP_LIKE(Correo, '^[A-Za-z0-9.-]+@[A-Za-z0-9.-]+\.[A-Za-z.-]{2,15}$'));
--El Teléfono ingresado debe ser de longitud 10
ALTER TABLE Personal ADD CONSTRAINT CK_Personal_Telefono
CHECK(length(Telefono) = 10);


ALTER TABLE Personal ADD CONSTRAINT TEstado
CHECK (Estado IN ('Incapacitado', 'Laborando'));

--Accidente--
ALTER TABLE Accidentes ADD CONSTRAINT TJornada
CHECK (Jornada IN ('Diurna', 'Nocturna'));

ALTER TABLE Accidentes ADD CONSTRAINT TIndem
CHECK (Indemnizacion IN ('Sí', 'No'));

--Lesion--
ALTER TABLE Lesiones ADD CONSTRAINT TGrado
CHECK (Grado IN ('T1', 'T2', 'T3'));

--La descripción de Lesión debe ser como mínimo de 50 carácteres
ALTER TABLE Lesiones ADD CONSTRAINT CK_Lesiones_Descripción
CHECK(length(Descripcion) >= 50);

--Objeto_Lesion--
ALTER TABLE ObjetoLesion ADD CONSTRAINT TPotencial
CHECK (PotencialRiesgo IN ('Sí', 'No'));

--Enfermedades--
ALTER TABLE Enfermedades ADD CONSTRAINT TGravedad
CHECK (Gravedad IN ('1', '2', '3', '4', '5'));

--Controles--
ALTER TABLE Controles ADD CONSTRAINT TEstadoC
CHECK (EstadoControl IN ('Pendiente', 'Completo'));

--Mecanismo--
--La descripción del mecanismo debe ser como mínimo de 50 carácteres
ALTER TABLE Mecanismo ADD CONSTRAINT CK_Mecanismos_Descripción
CHECK(length(Descripcion) >= 50);

--Parte--
--La descripción de Partes debe ser como mínimo de 50 carácteres
ALTER TABLE Partes ADD CONSTRAINT CK_Partes_Descripción
CHECK(length(Descripcion) >= 50);

--Evidencias--
ALTER TABLE Evidencias ADD CONSTRAINT CK_Evidencias_Url
CHECK(Url like 'www.%.com');


--Integridad Procedimental
--Interino
--Cédula del interino no puede ser igual a la del Suplente
CREATE OR REPLACE TRIGGER TG_InterinoSuplente
BEFORE INSERT ON Interinos
FOR EACH ROW
DECLARE
    CONS VARCHAR(20);
BEGIN
    SELECT Suple_Titular INTO CONS FROM Interinos WHERE Suple_Titular = CedulaPersonal;
    IF CONS IS NOT NULL THEN
        Raise_Application_Error (-20000, 'El personal no se puede reemplazar por sí mismo');
    END IF;
END;
/
--Personal
--Únicamente se puede modificar Correo, Teléfono, Estado, Dirección y NombreHospital
CREATE OR REPLACE TRIGGER TG_DatosPersonal
BEFORE UPDATE OF Cedula, Nombres, Apellidos, Fecha_Nacimiento ON Personal
BEGIN
    Raise_Application_Error (-20001, 'Únicamente se puede modificar Correo, Teléfono, Estado, Dirección y NombreHospital');
END;
/
--InvestigacionDetalle
--La fecha se asigna automáticamente en FechaInvestigacion
CREATE OR REPLACE TRIGGER TG_InvestigacionDetalle
BEFORE INSERT ON InvestigacionDetalle
FOR EACH ROW
DECLARE
    CONS DATE;
BEGIN
    SELECT SYSDATE INTO CONS FROM dual;
    :NEW.FechaInvestigacion := CONS;
END;
/
--Id Autogenerado
CREATE OR REPLACE TRIGGER TG_IdInvestigacionDetalle
BEFORE INSERT ON InvestigacionDetalle
FOR EACH ROW
DECLARE
    CONS NUMBER(4);
BEGIN
    SELECT MAX(IdInvestigacion)+1 INTO CONS FROM InvestigacionDetalle;
    IF CONS IS NULL THEN
        :NEW.IdInvestigacion := 1;
    ELSE
        :NEW.IdInvestigacion := CONS;
    END IF;
END;
/


--Mecanismos
--Id Autogenerado
CREATE OR REPLACE TRIGGER TG_IdMecanismo
BEFORE INSERT ON Mecanismo
FOR EACH ROW
DECLARE
    CONS NUMBER(4);
BEGIN
    SELECT MAX(id)+1 INTO CONS FROM Mecanismo;
    IF CONS IS NULL THEN
        :NEW.id := 1;
    ELSE
        :NEW.id := CONS;
    END IF;
END;
/
--Lesiones
--Id Autogenerado
CREATE OR REPLACE TRIGGER TG_IdLesiones
BEFORE INSERT ON Lesiones
FOR EACH ROW
DECLARE
    CONS NUMBER(4);
BEGIN
    SELECT MAX(id)+1 INTO CONS FROM Lesiones;
    IF CONS IS NULL THEN
        :NEW.id := 1;
    ELSE
        :NEW.id := CONS;
    END IF;
END;
/

--Partes
--Id Autogenerado
CREATE OR REPLACE TRIGGER TG_IdPartes
BEFORE INSERT ON Partes
FOR EACH ROW
DECLARE
    CONS NUMBER(4);
BEGIN
    SELECT MAX(Id)+1 INTO CONS FROM Partes;
    IF CONS IS NULL THEN
        :NEW.Id := 1;
    ELSE
        :NEW.Id := CONS;
    END IF;
END;
/

--Accidentes
--Id Autogenerado
CREATE OR REPLACE TRIGGER TG_IdAccidentes
BEFORE INSERT ON Accidentes
FOR EACH ROW
DECLARE
    CONS NUMBER(4);
BEGIN
    SELECT MAX(idAccidente)+1 INTO CONS FROM Accidentes;
    IF CONS IS NULL THEN
        :NEW.idAccidente := 1;
    ELSE
        :NEW.idAccidente := CONS;
    END IF;
END;
/

--Sedes
--Id Autogenerado
CREATE OR REPLACE TRIGGER TG_IdSedes
BEFORE INSERT ON Sedes
FOR EACH ROW
DECLARE
    CONS NUMBER(4);
BEGIN
    SELECT MAX(IdSede)+1 INTO CONS FROM Sedes;
    IF CONS IS NULL THEN
        :NEW.IdSede := 1;
    ELSE
        :NEW.IdSede := CONS;
    END IF;
END;
/

--Lugares
--Id Autogenerado
CREATE OR REPLACE TRIGGER TG_IdLugares
BEFORE INSERT ON Lugares
FOR EACH ROW
DECLARE
    CONS NUMBER(4);
BEGIN
    SELECT MAX(Id)+1 INTO CONS FROM Lugares;
    IF CONS IS NULL THEN
        :NEW.Id := 1;
    ELSE
        :NEW.Id := CONS;
    END IF;
END;
/

--ObjetoLesion
--Id Autogenerado
CREATE OR REPLACE TRIGGER TG_IdObjetoLesion
BEFORE INSERT ON ObjetoLesion
FOR EACH ROW
DECLARE
    CONS NUMBER(4);
BEGIN
    SELECT MAX(Id)+1 INTO CONS FROM ObjetoLesion;
    IF CONS IS NULL THEN
        :NEW.Id := 1;
    ELSE
        :NEW.Id := CONS;
    END IF;
END;
/

--Profesiones
--Id Autogenerado
CREATE OR REPLACE TRIGGER TG_IdProfesiones
BEFORE INSERT ON Profesiones
FOR EACH ROW
DECLARE
    CONS NUMBER(4);
BEGIN
    SELECT MAX(IdProfesion)+1 INTO CONS FROM Profesiones;
    IF CONS IS NULL THEN
        :NEW.IdProfesion := 1;
    ELSE
        :NEW.IdProfesion := CONS;
    END IF;
END;
/
--Enfermedades
--Id Autogenerado
CREATE OR REPLACE TRIGGER TG_IdEnfermedades
BEFORE INSERT ON Enfermedades
FOR EACH ROW
DECLARE
    CONS NUMBER(4);
BEGIN
    SELECT MAX(IdEnfermedad)+1 INTO CONS FROM Enfermedades;
    IF CONS IS NULL THEN
        :NEW.IdEnfermedad := 1;
    ELSE
        :NEW.IdEnfermedad := CONS;
    END IF;
END;
/

--Versiones_Accidentes
--Id Autogenerado
CREATE OR REPLACE TRIGGER TG_IdVersiones_Accidentes
BEFORE INSERT ON Versiones_Accidentes
FOR EACH ROW
DECLARE
    CONS NUMBER(4);
BEGIN
    SELECT MAX(Id_Version)+1 INTO CONS FROM Versiones_Accidentes;
    IF CONS IS NULL THEN
        :NEW.Id_Version := 1;
    ELSE
        :NEW.Id_Version := CONS;
    END IF;
END;
/

--Causas
--Id Autogenerado
CREATE OR REPLACE TRIGGER TG_IdCausas
BEFORE INSERT ON Causas
FOR EACH ROW
DECLARE
    CONS NUMBER(4);
BEGIN
    SELECT MAX(Id_Causa)+1 INTO CONS FROM Causas;
    IF CONS IS NULL THEN
        :NEW.Id_Causa := 1;
    ELSE
        :NEW.Id_Causa := CONS;
    END IF;
END;
/

--Controles
--Id Autogenerado
CREATE OR REPLACE TRIGGER TG_IdControles
BEFORE INSERT ON Controles
FOR EACH ROW
DECLARE
    CONS NUMBER(4);
BEGIN
    SELECT MAX(Id_Control)+1 INTO CONS FROM Controles;
    IF CONS IS NULL THEN
        :NEW.Id_Control := 1;
    ELSE
        :NEW.Id_Control := CONS;
    END IF;
END;
/

--Evidencias
--Id Autogenerado
CREATE OR REPLACE TRIGGER TG_IdEvidencias
BEFORE INSERT ON Evidencias
FOR EACH ROW
DECLARE
    CONS NUMBER(4);
BEGIN
    SELECT MAX(Id_Evidencia)+1 INTO CONS FROM Evidencias;
    IF CONS IS NULL THEN
        :NEW.Id_Evidencia := 1;
    ELSE
        :NEW.Id_Evidencia := CONS;
    END IF;
END;
/

--Equipo_Investigador
--Id Autogenerado
CREATE OR REPLACE TRIGGER TG_IdEquipo_Investigador
BEFORE INSERT ON Equipo_Investigador
FOR EACH ROW
DECLARE
    CONS NUMBER(4);
BEGIN
    SELECT MAX(Id_Equipo)+1 INTO CONS FROM Equipo_Investigador;
    IF CONS IS NULL THEN
        :NEW.Id_Equipo := 1;
    ELSE
        :NEW.Id_Equipo := CONS;
    END IF;
END;
/

--CRUDE PK_PERSONAL
CREATE OR REPLACE PACKAGE PK_PERSONAL
IS
    PROCEDURE adicionarPersonal(Cedula VARCHAR, Nombres VARCHAR, Apellidos VARCHAR,
    Fecha_Nacimiento DATE, Direccion VARCHAR, Telefono VARCHAR, Correo VARCHAR, 
    Estado VARCHAR, NombreHospital VARCHAR);
    
    PROCEDURE modificarPersonal(xCedula VARCHAR, xDireccion VARCHAR, xTelefono VARCHAR, xCorreo VARCHAR,
    xEstado VARCHAR);
    
    PROCEDURE eliminarPersonal(xCedula VARCHAR);
    
    PROCEDURE consultarPersonal(Cedula OUT SYS_REFCURSOR);
    
    PROCEDURE adicionarEnfermedad(Gravedad VARCHAR, Descripcion VARCHAR);
    
    PROCEDURE adicionarLaboral(CedulaPersonal VARCHAR, Ocupacion VARCHAR, Cargo VARCHAR);
    
    PROCEDURE adicionarEventual(CedulaPersonal VARCHAR, Funcion VARCHAR, AreaAsignada VARCHAR);
    
    PROCEDURE adicionarInterino(CedulaPersonal VARCHAR, Suple_Titular VARCHAR, 
    TrabajoAsignado VARCHAR);
    
    PROCEDURE adicionarHospitales(Nombre_Hospital VARCHAR, Ubicacion VARCHAR,
    Tiempo_Hospitalizado VARCHAR, Tratamiento VARCHAR);
END;
/
--CRUDI PK_PERSONAL
CREATE OR REPLACE PACKAGE BODY PK_PERSONAL
IS
    PROCEDURE adicionarPersonal(Cedula VARCHAR, Nombres VARCHAR, Apellidos VARCHAR,
    Fecha_Nacimiento DATE, Direccion VARCHAR, Telefono VARCHAR, Correo VARCHAR, 
    Estado VARCHAR, NombreHospital VARCHAR) IS
    BEGIN
    INSERT INTO Personal VALUES(Cedula, Nombres, Apellidos, Fecha_Nacimiento, 
    Direccion, Telefono, Correo, Estado, NombreHospital);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20075, SQLERRM);
    END adicionarPersonal;
    
    PROCEDURE modificarPersonal(xCedula VARCHAR, xDireccion VARCHAR, 
    xTelefono VARCHAR, xCorreo VARCHAR, xEstado VARCHAR) IS
    BEGIN
    UPDATE Personal SET Direccion=xDireccion, Telefono = xTelefono, 
    Correo = xCorreo, Estado = xEstado WHERE Cedula = xCedula;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20083, SQLERRM);
    END modificarPersonal;
    
    PROCEDURE eliminarPersonal(xCedula VARCHAR) IS
    BEGIN
        DELETE FROM Personal WHERE (Cedula = xCedula);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20082, SQLERRM);
    END eliminarPersonal;
    
    PROCEDURE ConsultarPersonal(Cedula OUT SYS_REFCURSOR) IS
    BEGIN
        Open Cedula FOR SELECT * FROM Personal;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20081, SQLERRM);
    END ConsultarPersonal;
    
    PROCEDURE adicionarEnfermedad(Gravedad VARCHAR, Descripcion VARCHAR) IS
    BEGIN
    INSERT INTO Enfermedades VALUES(NULL, Gravedad, Descripcion);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20076, SQLERRM);
    END adicionarEnfermedad;
    
    PROCEDURE adicionarLaboral(CedulaPersonal VARCHAR, Ocupacion VARCHAR, Cargo VARCHAR) IS
    BEGIN
    INSERT INTO Laborales VALUES(CedulaPersonal, Ocupacion, Cargo);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20077, SQLERRM);
    END adicionarLaboral;
    
    PROCEDURE adicionarEventual(CedulaPersonal VARCHAR, Funcion VARCHAR, AreaAsignada VARCHAR) IS
    BEGIN
    INSERT INTO Eventuales VALUES(CedulaPersonal, Funcion, AreaAsignada);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20078, SQLERRM);
    END adicionarEventual;
    
    PROCEDURE adicionarInterino(CedulaPersonal VARCHAR, Suple_Titular VARCHAR, 
    TrabajoAsignado VARCHAR) IS
    BEGIN
    INSERT INTO Interinos VALUES(CedulaPersonal, Suple_Titular, TrabajoAsignado);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20079, SQLERRM);
    END adicionarInterino;
    
    PROCEDURE adicionarHospitales(Nombre_Hospital VARCHAR, Ubicacion VARCHAR,
    Tiempo_Hospitalizado VARCHAR, Tratamiento VARCHAR) IS
    BEGIN
    INSERT INTO Hospitales VALUES(Nombre_Hospital, Ubicacion, Tiempo_Hospitalizado, 
    Tratamiento);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20080, SQLERRM);
    END adicionarHospitales;
    
END PK_PERSONAL;
/
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE PK_ACCIDENTES
IS
    PROCEDURE adicionarAccidente(FechaReporte DATE, Jornada VARCHAR,
    Indemnizacion INT, IdSede NUMBER, IdObjeto NUMBER,IdMecanismo NUMBER,
    Cedula_Persona VARCHAR, DiasIncapacidad INT);
    
    PROCEDURE consultarAccidente(IdAccidente OUT SYS_REFCURSOR);
    
    PROCEDURE adicionarMecanismo(Descripcion VARCHAR);
    
    PROCEDURE adicionarLesion(Descripcion VARCHAR, Grado VARCHAR);
    
    PROCEDURE adicionarAfecta(IdAccidente NUMBER, IdParte Number);
    
    PROCEDURE adicionarParte(Descripcion VARCHAR);
    
    PROCEDURE adicionarObjeto(Descripcion VARCHAR, PotencialRiesgo VARCHAR);
    
    PROCEDURE adicionarAccidenteLesiones(IdAccidente NUMBER, IdLesion Number);
    
END;
/
CREATE OR REPLACE PACKAGE BODY PK_ACCIDENTES
IS
    PROCEDURE adicionarAccidente(FechaReporte DATE, Jornada VARCHAR,
    Indemnizacion INT, IdSede NUMBER, IdObjeto NUMBER,IdMecanismo NUMBER,
    Cedula_Persona VARCHAR, DiasIncapacidad INT) IS
    BEGIN
    INSERT INTO Accidentes VALUES(NULL, FechaReporte, Jornada,
    Indemnizacion, IdSede, IdObjeto,IdMecanismo, Cedula_Persona,DiasIncapacidad);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20096, SQLERRM);
    END adicionarAccidente;
    
  
    
    PROCEDURE consultarAccidente(IdAccidente OUT SYS_REFCURSOR) IS
    BEGIN
        Open IdAccidente FOR SELECT * FROM Accidentes;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20097, SQLERRM);
    END consultarAccidente;
    
    PROCEDURE adicionarMecanismo(Descripcion VARCHAR) IS
    BEGIN
    INSERT INTO Mecanismo VALUES(NULL, Descripcion);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20103, SQLERRM);
    END adicionarMecanismo;
    
    PROCEDURE adicionarLesion(Descripcion VARCHAR, Grado VARCHAR) IS
    BEGIN
    INSERT INTO Lesiones VALUES(NULL, Descripcion, Grado);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20098, SQLERRM);
    END adicionarLesion;
    
    PROCEDURE adicionarAfecta(IdAccidente NUMBER, IdParte Number) IS
    BEGIN
    INSERT INTO Afecta VALUES(IdAccidente, IdParte);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20099, SQLERRM);
    END adicionarAfecta;
    
    PROCEDURE adicionarParte(Descripcion VARCHAR) IS
    BEGIN
    INSERT INTO Partes VALUES(NULL, Descripcion);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20100, SQLERRM);
    END adicionarParte;
    
    PROCEDURE adicionarObjeto(Descripcion VARCHAR, PotencialRiesgo VARCHAR) IS
    BEGIN
    INSERT INTO ObjetoLesion VALUES(NULL, Descripcion, PotencialRiesgo);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20101, SQLERRM);
    END adicionarObjeto;
    
    PROCEDURE adicionarAccidenteLesiones(IdAccidente NUMBER, IdLesion Number) IS
    BEGIN
    INSERT INTO AccidenteLesiones VALUES(IdAccidente, IdLesion);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20102, SQLERRM);
    END adicionarAccidenteLesiones;
 
END PK_ACCIDENTES;
/
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE PK_INVESTIGACIONDETALLE
IS
    PROCEDURE adicionarInvestigacion(FechaInvestigacion DATE, CedulaResponsable VARCHAR,
    idAccidente NUMBER);
    
    PROCEDURE modificarInvestigacion(xIdInvestigacion NUMBER, xCedulaResponsable VARCHAR);
    
    PROCEDURE consultarInvestigacion(IdInvestigacion OUT SYS_REFCURSOR);
    
    PROCEDURE adicionarVersiones(FechaVersion DATE, Version VARCHAR, Id_Investigacion NUMBER);
    
    PROCEDURE adicionarCausas(Causa VARCHAR);
    
    PROCEDURE adicionarControles(Control VARCHAR, EstadoControl VARCHAR,
    Id_Investigacion NUMBER);
    
    PROCEDURE adicionarInvestigacionCausa(IdInvestigacion NUMBER, Id_Causa NUMBER);
    
    PROCEDURE modificarControles(xId_Control NUMBER, xEstadoControl VARCHAR);
    
END;
/
CREATE OR REPLACE PACKAGE BODY PK_INVESTIGACIONDETALLE
IS
    PROCEDURE adicionarInvestigacion(FechaInvestigacion DATE, CedulaResponsable VARCHAR,
    idAccidente NUMBER) IS
    BEGIN
    INSERT INTO InvestigacionDetalle VALUES(NULL, FechaInvestigacion, CedulaResponsable,
    idAccidente);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20105, SQLERRM);
    END adicionarInvestigacion;
    
    PROCEDURE modificarInvestigacion(xIdInvestigacion NUMBER, xCedulaResponsable VARCHAR) IS
    BEGIN
    UPDATE InvestigacionDetalle SET CedulaResponsable = xCedulaResponsable 
    WHERE IdInvestigacion=xIdInvestigacion;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20106, SQLERRM);
    END modificarInvestigacion;
    
    PROCEDURE consultarInvestigacion(IdInvestigacion OUT SYS_REFCURSOR) IS
    BEGIN
        Open IdInvestigacion FOR SELECT * FROM InvestigacionDetalle;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20107, SQLERRM);
    END consultarInvestigacion;
    
    PROCEDURE adicionarVersiones(FechaVersion DATE, Version VARCHAR,
    Id_Investigacion NUMBER) IS
    BEGIN
    INSERT INTO Versiones_Accidentes VALUES(NULL, FechaVersion, Version, Id_Investigacion);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20108, SQLERRM);
    END adicionarVersiones;
    
    PROCEDURE adicionarCausas(Causa VARCHAR) IS
    BEGIN
    INSERT INTO Causas VALUES(NULL, Causa);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20109, SQLERRM);
    END adicionarCausas;
    
    PROCEDURE adicionarControles(Control VARCHAR, EstadoControl VARCHAR,
    Id_Investigacion NUMBER) IS
    BEGIN
    INSERT INTO Controles VALUES(NULL, Control, EstadoControl, Id_Investigacion);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20120, SQLERRM);
    END adicionarControles;
    
    PROCEDURE adicionarInvestigacionCausa(IdInvestigacion NUMBER, Id_Causa NUMBER) IS
    BEGIN
    INSERT INTO InvestigacionCausa VALUES(IdInvestigacion, Id_Causa);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20121, SQLERRM);
    END adicionarInvestigacionCausa;
    
    PROCEDURE modificarControles(xId_Control NUMBER, xEstadoControl VARCHAR) IS
    BEGIN
    UPDATE Controles SET EstadoControl = xEstadoControl WHERE Id_Control = xId_Control;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20122, SQLERRM);
    END modificarControles;
    
END PK_INVESTIGACIONDETALLE;
/
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE PK_SEDE
IS
    PROCEDURE adicionarSede(NombreSede VARCHAR);
    
    PROCEDURE modificarSede(xIdSede NUMBER, xNombreSede VARCHAR);
    
    PROCEDURE eliminarSede(xIdSede VARCHAR);
    
    PROCEDURE consultarSede(IdSede OUT SYS_REFCURSOR);
    
    PROCEDURE adicionarLugar(IdSede NUMBER, Descripcion VARCHAR);
    
    PROCEDURE consultarLugar(Id OUT SYS_REFCURSOR);
    
END;
/
CREATE OR REPLACE PACKAGE BODY PK_SEDE
IS
    PROCEDURE adicionarSede(NombreSede VARCHAR) IS
    BEGIN
    INSERT INTO Sedes VALUES(NULL, NombreSede);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20090, SQLERRM);
    END adicionarSede;
    
    PROCEDURE modificarSede(xIdSede NUMBER, xNombreSede VARCHAR) IS
    BEGIN
    UPDATE Sedes SET NombreSede = xNombreSede WHERE IdSede=xIdSede;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20091, SQLERRM);
    END modificarSede;
    
    PROCEDURE eliminarSede(xIdSede VARCHAR) IS
    BEGIN
        DELETE FROM Sedes WHERE (IdSede = xIdSede);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20092, SQLERRM);
    END eliminarSede;
    
    PROCEDURE consultarSede(IdSede OUT SYS_REFCURSOR) IS
    BEGIN
        Open IdSede FOR SELECT * FROM Sedes;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20093, SQLERRM);
    END consultarSede;
    
    PROCEDURE adicionarLugar(IdSede NUMBER, Descripcion VARCHAR) IS
    BEGIN
    INSERT INTO Lugares VALUES(NULL, IdSede, Descripcion);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20094, SQLERRM);
    END adicionarLugar;
    
   PROCEDURE consultarLugar(Id OUT SYS_REFCURSOR) IS
    BEGIN
        Open Id FOR SELECT * FROM Lugares;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20095, SQLERRM);
    END consultarLugar;
    
END PK_SEDE;
/
--------------------------------------------------------------------------------
--xCRUD
DROP PACKAGE PK_PERSONAL;
DROP PACKAGE PK_ACCIDENTES;
DROP PACKAGE PK_INVESTIGACIONDETALLE;
DROP PACKAGE PK_SEDE;
--------------------------------------------------------------------------------
--Seguridad

-- PK_GESTORDERIESGOS
-- Cabeza PK_GESTORDERIESGOS
CREATE OR REPLACE PACKAGE PK_GESTORDERIESGOS AS
-- Consulta el personal que más se ha accidentado
    PROCEDURE ConsultarPersonalMas(IdMAccidente OUT SYS_REFCURSOR);    
-- Consulta el objeto que genera más lesiones
    PROCEDURE ConsultarObjetoLesion(IdObjeto OUT SYS_REFCURSOR);   
-- Consulta causas más comunes de accidentes
    PROCEDURE ConsultarCausas(IdCausas OUT SYS_REFCURSOR); 
-- Consulta enfermedades más comunes
    PROCEDURE ConsultarEnfermedadesComunes(IdEnfermedades OUT SYS_REFCURSOR);     
-- Consulta Accidentes
    PROCEDURE consultarAccidente(IdAccidente OUT SYS_REFCURSOR);  
 -- Registra Accidentes
    PROCEDURE RegistraAccidentes(Jornada VARCHAR, Indemnizacion INT, idsede NUMBER,idObjeto NUMBER, idMecanismo NUMBER, Cedula_Persona VARCHAR,DiasIncapacidad INT);
END;
/
-- Cuerpo PK_GESTORDERIESGOS

CREATE OR REPLACE PACKAGE BODY PK_GESTORDERIESGOS AS

-- Consulta el personal que más se ha accidentado
    PROCEDURE ConsultarPersonalMas(IdMAccidente OUT SYS_REFCURSOR) IS
    BEGIN
        Open IdMAccidente FOR  SELECT P.Nombres, P.Apellidos, count(*)
                                    FROM Personal P
                                    JOIN Accidentes A ON P.Cedula = A.Cedula_Persona
                                    GROUP BY(Nombres, Apellidos);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20093, SQLERRM);
    END ConsultarPersonalMas;
    
-- Consulta el objeto que genera más lesiones 
    PROCEDURE ConsultarObjetoLesion(IdObjeto OUT SYS_REFCURSOR) IS
    BEGIN
        Open IdObjeto FOR  SELECT OL.descripcion, count(*)
                            FROM Accidentes A 
                            JOIN ObjetoLesion OL ON A.IdObjeto = OL.Id
                            GROUP BY(OL.descripcion);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20093, SQLERRM);
    END ConsultarObjetoLesion;
-- Consulta causas más comunes de accidentes
    PROCEDURE ConsultarCausas(IdCausas OUT SYS_REFCURSOR) IS
    BEGIN
        Open IdCausas FOR  SELECT C.causa, count(*)
                            FROM investigaciondetalle ID
                            JOIN investigacioncausa IC ON ID.IdInvestigacion  = IC.IdInvestigacion 
                            JOIN Causas C ON C.Id_Causa = IC.Id_Causa
                            GROUP BY(C.causa);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20093, SQLERRM);
    END ConsultarCausas;

-- Consulta enfermedades más comunes
    PROCEDURE ConsultarEnfermedadesComunes(IdEnfermedades OUT SYS_REFCURSOR) IS
    BEGIN
        Open IdEnfermedades FOR SELECT E.Descripcion, count(*) 
                                FROM Personal P 
                                JOIN personalenfermedad  PE ON P.Cedula = PE.Cedula
                                JOIN Enfermedades E ON PE.idEnfermedad = E.idEnfermedad 
                                GROUP BY(E.Descripcion);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20093, SQLERRM);
    END ConsultarEnfermedadesComunes;
    
-- Consulta Accidentes
    PROCEDURE consultarAccidente(IdAccidente OUT SYS_REFCURSOR) IS
    BEGIN
        Open IdAccidente FOR SELECT * FROM Accidentes;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20093, SQLERRM);
    END consultarAccidente;
    
-- Registra Accidentes
    PROCEDURE RegistraAccidentes(Jornada VARCHAR, Indemnizacion INT, idsede NUMBER,idObjeto NUMBER, idMecanismo NUMBER, Cedula_Persona VARCHAR,DiasIncapacidad INT) IS
        BEGIN
        INSERT INTO Accidentes VALUES(NULL,NULL,Jornada,  Indemnizacion,idsede,idObjeto, idMecanismo, Cedula_Persona,DiasIncapacidad);
    END RegistraAccidentes;
END PK_GESTORDERIESGOS;
/    
    


-- PK_JEFEEMPRESA
-- Cabeza PK_JEFEEMPRESA
CREATE OR REPLACE PACKAGE PK_JEFEEMPRESA AS
-- Consulta cuánto dinero se ha gastado en indemnizaciones
    PROCEDURE ConsultarDinero(IdDinero OUT SYS_REFCURSOR);  
-- Consulta cantidad de personal incapacitada
    PROCEDURE ConsultarIncapacidades(IdPersonal OUT SYS_REFCURSOR); 
-- Consulta sedes en las que han ocurrido mayor cantidad de accidentes
    PROCEDURE ConsultarSedes(IdSedes OUT SYS_REFCURSOR); 
END;
/
-- Cuerpo PK_JEFEEMPRESA

CREATE OR REPLACE PACKAGE BODY PK_JEFEEMPRESA AS
-- Consulta cuánto dinero se ha gastado en indemnizaciones
    PROCEDURE ConsultarDinero(IdDinero OUT SYS_REFCURSOR) IS
        BEGIN
            Open IdDinero FOR SELECT SUM(Indemnizacion)
                            FROM Accidentes;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20093, SQLERRM);
    END ConsultarDinero; 
    
-- Consulta cantidad de personal incapacitada
    PROCEDURE ConsultarIncapacidades(IdPersonal OUT SYS_REFCURSOR) IS
        BEGIN
            Open IdPersonal FOR SELECT Nombres, Apellidos
                            FROM Personal
                            WHERE Estado  = 'Incapacitado';
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20093, SQLERRM);
    END ConsultarIncapacidades; 
    
-- Consulta sedes en las que han ocurrido mayor cantidad de accidentes
    PROCEDURE ConsultarSedes(IdSedes OUT SYS_REFCURSOR)  IS
        BEGIN
            Open IdSedes FOR  SELECT S.NombreSede, count(*)
                        FROM Accidentes A
                        JOIN Sedes S ON A.IdSede = S.IdSede
                        GROUP BY (S.NombreSede);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Raise_application_error(-20093, SQLERRM);
    END ConsultarSedes; 
END PK_JEFEEMPRESA;
/
--xSeguridad      
DROP PACKAGE PK_GESTORDERIESGOS;
DROP PACKAGE PK_JEFEEMPRESA;

