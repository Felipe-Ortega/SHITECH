create user 'shitech'@'%' identified by 'Shitech#123';

grant all on shitech.* to 'shitech'@'%';

create user 'shitechINSERT'@'%' identified by 'Shitech#123';

grant insert on shitech.Dados to 'shitechINSERT'@'%';

flush privileges;