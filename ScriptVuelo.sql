create database if not exists Vuelo; 

use Vuelo;

create table if not exists aviones(
idAvion int auto_increment primary key,
matricula varchar(15) not null,
cantidadPuestos varchar(4) not null);

create table if not exists tipoDocumento(
idTipoDoc int auto_increment primary key,
nombre varchar(25) not null);

create table if not exists eps(
idEps int auto_increment primary key,
nombre varchar(30) not null);

create table if not exists trayectos(
idTrayectos int auto_increment primary key,
origen varchar(50) not null,
destino varchar(50) not null,
duracion varchar(15));

create table if not exists pasajeros(
idPasajero int auto_increment primary key,
numDoc int not null,
nombre varchar(40) not null,
apellido varchar(40) not null,
fechaNacimiento date default '0000-00-00',
celular int not null,
rh varchar(3) not null,
numEmergencia int not null,
idTipoDoc int,
foreign key(idTipoDoc) references tipoDocumento (idTipoDoc),
idEps int,
foreign key(idEps) references eps (idEps));

create table if not exists vuelo(
idVuelo int auto_increment primary key,
idAvion int,
foreign key(idAvion) references aviones (idAvion),
idTrayecto int,
foreign key(idTrayecto) references trayectos (idTrayectos),
fechaHoraSalida datetime);

create table if not exists pasajeroVuelo(
idPasajeroVuelo int auto_increment primary key,
idVuelo int,
foreign key(idVuelo) references vuelo (idVuelo),
idPasajero int,
foreign key(idPasajero) references Pasajeros (idPasajero),
puesto int);