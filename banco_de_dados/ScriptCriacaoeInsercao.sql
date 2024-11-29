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
    CONSTRAINT fkDadosSensor FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor),
    CONSTRAINT pkDadosSensor PRIMARY KEY (idDados, fkSensor)
);

insert into Empresa values
(1, 'Shitech LTDA', 'Shitech Soluções', '12345678901112', 1, '000');

insert into Usuario values
(1, 1, 'Lucas Aquino', '12345678901', '12345678901', 1, 'suporte', 'lucas@shitech.com', md5('#Admin2012')),
(2, 1, 'Laiza Tavares', '21345678901', '21345678901', 1, 'suporte', 'laiza@shitech.com', md5('#Admin2012')),
(3, 1, 'Lara Silva', '31245678901', '31245678901', 1, 'suporte', 'lara@shitech.com', md5('#Admin2012')),
(4, 1, 'Felipe Miguel', '41235678901', '41235678901', 1, 'suporte', 'felipe@shitech.com', md5('#Admin2012')),
(5, 1, 'Amanda Pedroza', '51234678901', '51234678901', 1, 'suporte', 'amanda@shitech.com', md5('#Admin2012')),
(6, 1, 'Pedro Luiz', '61234578901', '61234578901', 1, 'suporte', 'pedro@shitech.com', md5('#Admin2012'));

INSERT INTO Empresa 
VALUES 
(DEFAULT, 'GreenFields Agro LTDA', 'GreenFields', '11223344000177', 1, '001'),
(DEFAULT, 'BioFarms Inc.', 'BioFarms', '55667788000166', 1, '002'),
(DEFAULT, 'AgroNatura SA', 'AgroNatura', '99887766000155', 1, '003');

INSERT INTO Usuario 
VALUES 
(DEFAULT, 2, 'Lucas Menezes', '12398765400', '11976543210', 1, 'Supervisor', 'lucas@greenfields.com', md5('senha112')),
(DEFAULT, 2, 'Fernanda Lima', '98732165400', '11965432109', 1, 'Gerente', 'fernanda@greenfields.com', md5('senha113')),
(DEFAULT, 3, 'Roberto Alves', '45678912300', '11987654322', 1, 'Supervisor', 'roberto@biofarms.com', md5('senha114')),
(DEFAULT, 3, 'Juliana Reis', '65498732100', '11999887755', 1, 'Gerente', 'juliana@biofarms.com', md5('senha115')),
(DEFAULT, 4, 'Marcos Ferreira', '78912345600', '11988776644', 1, 'Gerente', 'marcos@agronatura.com', md5('senha116')),
(DEFAULT, 4, 'Isabela Santos', '32198765400', '11977665544', 1, 'Supervisor', 'isabela@agronatura.com', md5('senha117'));
 
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



CREATE VIEW empresaLote as
select * from Empresa join Lote
on idEmpresa = fkEmpresa
order by nomeFantasia asc;

CREATE VIEW plantacaoShimeji AS
select nomeFantasia, idLote, dtPlantacao, dtColheita, dtFrutificacao, tipo from Empresa join Lote
on idEmpresa = fkEmpresa
where tipo = 'Shimeji';

CREATE VIEW nomeEmpresa AS
select usuario.nome,usuario.status_colaborador, nomeFantasia
from Usuario join Empresa
on idEmpresa = fkEmpresa
order by nomeFantasia;

CREATE VIEW plantacaoChampignon AS
select nomeFantasia, idLote, dtPlantacao, dtColheita, dtFrutificacao, tipo from Empresa join Lote
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

desc Lote;

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
    FROM Dados WHERE horarioCaptura >= NOW() - interval 1 DAY;
    
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
JOIN Lote as l on s.fkLote = l.idLote 
JOIN Empresa as e on l.fkEmpresa = e.idEmpresa
JOIN Usuario as u on e.idEmpresa = u.fkEmpresa
GROUP BY hora, s.posicao, u.nome, l.estufa, l.tipo, e.nomeFantasia, idLote, idSensor
ORDER BY temp_max DESC, temp_min DESC, umid_max DESC, umid_min DESC, hora ASC;


SELECT
	hour(horarioCaptura) as Hora, 
	TRUNCATE(temperatura ,2)AS mediaTempDiaria,
    TRUNCATE(umidade ,2) AS mediaUmidDiaria	-- --
    FROM Dados WHERE horarioCaptura >= NOW() - interval 1 DAY
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