CREATE TABLE Cita (
  id_cita NUMBER PRIMARY KEY,
  fecha DATE,
  hora VARCHAR2(5),
  id_doctor NUMBER,
  id_paciente NUMBER,
  FOREIGN KEY (id_doctor) REFERENCES Doctor(id_doctor),
  FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);
CREATE TABLE Doctor (
  id_doctor NUMBER PRIMARY KEY,
  nombre VARCHAR2(100),
  especialidad VARCHAR2(100),
  id_usuario NUMBER,
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);
CREATE TABLE Paciente (
  id_paciente NUMBER PRIMARY KEY,
  nombre VARCHAR2(100),
  fecha_nacimiento DATE,
  id_seguro NUMBER,
  FOREIGN KEY (id_seguro) REFERENCES Seguro(id_seguro)
);
CREATE TABLE Seguro (
  id_seguro NUMBER PRIMARY KEY,
  nombre_seguro VARCHAR2(100),
  tipo_cobertura VARCHAR2(50)
);
CREATE TABLE Usuario (
  id_usuario NUMBER PRIMARY KEY,
  nombre_usuario VARCHAR2(50),
  contrase�a VARCHAR2(100),
  id_rol NUMBER,
  FOREIGN KEY (id_rol) REFERENCES Rol(id_rol)
);
CREATE TABLE Tratamiento (
  id_tratamiento NUMBER PRIMARY KEY,
  nombre_tratamiento VARCHAR2(100),
  costo NUMBER
);
CREATE TABLE Pago (
  id_pago NUMBER PRIMARY KEY,
  id_factura NUMBER,
  fecha_pago DATE,
  monto NUMBER,
  FOREIGN KEY (id_factura) REFERENCES Factura(id_factura)
);
CREATE TABLE Factura (
  id_factura NUMBER PRIMARY KEY,
  id_cita NUMBER,
  fecha_emision DATE,
  total NUMBER,
  FOREIGN KEY (id_cita) REFERENCES Cita(id_cita)
);
CREATE TABLE Reclamo (
  id_reclamo NUMBER PRIMARY KEY,
  id_paciente NUMBER,
  descripcion VARCHAR2(500),
  fecha DATE,
  FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);
CREATE TABLE Registro (
  id_registro NUMBER PRIMARY KEY,
  id_paciente NUMBER,
  fecha_registro DATE,
  observaciones VARCHAR2(500),
  FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);
CREATE TABLE Estad�sticas (
  id_estadistica NUMBER PRIMARY KEY,
  id_doctor NUMBER,
  id_tratamiento NUMBER,
  fecha DATE,
  cantidad_realizada NUMBER,
  FOREIGN KEY (id_doctor) REFERENCES Doctor(id_doctor),
  FOREIGN KEY (id_tratamiento) REFERENCES Tratamiento(id_tratamiento)
);
CREATE TABLE Rol (
  id_rol NUMBER PRIMARY KEY,
  nombre_rol VARCHAR2(50)
);
CREATE TABLE Reembolso (
  id_reembolso NUMBER PRIMARY KEY,
  id_seguro NUMBER,
  id_factura NUMBER,
  monto NUMBER,
  FOREIGN KEY (id_seguro) REFERENCES Seguro(id_seguro),
  FOREIGN KEY (id_factura) REFERENCES Factura(id_factura)
);
CREATE TABLE Inventario (
  id_inventario NUMBER PRIMARY KEY,
  nombre_producto VARCHAR2(100),
  cantidad_disponible NUMBER,
  costo_unitario NUMBER
);

INSERT INTO Seguro (id_seguro, nombre_seguro, tipo_cobertura)
VALUES (1, 'Seguro A', 'Cobertura completa');
INSERT INTO Seguro (id_seguro, nombre_seguro, tipo_cobertura)
VALUES (2, 'Seguro B', 'Cobertura parcial');
INSERT INTO Seguro (id_seguro, nombre_seguro, tipo_cobertura)
VALUES (3, 'Seguro C', 'Cobertura b�sica');

INSERT INTO Rol (id_rol, nombre_rol)
VALUES (1, 'Administrador');
INSERT INTO Rol (id_rol, nombre_rol)
VALUES (2, 'M�dico');
INSERT INTO Rol (id_rol, nombre_rol)
VALUES (3, 'Paciente');

INSERT INTO Doctor (id_doctor, nombre, especialidad, id_usuario)
VALUES (1, 'Dr. Juan P�rez', 'Odontolog�a', 1);
INSERT INTO Doctor (id_doctor, nombre, especialidad, id_usuario)
VALUES (2, 'Dra. Mar�a G�mez', 'Ortodoncia', 2);
INSERT INTO Doctor (id_doctor, nombre, especialidad, id_usuario)
VALUES (3, 'Dr. Carlos Rodr�guez', 'Endodoncia', 3);

