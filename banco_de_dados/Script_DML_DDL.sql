-- AMANDA MATOS PEDROZA
-- FELIPE MIGUEL ORTEGA DE SOUZA
-- LAIZA TAVARES
-- LARA SILVA SOARES
-- LUCAS AQUINO CORREIA PAES
-- PEDRO LUIZ DA SILVA JASMIN

CREATE DATABASE Shitech;
USE Shitech;
CREATE TABLE Usuario(
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial varchar (144),
    cnpj CHAR(14),
    telefone char(11),
    status_cliente TINYINT,
    CONSTRAINT fkStatusCliente CHECK (status_cliente in (0, 1))
);

INSERT INTO usuario VALUES
(DEFAULT, 'Comércio de Alimentos do Brasil LTDA', '12345678000190','11987654321' ,1),
(DEFAULT, 'Indústria de Eletrônicos São Paulo S.A.', '23456789000101','11923456789',0),
(DEFAULT, 'Soluções Tecnológicas Integradas EIRELI', '34567890000112','11976543210',0),
(DEFAULT, 'Transporte e Logística Moderna LTDA','45678901000123','11912345678',0),
(DEFAULT, 'Fabricação de Cosméticos Naturais S.A.', '56789012000134','11998765432',1)
;
CREATE TABLE login (
	idLogin int primary key auto_increment,
    email VARCHAR(256),
    senha VARCHAR(100),
    dtAcesso datetime,
    fkUsuario int UNIQUE,
    CONSTRAINT fkUsuarioLogin foreign key (fkUsuario)
    REFERENCES usuario(idUsuario)
)
;

INSERT INTO Login VALUES 
(DEFAULT, 'contato@alimentobrasil.com.br', 'shitech123','2024-09-17 10:30:45', 1),
(DEFAULT,'suporte@eletronicosp.com', 'shitech321','2023-12-25 08:15:00', 2),
(DEFAULT,'info@solucoestecnologia.com', 'shitech234','2023-01-01 23:59:59', 3),
(DEFAULT,'vendas@logisticamoderna.com', 'shitech754','2024-07-04 14:45:30', 4),
(DEFAULT, 'atendimento@cosmeticosnaturais.com', 'shitech723','2023-11-30 06:20:10', 5)
;

SELECT u.razaoSocial AS 'Razão Social', u.cnpj AS 'CNPJ', u.telefone AS 'Telefone', l.email AS 'Email', l.dtAcesso FROM Usuario AS u JOIN Login AS l
    ON idUsuario = fkUsuario
;

CREATE TABLE produto(
id INT PRIMARY KEY AUTO_INCREMENT,
tipo CHAR(10),
CONSTRAINT chkTipo CHECK (tipo in('Shimeji', 'Champignon')),
dia date, -- Acho que podemos juntar em datetime
horario TIME, -- Acho que podemos juntar em datetime
temperatura_celcius DECIMAL(5,2),
umidade DECIMAL(5,2)	
);

INSERT INTO produto (tipo, dia, horario, temperaturaºC, umidade) VALUES
('Champignon','2024-09-01','08:00:00',22.5, 85.0),
('Champignon','2024-09-01','08:30:00',23.0, 80.0),
('Champignon','2024-09-01','09:00:00',21.5, 82.0),
('Shimeji','2024-09-02','14:30:00',22.0, 83.0),
('Shimeji','2024-09-02','15:00:00',23.5, 79.0),
('Shimeji','2024-09-02','15:30:00',21.3, 83.0),
('Champignon','2024-09-03','09:00:00',22.0, 83.0),
('Champignon','2024-09-03','09:30:00',22.5, 83.0),
('Champignon','2024-09-03','10:00:00',23.0, 83.0),
('Shimeji','2024-09-04','12:00:00',22.7, 83.0),
('Shimeji','2024-09-04','12:30:00',23.1, 83.0),
('Shimeji','2024-09-04','13:00:00',21.0, 83.0)
;


