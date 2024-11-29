create user 'Shitech'@'%' identified by 'Shitech#123';

grant all on Shitech.* to 'Shitech'@'%';

create user 'ShitechINSERT'@'%' identified by 'Shitech#123';

grant insert on Shitech.Dados to 'ShitechINSERT'@'%';

flush privileges;