INSERT INTO Usuario (id_usuario, nombre_usuario, contrase�a, id_rol)
VALUES (1, 'admin', 'admin123', 1);
INSERT INTO Usuario (id_usuario, nombre_usuario, contrase�a, id_rol)
VALUES (2, 'medico1', 'pass123', 2);
INSERT INTO Usuario (id_usuario, nombre_usuario, contrase�a, id_rol)
VALUES (3, 'paciente1', 'user123', 3);

INSERT INTO Paciente (id_paciente, nombre, fecha_nacimiento, id_seguro)
VALUES (1, 'Ana Mart�nez', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 1);
INSERT INTO Paciente (id_paciente, nombre, fecha_nacimiento, id_seguro)
VALUES (2, 'Pedro G�mez', TO_DATE('1985-10-22', 'YYYY-MM-DD'), 2);
INSERT INTO Paciente (id_paciente, nombre, fecha_nacimiento, id_seguro)
VALUES (3, 'Mar�a L�pez', TO_DATE('1998-02-28', 'YYYY-MM-DD'), 3);

INSERT INTO Cita (id_cita, fecha, hora, id_doctor, id_paciente)
VALUES (1, TO_DATE('2023-07-20', 'YYYY-MM-DD'), '09:00', 1, 1);
INSERT INTO Cita (id_cita, fecha, hora, id_doctor, id_paciente)
VALUES (2, TO_DATE('2023-07-21', 'YYYY-MM-DD'), '10:30', 2, 2);
INSERT INTO Cita (id_cita, fecha, hora, id_doctor, id_paciente)
VALUES (3, TO_DATE('2023-07-22', 'YYYY-MM-DD'), '14:00', 3, 3);

INSERT INTO Tratamiento (id_tratamiento, nombre_tratamiento, costo)
VALUES (1, 'Limpieza dental', 100);
INSERT INTO Tratamiento (id_tratamiento, nombre_tratamiento, costo)
VALUES (2, 'Extracci�n de muela', 200);
INSERT INTO Tratamiento (id_tratamiento, nombre_tratamiento, costo)
VALUES (3, 'Ortodoncia', 500);

INSERT INTO Factura (id_factura, id_cita, fecha_emision, total)
VALUES (1, 1, TO_DATE('2023-07-20', 'YYYY-MM-DD'), 100);
INSERT INTO Factura (id_factura, id_cita, fecha_emision, total)
VALUES (2, 2, TO_DATE('2023-07-21', 'YYYY-MM-DD'), 200);
INSERT INTO Factura (id_factura, id_cita, fecha_emision, total)
VALUES (3, 3, TO_DATE('2023-07-22', 'YYYY-MM-DD'), 500);

INSERT INTO Pago (id_pago, id_factura, fecha_pago, monto)
VALUES (1, 1, TO_DATE('2023-07-21', 'YYYY-MM-DD'), 100);
INSERT INTO Pago (id_pago, id_factura, fecha_pago, monto)
VALUES (2, 2, TO_DATE('2023-07-22', 'YYYY-MM-DD'), 200);
INSERT INTO Pago (id_pago, id_factura, fecha_pago, monto)
VALUES (3, 3, TO_DATE('2023-07-23', 'YYYY-MM-DD'), 500);

INSERT INTO Reclamo (id_reclamo, id_paciente, descripcion, fecha)
VALUES (1, 1, 'No estoy satisfecha con el tratamiento recibido.', TO_DATE('2023-07-24', 'YYYY-MM-DD'));
INSERT INTO Reclamo (id_reclamo, id_paciente, descripcion, fecha)
VALUES (2, 2, 'Me han cobrado de m�s en mi �ltima factura.', TO_DATE('2023-07-25', 'YYYY-MM-DD'));
INSERT INTO Reclamo (id_reclamo, id_paciente, descripcion, fecha)
VALUES (3, 3, 'He tenido problemas con el seguro m�dico.', TO_DATE('2023-07-26', 'YYYY-MM-DD'));

INSERT INTO Registro (id_registro, id_paciente, fecha_registro, observaciones)
VALUES (1, 1, TO_DATE('2023-07-20', 'YYYY-MM-DD'), 'Limpieza dental realizada.');
INSERT INTO Registro (id_registro, id_paciente, fecha_registro, observaciones)
VALUES (2, 2, TO_DATE('2023-07-21', 'YYYY-MM-DD'), 'Extracci�n de muela realizada.');
INSERT INTO Registro (id_registro, id_paciente, fecha_registro, observaciones)
VALUES (3, 3, TO_DATE('2023-07-22', 'YYYY-MM-DD'), 'Ortodoncia en proceso.');

