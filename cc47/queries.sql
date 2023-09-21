-- DDL: definir las estructuras (metada)
-- create: crear
-- alter: modificar
-- drop: eliminar

create database rappiupc
go

use rappiupc
go

create table repartidores (
    codigo int not null,
    nombre varchar(100) not null,
    apellido_paterno varchar(100) not null,
    apellido_materno varchar(100) not null,
    constraint pk_repartidores primary key (codigo)
)
go

create table pedidos (
    codigo int not null,
    fecha date not null,
    codigo_usuario int not null,
    estado varchar(20) not null,
    codigo_repartidor int not null,
    constraint pk_pedidos primary key (codigo)
)
go

alter table pedidos
add constraint fk_repartidor_pedidos
    foreign key (codigo_repartidor)
    references repartidores (codigo)
go

create table usuarios (
    codigo int not null,
    nombre varchar(100) not null,
    apellido_paterno varchar(100) not null,
    apellido_materno varchar(100) not null,
    correo_electronico varchar(50) not null,
    telefono varchar(20) not null,
    fecha_nacimiento date not null,
    constraint pk_usuarios primary key (codigo)
)
go

alter table repartidores
drop column nombre
go

-- dml: manipular datos
-- insert: registrar filas
-- update: modificar filas
-- delete: eliminar filas
-- select: recuperar filas

insert into repartidores (codigo, apellido_paterno, apellido_materno)
    values (1, 'Fuentes', 'Diaz')
go

select codigo, apellido_paterno from repartidores
go

update repartidores
set apellido_paterno = 'Castillo'
where codigo = 1
go

select codigo, apellido_paterno from repartidores
go

-- dml
-- insert
-- update
-- delete
-- select
