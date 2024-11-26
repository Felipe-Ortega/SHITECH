CREATE DATABASE Shitech;
USE Shitech;

CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(60) NOT NULL,
    nomeFantasia VARCHAR(144) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    status_cliente TINYINT(1) NOT NULL,
    CONSTRAINT chkStatusCliente CHECK (status_cliente IN (0, 1)),
    unidade CHAR(3) NOT NULL
);

CREATE TABLE Usuario (
    idRepresentante INT PRIMARY KEY AUTO_INCREMENT,
    fkEmpresa INT NOT NULL,
    nome VARCHAR(60) NOT NULL,
    cpf CHAR(11) NOT NULL,
    telefone CHAR(11) NOT NULL,
    status_colaborador TINYINT(1) NOT NULL,
    CONSTRAINT chkStatusColaborador CHECK (status_colaborador IN (0, 1)),
    cargo VARCHAR(45) NOT NULL,
    email VARCHAR(256) NOT NULL,
    senha CHAR(32) NOT NULL,
    CONSTRAINT fkEmpresaUsuario FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Lote (
    idLote INT PRIMARY KEY AUTO_INCREMENT,
    dtPlantacao DATE NOT NULL,
    dtColheita DATE NOT NULL,
    dtFrutificacao DATE NOT NULL,
    estufa CHAR(6) NOT NULL,
    tipo VARCHAR(45) NOT NULL,
    fkEmpresa INT NOT NULL,
    CONSTRAINT fkEmpresaLote FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    fkLote INT NOT NULL,
    manutencao DATE NOT NULL,
    sensorStatus TINYINT(1) NOT NULL,
    posicao CHAR(6) NOT NULL,
    CONSTRAINT fkLoteSensor FOREIGN KEY (fkLote) REFERENCES Lote(idLote)
);

CREATE TABLE Dados (
    idDados INT AUTO_INCREMENT,
    fkSensor INT NOT NULL,
    temperatura DECIMAL(5,2) NOT NULL,
    umidade DECIMAL(5,2) NOT NULL,
    horarioCaptura DATETIME NOT NULL,
    CONSTRAINT fkDadosSensor FOREIGN KEY (fkSensor) REFERENCES SensoR(idSensor),
    CONSTRAINT pkDadosSensor PRIMARY KEY (idDados, fkSensor)
);
 
INSERT INTO Empresa 
VALUES 
(DEFAULT, 'GreenFields Agro LTDA', 'GreenFields', '11223344000177', 1, '001'),
(DEFAULT, 'BioFarms Inc.', 'BioFarms', '55667788000166', 1, '002'),
(DEFAULT, 'AgroNatura SA', 'AgroNatura', '99887766000155', 1, '003');

INSERT INTO Usuario 
VALUES 
(DEFAULT, 1, 'Lucas Menezes', '12398765400', '11976543210', 1, 'Supervisor', 'lucas@greenfields.com', 'senha112'),
(DEFAULT, 1, 'Fernanda Lima', '98732165400', '11965432109', 1, 'Gerente', 'fernanda@greenfields.com', 'senha113'),
(DEFAULT, 2, 'Roberto Alves', '45678912300', '11987654322', 1, 'Supervisor', 'roberto@biofarms.com', 'senha114'),
(DEFAULT, 2, 'Juliana Reis', '65498732100', '11999887755', 1, 'Gerente', 'juliana@biofarms.com', 'senha115'),
(DEFAULT, 3, 'Marcos Ferreira', '78912345600', '11988776644', 1, 'Gerente', 'marcos@agronatura.com', 'senha116'),
(DEFAULT, 3, 'Isabela Santos', '32198765400', '11977665544', 1, 'Supervisor', 'isabela@agronatura.com', 'senha117');
 
INSERT INTO Lote
VALUES 
(DEFAULT, '2024-02-01', '2024-08-01', '2024-05-01', 'RJ001', 'Shimeji', 1),
(DEFAULT, '2024-03-10', '2024-09-10', '2024-06-10', 'RJ002', 'Champignon', 1),
(DEFAULT, '2024-04-15', '2024-11-15', '2024-07-30', 'MG001', 'Shimeji', 2),
(DEFAULT, '2024-05-20', '2024-12-20', '2024-08-25', 'MG002', 'Champignon', 2),
(DEFAULT, '2024-06-05', '2025-01-05', '2024-09-15', 'SP001', 'Shimeji', 3),
(DEFAULT, '2024-07-10', '2025-02-10', '2024-10-25', 'SP002', 'Champignon', 3);

INSERT INTO Sensor
VALUES 
(DEFAULT, 1, '2024-03-01', 1, 'G00001'),
(DEFAULT, 1, '2024-04-15', 1, 'G00002'),
(DEFAULT, 2, '2024-05-10', 1, 'G00001'),
(DEFAULT, 2, '2024-06-01', 1, 'G00002'),
(DEFAULT, 3, '2024-07-20', 1, 'B00001'),
(DEFAULT, 3, '2024-08-10', 1, 'B00002'),
(DEFAULT, 4, '2024-09-01', 1, 'B00001'),
(DEFAULT, 4, '2024-10-05', 1, 'B00002'),
(DEFAULT, 5, '2024-11-10', 1, 'A00001'),
(DEFAULT, 5, '2024-11-10', 1, 'A00002'),
(DEFAULT, 6, '2024-11-10', 1, 'A00001'),
(DEFAULT, 6, '2024-11-10', 1, 'A00002');

INSERT INTO Dados
VALUES
(DEFAULT, 1, 22.1, 65.0, '2024-03-01 08:01:00'),
(DEFAULT, 1, 22.3, 64.8, '2024-03-01 08:02:00'),
(DEFAULT, 1, 22.5, 64.6, '2024-03-01 08:03:00'),
(DEFAULT, 1, 22.7, 64.4, '2024-03-01 08:04:00'),
(DEFAULT, 1, 22.9, 64.2, '2024-03-01 08:05:00'),
(DEFAULT, 1, 23.1, 64.0, '2024-03-01 08:06:00'),
(DEFAULT, 1, 23.3, 63.8, '2024-03-01 08:07:00'),
(DEFAULT, 1, 23.5, 63.6, '2024-03-01 08:08:00'),
(DEFAULT, 1, 23.7, 63.4, '2024-03-01 08:09:00'),
(DEFAULT, 1, 23.9, 63.2, '2024-03-01 08:10:00'),
(DEFAULT, 2, 21.5, 60.0, '2024-04-15 09:10:00'),
(DEFAULT, 2, 21.7, 60.2, '2024-04-15 09:11:00'),
(DEFAULT, 2, 21.9, 60.4, '2024-04-15 09:12:00'),
(DEFAULT, 2, 22.1, 60.6, '2024-04-15 09:13:00'),
(DEFAULT, 2, 22.3, 60.8, '2024-04-15 09:14:00'),
(DEFAULT, 2, 22.5, 61.0, '2024-04-15 09:15:00'),
(DEFAULT, 2, 22.7, 61.2, '2024-04-15 09:16:00'),
(DEFAULT, 2, 22.9, 61.4, '2024-04-15 09:17:00'),
(DEFAULT, 2, 23.1, 61.6, '2024-04-15 09:18:00'),
(DEFAULT, 2, 23.3, 61.8, '2024-04-15 09:19:00'),
(DEFAULT, 3, 19.5, 55.0, '2024-07-20 10:01:00'),
(DEFAULT, 3, 19.7, 55.2, '2024-07-20 10:02:00'),
(DEFAULT, 3, 19.9, 55.4, '2024-07-20 10:03:00'),
(DEFAULT, 3, 20.1, 55.6, '2024-07-20 10:04:00'),
(DEFAULT, 3, 20.3, 55.8, '2024-07-20 10:05:00'),
(DEFAULT, 3, 20.5, 56.0, '2024-07-20 10:06:00'),
(DEFAULT, 3, 20.7, 56.2, '2024-07-20 10:07:00'),
(DEFAULT, 3, 20.9, 56.4, '2024-07-20 10:08:00'),
(DEFAULT, 3, 21.1, 56.6, '2024-07-20 10:09:00'),
(DEFAULT, 3, 21.3, 56.8, '2024-07-20 10:10:00'),
(DEFAULT, 4, 18.5, 50.0, '2024-08-10 11:01:00'),
(DEFAULT, 4, 18.7, 50.2, '2024-08-10 11:02:00'),
(DEFAULT, 4, 18.9, 50.4, '2024-08-10 11:03:00'),
(DEFAULT, 4, 19.1, 50.6, '2024-08-10 11:04:00'),
(DEFAULT, 4, 19.3, 50.8, '2024-08-10 11:05:00'),
(DEFAULT, 4, 19.5, 51.0, '2024-08-10 11:06:00'),
(DEFAULT, 4, 19.7, 51.2, '2024-08-10 11:07:00'),
(DEFAULT, 4, 19.9, 51.4, '2024-08-10 11:08:00'),
(DEFAULT, 4, 20.1, 51.6, '2024-08-10 11:09:00'),
(DEFAULT, 4, 20.3, 51.8, '2024-08-10 11:10:00'),
(DEFAULT, 5, 25.0, 65.0, '2024-09-01 10:11:00'),
(DEFAULT, 5, 25.2, 65.2, '2024-09-01 10:12:00'),
(DEFAULT, 5, 25.4, 65.4, '2024-09-01 10:13:00'),
(DEFAULT, 5, 25.6, 65.6, '2024-09-01 10:14:00'),
(DEFAULT, 5, 25.8, 65.8, '2024-09-01 10:15:00'),
(DEFAULT, 5, 26.0, 66.0, '2024-09-01 10:16:00'),
(DEFAULT, 5, 26.2, 66.2, '2024-09-01 10:17:00'),
(DEFAULT, 5, 26.4, 66.4, '2024-09-01 10:18:00'),
(DEFAULT, 5, 26.6, 66.6, '2024-09-01 10:19:00'),
(DEFAULT, 5, 26.8, 66.8, '2024-09-01 10:20:00'),
(DEFAULT, 6, 23.5, 63.0, '2024-10-05 08:01:00'),
(DEFAULT, 6, 23.7, 63.2, '2024-10-05 08:02:00'),
(DEFAULT, 6, 23.9, 63.4, '2024-10-05 08:03:00'),
(DEFAULT, 6, 24.1, 63.6, '2024-10-05 08:04:00'),
(DEFAULT, 6, 24.3, 63.8, '2024-10-05 08:05:00'),
(DEFAULT, 6, 24.5, 64.0, '2024-10-05 08:06:00'),
(DEFAULT, 6, 24.7, 64.2, '2024-10-05 08:07:00'),
(DEFAULT, 6, 24.9, 64.4, '2024-10-05 08:08:00'),
(DEFAULT, 6, 25.1, 64.6, '2024-10-05 08:09:00'),
(DEFAULT, 6, 25.3, 64.8, '2024-10-05 08:10:00'),
(DEFAULT, 7, 20.1, 58.0, '2024-03-02 08:01:00'),
(DEFAULT, 7, 20.3, 58.2, '2024-03-02 08:02:00'),
(DEFAULT, 7, 20.5, 58.4, '2024-03-02 08:03:00'),
(DEFAULT, 7, 20.7, 58.6, '2024-03-02 08:04:00'),
(DEFAULT, 7, 20.9, 58.8, '2024-03-02 08:05:00'),
(DEFAULT, 7, 21.1, 59.0, '2024-03-02 08:06:00'),
(DEFAULT, 7, 21.3, 59.2, '2024-03-02 08:07:00'),
(DEFAULT, 7, 21.5, 59.4, '2024-03-02 08:08:00'),
(DEFAULT, 7, 21.7, 59.6, '2024-03-02 08:09:00'),
(DEFAULT, 7, 21.9, 59.8, '2024-03-02 08:10:00'),
(DEFAULT, 8, 22.0, 61.0, '2024-04-16 09:01:00'),
(DEFAULT, 8, 22.2, 61.2, '2024-04-16 09:02:00'),
(DEFAULT, 8, 22.4, 61.4, '2024-04-16 09:03:00'),
(DEFAULT, 8, 22.6, 61.6, '2024-04-16 09:04:00'),
(DEFAULT, 8, 22.8, 61.8, '2024-04-16 09:05:00'),
(DEFAULT, 8, 23.0, 62.0, '2024-04-16 09:06:00'),
(DEFAULT, 8, 23.2, 62.2, '2024-04-16 09:07:00'),
(DEFAULT, 8, 23.4, 62.4, '2024-04-16 09:08:00'),
(DEFAULT, 8, 23.6, 62.6, '2024-04-16 09:09:00'),
(DEFAULT, 8, 23.8, 62.8, '2024-04-16 09:10:00'),
(DEFAULT, 9, 24.5, 63.0, '2024-05-11 10:01:00'),
(DEFAULT, 9, 24.7, 63.2, '2024-05-11 10:02:00'),
(DEFAULT, 9, 24.9, 63.4, '2024-05-11 10:03:00'),
(DEFAULT, 9, 25.1, 63.6, '2024-05-11 10:04:00'),
(DEFAULT, 9, 25.3, 63.8, '2024-05-11 10:05:00'),
(DEFAULT, 9, 25.5, 64.0, '2024-05-11 10:06:00'),
(DEFAULT, 9, 25.7, 64.2, '2024-05-11 10:07:00'),
(DEFAULT, 9, 25.9, 64.4, '2024-05-11 10:08:00'),
(DEFAULT, 9, 26.1, 64.6, '2024-05-11 10:09:00'),
(DEFAULT, 9, 26.3, 64.8, '2024-05-11 10:10:00'),
(DEFAULT, 10, 22.1, 60.0, '2024-06-02 11:01:00'),
(DEFAULT, 10, 22.3, 60.2, '2024-06-02 11:02:00'),
(DEFAULT, 10, 22.5, 60.4, '2024-06-02 11:03:00'),
(DEFAULT, 10, 22.7, 60.6, '2024-06-02 11:04:00'),
(DEFAULT, 10, 22.9, 60.8, '2024-06-02 11:05:00'),
(DEFAULT, 10, 23.1, 61.0, '2024-06-02 11:06:00'),
(DEFAULT, 10, 23.3, 61.2, '2024-06-02 11:07:00'),
(DEFAULT, 10, 23.5, 61.4, '2024-06-02 11:08:00'),
(DEFAULT, 10, 23.7, 61.6, '2024-06-02 11:09:00'),
(DEFAULT, 10, 23.9, 61.8, '2024-06-02 11:10:00'),
(DEFAULT, 11, 21.0, 58.0, '2024-07-21 12:01:00'),
(DEFAULT, 11, 21.2, 58.2, '2024-07-21 12:02:00'),
(DEFAULT, 11, 21.4, 58.4, '2024-07-21 12:03:00'),
(DEFAULT, 11, 21.6, 58.6, '2024-07-21 12:04:00'),
(DEFAULT, 11, 21.8, 58.8, '2024-07-21 12:05:00'),
(DEFAULT, 11, 22.0, 59.0, '2024-07-21 12:06:00'),
(DEFAULT, 11, 22.2, 59.2, '2024-07-21 12:07:00'),
(DEFAULT, 11, 22.4, 59.4, '2024-07-21 12:08:00'),
(DEFAULT, 11, 22.6, 59.6, '2024-07-21 12:09:00'),
(DEFAULT, 11, 22.8, 59.8, '2024-07-21 12:10:00'),
(DEFAULT, 12, 26.5, 68.0, '2024-08-11 13:01:00'),
(DEFAULT, 12, 26.7, 68.2, '2024-08-11 13:02:00'),
(DEFAULT, 12, 26.9, 68.4, '2024-08-11 13:03:00'),
(DEFAULT, 12, 27.1, 68.6, '2024-08-11 13:04:00'),
(DEFAULT, 12, 27.3, 68.8, '2024-08-11 13:05:00'),
(DEFAULT, 12, 27.5, 69.0, '2024-08-11 13:06:00'),
(DEFAULT, 12, 27.7, 69.2, '2024-08-11 13:07:00'),
(DEFAULT, 12, 27.9, 69.4, '2024-08-11 13:08:00'),
(DEFAULT, 12, 28.1, 69.6, '2024-08-11 13:09:00'),
(DEFAULT, 12, 28.3, 69.8, '2024-08-11 13:10:00');

CREATE VIEW empresaLote as
select * from empresa join lote
on idEmpresa = fkEmpresa
order by nomeFantasia asc;

CREATE VIEW plantacaoShimeji AS
select nomeFantasia, idLote, dtPlantacao, dtColheita, dtFrutificacao, tipo from empresa join lote
on idEmpresa = fkEmpresa
where tipo = 'Shimeji';

CREATE VIEW nomeEmpresa AS
select usuario.nome,usuario.status_colaborador, nomeFantasia
from usuario join empresa
on idEmpresa = fkEmpresa
order by nomeFantasia;

CREATE VIEW plantacaoChampignon AS
select nomeFantasia, idLote, dtPlantacao, dtColheita, dtFrutificacao, tipo from empresa join lote
on idEmpresa = fkEmpresa
where tipo = 'Champignon';

<<<<<<< HEAD
CREATE VIEW manutencaoEstufa as
=======
>>>>>>> 34ae35929f9369c4104bf82e147522e7c8a161c1
select Empresa.nomeFantasia, Lote.estufa,
Sensor.manutencao, Sensor.sensorStatus 
from Empresa join Lote
on idEmpresa = fkEmpresa
join Sensor
on fkLote = idLote;

CREATE VIEW empresaBiofarms AS
select * from Empresa
left join Lote
on idEmpresa = fkEmpresa
where nomeFantasia = 'BioFarms';

<<<<<<< HEAD
CREATE VIEW plantacaoEstufa as
select Lote.estufa as 'Localidade', Lote.tipo as 'Tipo',
=======
select Lote.estufa as 'Localidade da Estufa', Lote.tipo as 'Tipo',
>>>>>>> 34ae35929f9369c4104bf82e147522e7c8a161c1
Sensor.sensorStatus as 'Status do Sensor', Sensor.posicao as 'Posição do Sensor'
from Lote join Sensor
on fkLote = idLote;

CREATE VIEW sensorDados AS
select * from Sensor 
join Dados
on fkSensor = idSensor;

CREATE VIEW sensorDadosHorario AS
select * from Sensor 
join Dados
on fkSensor = idSensor
where horarioCaptura > '2024-05-11 10:05:00';

CREATE VIEW statusLotes AS
select Lote.idLote as 'N° Lote', Sensor.posicao as 'Posição',
Dados.temperatura as 'Temperatura', Dados.umidade as 'Umidade',
Dados.horarioCaptura as 'Horário da Captura'
from Lote join Sensor
on fkLote = idLote
join Dados
on fkSensor = idSensor;

CREATE VIEW statusLotesShimeji AS
select Lote.idLote as 'N° Lote', Sensor.posicao as 'Posição',
Dados.temperatura as 'Temperatura', Dados.umidade as 'Umidade',
Dados.horarioCaptura as 'Horário da Captura'
from Lote join Sensor
on fkLote = idLote
join Dados
on fkSensor = idSensor
where Lote.tipo = 'Shimeji';

CREATE VIEW statusLotesChampignon AS
select Lote.idLote as 'N° Lote', Sensor.posicao as 'Posição',
Dados.temperatura as 'Temperatura', Dados.umidade as 'Umidade',
Dados.horarioCaptura as 'Horário da Captura'
from Lote join Sensor
on fkLote = idLote
join Dados
on fkSensor = idSensor
where Lote.tipo = 'Champignon';

CREATE VIEW manutencaoEstufaEmpresa as
select Empresa.nomeFantasia as 'Nome da Empresa', Usuario.nome as 'Representante',
Usuario.status_colaborador as 'Status Colaborador', Lote.idLote as 'N° Lote', 
<<<<<<< HEAD
Lote.estufa as 'Estufa', Sensor.idSensor as 'N° Sensor',
=======
Lote.estufa as 'Localidade da Estufa', Sensor.idSensor as 'N° Sensor',
>>>>>>> 34ae35929f9369c4104bf82e147522e7c8a161c1
Sensor.posicao as 'Posição', Sensor.manutencao as 'Manutenção'
from Empresa join Usuario
on Usuario.fkEmpresa = Empresa.idEmpresa
join Lote 
on Lote.fkEmpresa = Empresa.idEmpresa
join Sensor
on Sensor.fkLote = Lote.idLote;

<<<<<<< HEAD
DROP DATABASE Shitech;

desc lote;
=======
DROP DATABASE Shitech;
>>>>>>> 34ae35929f9369c4104bf82e147522e7c8a161c1
