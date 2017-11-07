create database homepage;

create table article (
  id int not null auto_increment,
  createdAt datetime not null default now(),
  title varchar(100) not null,
  content varchar(500) not null,
  saveName varchar(100) not null,
  originalName varchar(100) not null,
  primary key(id)
);


create table member (
  userID varchar(100) not null,
  userPassword varchar(100) not null,
  userBirth varchar(100) not null,
  userEmail varchar(100) not null,
  userGender varchar(30) not null,
  primary key(userID)
);