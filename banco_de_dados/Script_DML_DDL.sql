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
(DEFAULT, 1, 'Lucas Menezes', '12398765400', '11976543210', 1, 'Supervisor', 'lucas@greenfields.com', md5('senha112')),
(DEFAULT, 1, 'Fernanda Lima', '98732165400', '11965432109', 1, 'Gerente', 'fernanda@greenfields.com', md5('senha113')),
(DEFAULT, 2, 'Roberto Alves', '45678912300', '11987654322', 1, 'Supervisor', 'roberto@biofarms.com', md5('senha114')),
(DEFAULT, 2, 'Juliana Reis', '65498732100', '11999887755', 1, 'Gerente', 'juliana@biofarms.com', md5('senha115')),
(DEFAULT, 3, 'Marcos Ferreira', '78912345600', '11988776644', 1, 'Gerente', 'marcos@agronatura.com', md5('senha116')),
(DEFAULT, 3, 'Isabela Santos', '32198765400', '11977665544', 1, 'Supervisor', 'isabela@agronatura.com', md5('senha117'));
 
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
(DEFAULT, 1, 22.1, 65.0, now()),
(DEFAULT, 1, 22.3, 64.8, now()),
(DEFAULT, 1, 22.5, 64.6, now()),
(DEFAULT, 1, 22.7, 64.4, now()),
(DEFAULT, 1, 22.9, 64.2, now()),
(DEFAULT, 1, 23.1, 64.0, now()),
(DEFAULT, 1, 23.3, 63.8, now()),
(DEFAULT, 1, 23.5, 63.6, now()),
(DEFAULT, 1, 23.7, 63.4, now()),
(DEFAULT, 1, 23.9, 63.2, now()),
(DEFAULT, 2, 21.5, 60.0, now()),
(DEFAULT, 2, 21.7, 60.2, now()),
(DEFAULT, 2, 21.9, 60.4, now()),
(DEFAULT, 2, 22.1, 60.6, now()),
(DEFAULT, 2, 22.3, 60.8, now()),
(DEFAULT, 2, 22.5, 61.0, now()),
(DEFAULT, 2, 22.7, 61.2, now()),
(DEFAULT, 2, 22.9, 61.4, now()),
(DEFAULT, 2, 23.1, 61.6, now()),
(DEFAULT, 2, 23.3, 61.8, now()),
(DEFAULT, 3, 19.5, 55.0, now()),
(DEFAULT, 3, 19.7, 55.2, now()),
(DEFAULT, 3, 19.9, 55.4, now()),
(DEFAULT, 3, 20.1, 55.6, now()),
(DEFAULT, 3, 20.3, 55.8, now()),
(DEFAULT, 3, 20.5, 56.0, now()),
(DEFAULT, 3, 20.7, 56.2, now()),
(DEFAULT, 3, 20.9, 56.4, now()),
(DEFAULT, 3, 21.1, 56.6, now()),
(DEFAULT, 3, 21.3, 56.8, now()),
(DEFAULT, 4, 18.5, 50.0, now()),
(DEFAULT, 4, 18.7, 50.2, now()),
(DEFAULT, 4, 18.9, 50.4, now()),
(DEFAULT, 4, 19.1, 50.6, now()),
(DEFAULT, 4, 19.3, 50.8, now()),
(DEFAULT, 4, 19.5, 51.0, now()),
(DEFAULT, 4, 19.7, 51.2, now()),
(DEFAULT, 4, 19.9, 51.4, now()),
(DEFAULT, 4, 20.1, 51.6, now()),
(DEFAULT, 4, 20.3, 51.8, now()),
(DEFAULT, 5, 25.0, 65.0, now()),
(DEFAULT, 5, 25.2, 65.2, now()),
(DEFAULT, 5, 25.4, 65.4, now()),
(DEFAULT, 5, 25.6, 65.6, now()),
(DEFAULT, 5, 25.8, 65.8, now()),
(DEFAULT, 5, 26.0, 66.0, now()),
(DEFAULT, 5, 26.2, 66.2, now()),
(DEFAULT, 5, 26.4, 66.4, now()),
(DEFAULT, 5, 26.6, 66.6, now()),
(DEFAULT, 5, 26.8, 66.8, now()),
(DEFAULT, 6, 23.5, 63.0, now()),
(DEFAULT, 6, 23.7, 63.2, now()),
(DEFAULT, 6, 23.9, 63.4, now()),
(DEFAULT, 6, 24.1, 63.6, now()),
(DEFAULT, 6, 24.3, 63.8, now()),
(DEFAULT, 6, 24.5, 64.0, now()),
(DEFAULT, 6, 24.7, 64.2, now()),
(DEFAULT, 6, 24.9, 64.4, now()),
(DEFAULT, 6, 25.1, 64.6, now()),
(DEFAULT, 6, 25.3, 64.8, now()),
(DEFAULT, 7, 20.1, 58.0, now()),
(DEFAULT, 7, 20.3, 58.2, now()),
(DEFAULT, 7, 20.5, 58.4, now()),
(DEFAULT, 7, 20.7, 58.6, now()),
(DEFAULT, 7, 20.9, 58.8, now()),
(DEFAULT, 7, 21.1, 59.0, now()),
(DEFAULT, 7, 21.3, 59.2, now()),
(DEFAULT, 7, 21.5, 59.4, now()),
(DEFAULT, 7, 21.7, 59.6, now()),
(DEFAULT, 7, 21.9, 59.8, now()),
(DEFAULT, 8, 22.0, 61.0, now()),
(DEFAULT, 8, 22.2, 61.2, now()),
(DEFAULT, 8, 22.4, 61.4, now()),
(DEFAULT, 8, 22.6, 61.6, now()),
(DEFAULT, 8, 22.8, 61.8, now()),
(DEFAULT, 8, 23.0, 62.0, now()),
(DEFAULT, 8, 23.2, 62.2, now()),
(DEFAULT, 8, 23.4, 62.4, now()),
(DEFAULT, 8, 23.6, 62.6, now()),
(DEFAULT, 8, 23.8, 62.8, now()),
(DEFAULT, 9, 24.5, 63.0, now()),
(DEFAULT, 9, 24.7, 63.2, now()),
(DEFAULT, 9, 24.9, 63.4, now()),
(DEFAULT, 9, 25.1, 63.6, now()),
(DEFAULT, 9, 25.3, 63.8, now()),
(DEFAULT, 9, 25.5, 64.0, now()),
(DEFAULT, 9, 25.7, 64.2, now()),
(DEFAULT, 9, 25.9, 64.4, now()),
(DEFAULT, 9, 26.1, 64.6, now()),
(DEFAULT, 9, 26.3, 64.8, now()),
(DEFAULT, 10, 22.1, 60.0, now()),
(DEFAULT, 10, 22.3, 60.2, now()),
(DEFAULT, 10, 22.5, 60.4, now()),
(DEFAULT, 10, 22.7, 60.6, now()),
(DEFAULT, 10, 22.9, 60.8, now()),
(DEFAULT, 10, 23.1, 61.0, now()),
(DEFAULT, 10, 23.3, 61.2, now()),
(DEFAULT, 10, 23.5, 61.4, now()),
(DEFAULT, 10, 23.7, 61.6, now()),
(DEFAULT, 10, 23.9, 61.8, now()),
(DEFAULT, 11, 21.0, 58.0, now()),
(DEFAULT, 11, 21.2, 58.2, now()),
(DEFAULT, 11, 21.4, 58.4, now()),
(DEFAULT, 11, 21.6, 58.6, now()),
(DEFAULT, 11, 21.8, 58.8, now()),
(DEFAULT, 11, 22.0, 59.0, now()),
(DEFAULT, 11, 22.2, 59.2, now()),
(DEFAULT, 11, 22.4, 59.4, now()),
(DEFAULT, 11, 22.6, 59.6, now()),
(DEFAULT, 11, 22.8, 59.8, now()),
(DEFAULT, 12, 26.5, 68.0, now()),
(DEFAULT, 12, 26.7, 68.2, now()),
(DEFAULT, 12, 26.9, 68.4, now()),
(DEFAULT, 12, 27.1, 68.6, now()),
(DEFAULT, 12, 27.3, 68.8, now()),
(DEFAULT, 12, 27.5, 69.0, now()),
(DEFAULT, 12, 27.7, 69.2, now()),
(DEFAULT, 12, 27.9, 69.4, now()),
(DEFAULT, 12, 28.1, 69.6, now()),
(DEFAULT, 12, 28.3, 69.8, now());

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

