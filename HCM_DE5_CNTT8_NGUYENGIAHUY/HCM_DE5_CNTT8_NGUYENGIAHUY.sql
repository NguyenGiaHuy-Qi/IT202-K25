CREATE DATABASE EsportsManager;
USE EsportsManager;

Create table team(
team_id int auto_increment primary key,
team_name varchar(255) unique not null,
quoc_gia varchar(255) not null,
team_owner varchar(255),
born_in year
);

create table player(
player_id int auto_increment primary key,
player_name varchar(255) not null,
nickname varchar(255) not null,
roles varchar(255) unique not null,
wage int,
team_id int,
foreign key (team_id) references team(team_id)
);

create table matchs(
match_id varchar(255) unique not null,
started time,
result varchar(255) not null,
team_id int,
foreign key (team_id) references team(team_id)
);

create table match_statics(
kills int not null,
deaths int not null,
assist int not null,
player_id int,
foreign key (player_id) references player(player_id)
);

alter table matchs add price int;
alter table team rename column quoc_gia to khu_vuc;

drop table match_statics;
drop table matchs;

insert into team(team_name,quoc_gia,team_owner,born_in)
values
('abc','china','diepvan',2006),
('abg','america','homelander',2007),
('baller','america',null,2008),
('skt','korea','t1 telecom',2010),
('allstar','vietnam','baga',2025);

insert into player(player_name,nickname,roles,wage,team_id)
values
('dungct','ct','Jungle',200000,5),
('anhbaga','brb','Mid',220000,5),
('domixi','caobang','Top',230000,5),
('rauma','thanhhoa','Bot',360000,5),
('anthuyen','hatinh','SP',290000,5);

insert into matchs(match_id,started,result)
values
('MS_001',current_time(),'1-0'),
('MS_007',current_time(),'3-6'),
('MS_004',current_time(),'5-4'),
('MS_005',current_time(),'2-3'),
('MS_002',current_time(),'1-4');

insert into match_statics(kills,deaths,assists,player_id)
values
(10,3,4,2),
(1,17,2,3),
(8,9,10,4),
(2,9,6,5),
(1,12,1,1);

update player
set wage = wage * 1.2
where roles = 'Jungle';

delete from team
where team_onwer = null;

select wage from player where wage > 50000000 and  wage < 150000000;
select * from matchs where matchs = 'MS_007';

