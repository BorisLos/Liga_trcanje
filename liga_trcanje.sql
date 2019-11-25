drop database if exists liga_trcanje;
create database liga_trcanje default character set utf8;
use liga_trcanje;


# popis clanova trkaca
create table clan(
    sifra int not null primary key auto_increment,
    spol varchar(1) not null,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    datum_rodjenja datetime not null,
    email varchar(50),
    mobitel varchar(20),
    ulica varchar(50),
    kucni_broj varchar(10),
    grad varchar(30),
    drzava varchar(30),
    kategorija int,
    clanarina boolean default true,
    PBmala time,
    PBvelika time
);


# kategorije trkaca
create table kategorija(
    sifra int not null primary key auto_increment,
    naziv varchar(20) not null 
);


# rezultati kola lige
create table rezultat(
    sifra int not null primary key auto_increment,
    clan int,
    vrijeme time not null,
    duzina int,
    kolo int
);


# duzine utrke lige
create table duzina(
    sifra int not null primary key auto_increment, 
    naziv varchar(10) not null
);


# kolo lige
create table kolo(
    sifra int not null primary key auto_increment,
    datum datetime not null
);


# prisutnost trkaca na kolu lige
create table prisutnost(
    sifra int not null primary key auto_increment,
    kolo int,
    clan int
);


alter table clan add foreign key (kategorija) references kategorija(sifra);

alter table rezultat add foreign key (clan) references clan(sifra);

alter table prisutnost add foreign key (clan) references clan(sifra);
 
alter table rezultat add foreign key (duzina) references duzina(sifra);

alter table prisutnost add foreign key (kolo) references kolo(sifra);
 







