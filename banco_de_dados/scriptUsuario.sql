create user 'shitech'@'%' identified by 'Shitech#123';

grant all on Shitech.* to 'shitech'@'%';

create user 'shitechINSERT'@'%' identified by 'Shitech#123';

grant insert on Shitech.Dados to 'shitechINSERT'@'%';

flush privileges;