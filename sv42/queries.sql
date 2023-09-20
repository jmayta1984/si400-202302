-- ddl
-- create
-- alter
-- drop

create database pc1
go

use pc1
go

create table patrocinadores (
    codigo int not null,
    nombre varchar(100) not null,
    apellido_paterno varchar(100) not null,
    apellido_materno varchar(100) not null,
    constraint pk_patrocinadores primary key (codigo)
)
go

create table eventos (
    codigo int not null,
    nombre varchar(100) not null,
    descripcion varchar(max) not null,
    fecha date not null,
    codigo_local int not null,
    precio_entrada money,
    constraint pk_eventos primary key (codigo)
)
go

create table locales (
    codigo int not null,
    nombre varchar(100) not null,
    capacidad int not null,
    direccion varchar(255),
    constraint pk_locales primary key (codigo)
)
go

alter table eventos
add constraint fk_locales_eventos foreign key (codigo_local) references locales (codigo)
go

create table temas (
    codigo int not null,
    nombre varchar(100) not null,
    constraint pk_temas primary key (codigo)
)
go

create table temas_eventos (
    codigo_tema int not null,
    codigo_evento int not null,
    constraint fk_temas_temas_eventos foreign key (codigo_tema) references temas (codigo),
    constraint fk_eventos_temas_eventos foreign key (codigo_evento) references eventos (codigo),
    constraint pk_temas_eventos primary key (codigo_tema, codigo_evento)
)
go



-- dml:
-- insert
-- update
-- delete

insert into temas (codigo, nombre) values (1, 'IA en la educación')
go

-- select
select codigo, nombre from temas
go


    
insert into locales (codigo, nombre, capacidad, direccion)
    values (1, 'Club Árabe', 100, 'Av. Primavera 2550')
go

insert into locales (codigo, nombre, capacidad, direccion)
    values (2, 'Club La Fontana', 100, 'Av. La Fontana 2660')
go

insert into locales (codigo, nombre, capacidad, direccion)
    values (3, 'Club Tacna', 50, 'Av. Tacna 2550')
go

select * from locales
where capacidad > 50
go

create table oradores (
    codigo int not null identity (1, 1),
    nombre varchar(100) not null,
    apellido_paterno varchar(100) not null,
    apellido_materno varchar(100) not null,
    especialidad varchar(100) not null,
    constraint pk_oradores primary key (codigo)
)
go

insert into oradores (nombre, apellido_paterno, apellido_materno, especialidad)
    values ('David', 'Fuentes', 'Castillo', 'Aplicaciones móviles'),
           ('Ricardo', 'Arias', 'Portilla', 'Aplicaciones móviles')
go

select * from oradores
go

update oradores
set nombre = 'Roberto'
where codigo = 2
go

select nombre from oradores
go
-- update
update temas set nombre = 'ChatGTP en la educación'
where codigo = 1
go


-- funciones de agregación
-- count: cuenta resultados

select count(*) as CustomerQuantity from Customers
where Country = 'Germany'
go

select CompanyName, Country from Customers
where Country = 'Germany' or Country = 'Mexico'
order by CompanyName
go

--1: Indicar los países de procedencia de los clientes
select distinct Country from Customers
order by Country
go

--2: Indicar los nombres de los clientes que son de Mexico, Germany o USA

select distinct CompanyName, Country
from Customers
where Country in ('Mexico', 'Germany', 'USA')

