create database teste2;
use teste2;

create table produto(
id int not null primary key auto_increment,
descricao varchar(50) not null,
data datetime not null
)engine=innodb;

create table comprou(
id int not null primary key auto_increment,
nome varchar(50) not null,
id_fk int not null,
foreign key(id_fk) references produto(id)
)engine=innodb;

create table log(
id int not null primary key auto_increment,
nome varchar(30) not null,
data datetime not null
)engine=innodb;

insert into produto(id,descricao,data) values (null,"jose comprou sabao", "2023-12-04 04:15:12");

select * from log;