CREATE VIEW manutencaoEstufa as
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

CREATE VIEW plantacaoEstufa as
select Lote.estufa as 'Localidade', Lote.tipo as 'Tipo',
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
Lote.estufa as 'Estufa', Sensor.idSensor as 'N° Sensor',
Sensor.posicao as 'Posição', Sensor.manutencao as 'Manutenção'
from Empresa join Usuario
on Usuario.fkEmpresa = Empresa.idEmpresa
join Lote 
on Lote.fkEmpresa = Empresa.idEmpresa
join Sensor
on Sensor.fkLote = Lote.idLote;

desc lote;

SELECT * FROM plantacaoChampignon;

SELECT
    HOUR(horarioCaptura) AS hora, -- ultima KPI --
    CASE
    WHEN MAX(temperatura) - avg(temperatura)  > ABS(MIN(temperatura) - avg(temperatura)) THEN TRUNCATE(MAX(temperatura) - avg(temperatura), 2) 
	WHEN MAX(temperatura) - avg(temperatura)  < ABS(MIN(temperatura) - avg(temperatura)) THEN TRUNCATE(ABS(MIN(temperatura) - avg(temperatura)), 2)
    ELSE TRUNCATE(MAX(temperatura) - avg(temperatura), 2)  END AS variacao_temperaturaFINAL,
    CASE
    WHEN MAX(umidade) - avg(umidade)  > ABS(MIN(umidade) - avg(umidade)) THEN TRUNCATE(MAX(umidade) - avg(umidade), 2) 
	WHEN MAX(umidade) - avg(umidade)  < ABS(MIN(umidade) - avg(umidade)) THEN TRUNCATE(ABS(MIN(umidade) - avg(umidade)), 2)
    ELSE TRUNCATE(MAX(umidade) - avg(umidade), 2)  END AS variacao_umidadeFINAL
