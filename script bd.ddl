-- Generado por Oracle SQL Developer Data Modeler 19.1.0.081.0911
--   en:        2019-05-29 20:56:33 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE producto (
    id_producto      INTEGER NOT NULL,
    nombre           VARCHAR2(30) NOT NULL,
    descripcion      VARCHAR2(200) NOT NULL,
    stock            INTEGER NOT NULL,
    precio           INTEGER NOT NULL,
    imagen           BLOB,
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id_producto );

CREATE TABLE solicitud (
    id_solicitud     INTEGER NOT NULL,
    tipo_solicitud   VARCHAR2(20) NOT NULL,
    fecha            VARCHAR2(20) NOT NULL,
    hora             VARCHAR2(20) NOT NULL,
    problema         VARCHAR2(200) NOT NULL,
    estado           VARCHAR2(20) NOT NULL,
    nombre_usuario   VARCHAR2(30) NOT NULL,
    usuario          VARCHAR2(20)
);

ALTER TABLE solicitud ADD CONSTRAINT solicitud_pk PRIMARY KEY ( id_solicitud );

CREATE TABLE tecnico (
    usuario            VARCHAR2(30) NOT NULL,
    contrasena         VARCHAR2(30) NOT NULL,
    rut                VARCHAR2(20) NOT NULL,
    nombre_completo    VARCHAR2(100) NOT NULL,
    fecha_nacimiento   VARCHAR2(20) NOT NULL,
    telefono           VARCHAR2(30) NOT NULL,
    correo             VARCHAR2(100) NOT NULL,
    rol		       VARCHAR2(30) NOT NULL
);

ALTER TABLE tecnico ADD CONSTRAINT tecnico_pk PRIMARY KEY ( usuario );

CREATE TABLE usuario (
    nombre_usuario       VARCHAR2(30) NOT NULL,
    contrasena           VARCHAR2(30) NOT NULL,
    nombre_completo      VARCHAR2(150) NOT NULL,
    fecha_nacimiento     VARCHAR2(15) NOT NULL,
    telefono             VARCHAR2(20) NOT NULL,
    sexo                 VARCHAR2(15) NOT NULL,
    correo_electronico   VARCHAR2(200) NOT NULL,
    rol                  VARCHAR2(20) NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( nombre_usuario );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_tecnico_fk FOREIGN KEY ( usuario )
        REFERENCES tecnico ( usuario );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_usuario_fk FOREIGN KEY ( nombre_usuario )
        REFERENCES usuario ( nombre_usuario );

CREATE SEQUENCE SEQ_SOLICITUD
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1;

CREATE SEQUENCE SEQ_PRODUCTO
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1;

--PROCEDIMIENTOS
create or replace procedure sp_agregar_solicitud(tipo_solicitud varchar2, fecha varchar2, hora varchar2, problema varchar2, estado varchar2, nombre_usuario varchar2)
is
begin
insert into SOLICITUD values(SEQ_SOLICITUD.nextval,tipo_solicitud, fecha, hora, problema, estado, nombre_usuario,null);
end;


create or replace procedure sp_agregar_usuario(nombre_usuario varchar2, contrasena varchar2, nombre_completo varchar2, fecha_nacimiento varchar2, telefono varchar2, sexo varchar2, correo_electronico varchar2, rol varchar2)
is
begin
insert into USUARIO values(nombre_usuario, contrasena, nombre_completo, fecha_nacimiento, telefono, sexo, correo_electronico, rol);
end;

create or replace procedure sp_listar_historial_user(usuario in varchar2,solicitudes out SYS_REFCURSOR) is
begin
    open solicitudes for select * from SOLICITUD WHERE nombre_usuario=usuario;
end;

create or replace procedure sp_agregar_producto(nombre varchar2, descripcion varchar2, stock INTEGER, precio INTEGER, imagen blob)
is
begin
insert into PRODUCTO values(SEQ_PRODUCTO.nextval,nombre, descripcion,stock,precio,imagen);
end;