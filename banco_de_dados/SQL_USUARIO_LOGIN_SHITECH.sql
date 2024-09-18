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
    -- WHERE email = emailInformado AND senha = senhaInformada. Este comando está comentado pois nós fomos conversando com o Vitor e
    -- o Leo e caminhamos para um código como se já houvesse uma comparação JS.
;
