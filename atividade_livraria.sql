create database livraria
go 
use livraria 


create table livro(

codigo_livro	 int				not null,
nome			 varchar(30)		null,
lingua			 varchar(15)		null		default('pt-br'), 
ano				 int				null		check( ano >= '1990')

primary key (codigo_livro)
)

go 

create table autor (

codigo_autor	int				not null,
nome			varchar(30)		null		unique, 
nascimento		date			null,
pais			varchar(20)		null	check(UPPER(pais) = 'ALEMANHA' or UPPER(pais) ='BRASIL'),
biografia		varchar(50)		null

primary key(codigo_autor)
)

go 

create table edicoes(

isbn			int				not null,
preco			decimal(7,2)	null		check(preco>=0),
ano				int				null		check(ano >= '1993'),
num_paginas		int				null		check(num_paginas>=1),
qtde_estoque	int				null,		
codigo_livro	 int			not null

primary key(isbn)

foreign key (codigo_livro) references livro (codigo_livro)
)

go 

create table editora(

codigo_editora		int				not null,
nome				varchar(30)		null		unique,
logradouro			varchar(20)		null,
numero				int				null		check(numero>=0),
cep					int				null,
telefone			varchar(13)		null


primary key(codigo_editora)
)

go 

create table livro_autor(

codigo_livro	int		not null,
codigo_autor	int		not null

primary key (codigo_livro, codigo_autor)

foreign key (codigo_livro) references livro  (codigo_livro),
foreign key (codigo_autor) references autor  (codigo_autor)
)

go 

create table ediotores_editora(

isbn_edicoes	int		not null,
codigo_editora	int		not null

primary key (isbn_edicoes, codigo_editora)

foreign key (isbn_edicoes) references edicoes  (isbn),
foreign key (codigo_editora) references editora  (codigo_editora)
)