INSERT INTO Estad�sticas (id_estadistica, id_doctor, id_tratamiento, fecha, cantidad_realizada)
VALUES (1, 1, 1, TO_DATE('2023-07-20', 'YYYY-MM-DD'), 5);
INSERT INTO Estad�sticas (id_estadistica, id_doctor, id_tratamiento, fecha, cantidad_realizada)
VALUES (2, 2, 2, TO_DATE('2023-07-21', 'YYYY-MM-DD'), 3);
INSERT INTO Estad�sticas (id_estadistica, id_doctor, id_tratamiento, fecha, cantidad_realizada)
VALUES (3, 3, 3, TO_DATE('2023-07-22', 'YYYY-MM-DD'), 2);

INSERT INTO Reembolso (id_reembolso, id_seguro, id_factura, monto)
VALUES (1, 1, 1, 50);
INSERT INTO Reembolso (id_reembolso, id_seguro, id_factura, monto)
VALUES (2, 2, 2, 100);
INSERT INTO Reembolso (id_reembolso, id_seguro, id_factura, monto)
VALUES (3, 3, 3, 250);

INSERT INTO Inventario (id_inventario, nombre_producto, cantidad_disponible, costo_unitario)
VALUES (1, 'Cepillo dental', 100, 2);
INSERT INTO Inventario (id_inventario, nombre_producto, cantidad_disponible, costo_unitario)
VALUES (2, 'Pasta dental', 50, 3);
INSERT INTO Inventario (id_inventario, nombre_producto, cantidad_disponible, costo_unitario)
VALUES (3, 'Hilo dental', 80, 1);

CREATE OR REPLACE PROCEDURE CrearCita(
    p_id_cita IN NUMBER,
    p_fecha IN DATE,
    p_hora IN VARCHAR2,
    p_id_doctor IN NUMBER,
    p_id_paciente IN NUMBER
) AS
BEGIN
    INSERT INTO Cita (id_cita, fecha, hora, id_doctor, id_paciente)
    VALUES (p_id_cita, p_fecha, p_hora, p_id_doctor, p_id_paciente);
END;

CREATE OR REPLACE PROCEDURE LeerCita(
    p_id_cita IN NUMBER,
    p_fecha OUT DATE,
    p_hora OUT VARCHAR2,
    p_id_doctor OUT NUMBER,
    p_id_paciente OUT NUMBER
) AS
BEGIN
    SELECT fecha, hora, id_doctor, id_paciente
    INTO p_fecha, p_hora, p_id_doctor, p_id_paciente
    FROM Cita
    WHERE id_cita = p_id_cita;
END;

CREATE OR REPLACE PROCEDURE ActualizarCita(
    p_id_cita IN NUMBER,
    p_fecha IN DATE,
    p_hora IN VARCHAR2,
    p_id_doctor IN NUMBER,
    p_id_paciente IN NUMBER
) AS
BEGIN
    UPDATE Cita
    SET fecha = p_fecha, hora = p_hora, id_doctor = p_id_doctor, id_paciente = p_id_paciente
    WHERE id_cita = p_id_cita;
END;

CREATE OR REPLACE PROCEDURE EliminarCita(
    p_id_cita IN NUMBER
) AS
BEGIN
    DELETE FROM Cita
    WHERE id_cita = p_id_cita;
END;

CREATE OR REPLACE PROCEDURE CrearDoctor(
    p_id_doctor IN NUMBER,
    p_nombre IN VARCHAR2,
    p_especialidad IN VARCHAR2,
    p_id_usuario IN NUMBER
) AS
BEGIN
    INSERT INTO Doctor (id_doctor, nombre, especialidad, id_usuario)
    VALUES (p_id_doctor, p_nombre, p_especialidad, p_id_usuario);
END;

CREATE OR REPLACE PROCEDURE LeerDoctor(
    p_id_doctor IN NUMBER,
    p_nombre OUT VARCHAR2,
    p_especialidad OUT VARCHAR2,
    p_id_usuario OUT NUMBER
) AS
BEGIN
    SELECT nombre, especialidad, id_usuario
    INTO p_nombre, p_especialidad, p_id_usuario
    FROM Doctor
    WHERE id_doctor = p_id_doctor;
END;

CREATE OR REPLACE PROCEDURE ActualizarDoctor(
    p_id_doctor IN NUMBER,
    p_nombre IN VARCHAR2,
    p_especialidad IN VARCHAR2,
    p_id_usuario IN NUMBER
) AS
BEGIN
    UPDATE Doctor
    SET nombre = p_nombre, especialidad = p_especialidad, id_usuario = p_id_usuario
    WHERE id_doctor = p_id_doctor;
END;

CREATE OR REPLACE PROCEDURE EliminarDoctor(
    p_id_doctor IN NUMBER
) AS
BEGIN
    DELETE FROM Doctor
    WHERE id_doctor = p_id_doctor;
END;




