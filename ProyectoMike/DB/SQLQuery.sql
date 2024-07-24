create database Fundas_Mike
go
use Fundas_Mike
go
--Rama 1
create table Modelos(
ID bigint not null primary key identity(1,1),
NOMBRE varchar(300) not null
)
create table ColoresDeTelas(
ID bigint not null primary key identity(1,1),
NOMBRE varchar(300) not null
)
create table Familias(
ID bigint not null primary key identity(1,1),
NOMBRE varchar(300) not null
)
create table Fundas(
ID bigint not null primary key identity(1,1),
NOMBRE varchar(300) not null,
CODIGO varchar(300) null,
ID_COLOR bigint not null foreign key references ColoresDeTelas(ID),
ID_FAMILIA bigint not null foreign key references Familias(ID),
ID_MODELO bigint not null foreign key references Modelos(ID),
STOCK bigint not null default 0
)
--Rama 2
create table Usuarios(
ID bigint not null primary key identity(1,1),
NOMBRE varchar(150) not null,
APELLIDO varchar(150) not null,
USUARIO varchar(100) not null,
CLAVE varchar(100) not null,
)
--Rama 3
create table Bolsas(
ID bigint not null primary key identity(1,1),
NOMBRE varchar(150) not null
)
create table FilasEnBolsas(
ID bigint not null primary key identity(1,1),
ID_BOLSA bigint not null foreign key references Bolsas(ID),
NOMBRE varchar(150) not null
)
--Punto de interseccion
create table Movimientos(
ID bigint not null primary key identity(1,1),
ID_USUARIO bigint not null foreign key references Usuarios(ID),
ID_FUNDA bigint not null foreign key references Fundas(ID),
ID_BOLSA bigint not null foreign key references Bolsas(ID),
ID_FILA bigint not null foreign key references FilasEnBolsas(ID),
CANTIDAD bigint not null
)

INSERT INTO Usuarios(NOMBRE, APELLIDO, USUARIO, CLAVE) VALUES ('Alejo','Chavez','alejo','alejo1234');