FROM Dados WHERE horarioCaptura >= NOW() - interval 1 DAY
GROUP BY HOUR(horarioCaptura)
ORDER BY hora;

SELECT
	TRUNCATE(avg(temperatura),2)AS 'Média temperatura diária',
    TRUNCATE(avg(umidade),2) AS 'Média umidade diária'	-- primeira e segunda KPI --
    FROM dados WHERE horarioCaptura >= NOW() - interval 1 DAY;
    
SELECT
    HOUR(horarioCaptura) AS horaTemp,-- terceira KPI --
    CASE
    WHEN MAX(temperatura) - avg(temperatura)  > ABS(MIN(temperatura) - avg(temperatura)) THEN TRUNCATE(MAX(temperatura) - avg(temperatura), 2) 
	WHEN MAX(temperatura) - avg(temperatura)  < ABS(MIN(temperatura) - avg(temperatura)) THEN TRUNCATE(ABS(MIN(temperatura) - avg(temperatura)), 2)
    ELSE TRUNCATE(MAX(temperatura) - avg(temperatura), 2)  END AS variacao_temperaturaFINAL
FROM Dados WHERE horarioCaptura >= NOW() - interval 1 DAY
GROUP BY HOUR(horarioCaptura)
order by variacao_temperaturaFINAL DESC limit 1;

SELECT 
	date_format(horarioCaptura, '%H:%i') AS hora,
	idSensor,
	idLote,
    MAX(d.temperatura) as temp_max,
    MIN(d.temperatura) as temp_min,
    MAX(d.umidade) as umid_max,
    MIN(d.umidade) as umid_min,
    s.posicao as 'Quadrante	',
    l.estufa as 'Nome Estufa',    
    l.tipo as 'Tipo Estufa',							-- SELECT PARA MOSTRAR VARIAÇÃO DE TEMP., DE UMID., MOSTRAR A HORA DA CAPTURA, NOME DAS EMPRESAS --
    e.nomeFantasia as 'Nome empresa',								-- NOME DOS USUARIOS, QUADRANTES, TIPOS DA ESTUFA E NOME DA ESTUFA --
    u.nome as 'Nome usuário'
FROM Dados as d JOIN sensor as s on d.fkSensor = s.idSensor 
JOIN lote as l on s.fkLote = l.idLote 
JOIN empresa as e on l.fkEmpresa = e.idEmpresa
JOIN usuario as u on e.idEmpresa = u.fkEmpresa
GROUP BY hora, s.posicao, u.nome, l.estufa, l.tipo, e.nomeFantasia, idLote, idSensor
ORDER BY temp_max DESC, temp_min DESC, umid_max DESC, umid_min DESC, hora ASC;


SELECT
	hour(horarioCaptura) as Hora, 
	TRUNCATE(temperatura ,2)AS mediaTempDiaria,
    TRUNCATE(umidade ,2) AS mediaUmidDiaria	-- --
    FROM dados WHERE horarioCaptura >= NOW() - interval 1 DAY
    group by hora, mediaTempDiaria, mediaUmidDiaria;
    
    SELECT
    HOUR(horarioCaptura) AS horaUmid,-- terceira KPI --
        CASE
    WHEN MAX(umidade) - avg(umidade)  > ABS(MIN(umidade) - avg(umidade)) THEN TRUNCATE(MAX(umidade) - avg(umidade), 2) 
	WHEN MAX(umidade) - avg(umidade)  < ABS(MIN(umidade) - avg(umidade)) THEN TRUNCATE(ABS(MIN(umidade) - avg(umidade)), 2)
    ELSE TRUNCATE(MAX(umidade) - avg(umidade), 2)  END AS variacao_umidadeFINAL
FROM Dados WHERE horarioCaptura >= NOW() - interval 1 DAY
GROUP BY HOUR(horarioCaptura)
order by variacao_umidadeFINAL desc limit 1;
    
     delete from dados where horarioCaptura >= NOW() - interval 1 DAY;

    select * from dados WHERE horarioCaptura >= NOW() - interval 1 DAY;
    SELECT TRUNCATE(avg(temperatura),2)AS mediaTempDiaria, TRUNCATE(avg(umidade),2) AS mediaUmidDiaria FROM dados join sensor on idSensor = fkSensor join lote on idLote = fkLote join empresa on idEmpresa = fkEmpresa WHERE horarioCaptura >= NOW() - interval 1000 DAY and fkEmpresa = 1;
    
    select * from usuario;
    
    select truncate(avg(temperatura), 2) as mediaTemp, hour(horarioCaptura) as horario from dados group by horarioCaptura;
    
    select curdate();
    
    SELECT convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        ) as horario;
        ;
        
	