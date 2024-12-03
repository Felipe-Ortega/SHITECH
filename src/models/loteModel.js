
var database = require("../database/config");

function cadastrar(fkEmpresa, estufa, tipo) {
  var instrucaoSql = `INSERT INTO Lote (fkEmpresa, estufa, tipo)
   VALUES (${fkEmpresa}, '${estufa}', '${tipo}');`;

  return database.executar(instrucaoSql);
}

function atualizar(dtPlantacao, dtColheita, dtFrutificacao, Lote) {
  var instrucaoSql = `UPDATE Lote SET dtPlantacao = '${dtPlantacao}', dtColheita = '${dtColheita}', dtFrutificacao = '${dtFrutificacao}' WHERE idLote = ${Lote};`;
  return database.executar(instrucaoSql);
}

function listar(fkEmpresa) {
  var instrucaoSql = `SELECT * FROM Lote JOIN Empresa ON idEmpresa = fkEmpresa WHERE fkEmpresa = ${fkEmpresa};`
  return database.executar(instrucaoSql);
}

function kpi1_2(fkEmpresa) {
  var instrucaoSql = `SELECT TRUNCATE(AVG(Temperatura), 2) AS mediaTempDiaria, TRUNCATE(AVG(Umidade), 2) AS mediaUmidDiaria 
 FROM Dados 
 JOIN Sensor ON idSensor = fkSensor 
 JOIN Lote ON idLote = fkLote 
 JOIN Empresa ON idEmpresa = fkEmpresa 
 WHERE horarioCaptura >= NOW() - INTERVAL 1 DAY AND fkEmpresa = ${fkEmpresa};`
  return database.executar(instrucaoSql);
}

function kpi_3temp(fkEmpresa) {
  var instrucaoSql = `SELECT
   HOUR(horarioCaptura) AS horaTemp,
   CASE
   WHEN MAX(Temperatura) - AVG(Temperatura) > ABS(MIN(Temperatura) - AVG(Temperatura)) THEN TRUNCATE(MAX(Temperatura) - AVG(Temperatura), 2) 
   WHEN MAX(Temperatura) - AVG(Temperatura) < ABS(MIN(Temperatura) - AVG(Temperatura)) THEN TRUNCATE(ABS(MIN(Temperatura) - AVG(Temperatura)), 2)
   ELSE TRUNCATE(MAX(Temperatura) - AVG(Temperatura), 2) END AS variacao_temperaturaFINAL
 FROM Dados 
 JOIN Sensor ON idSensor = fkSensor 
 JOIN Lote ON idLote = fkLote 
 JOIN Empresa ON idEmpresa = fkEmpresa 
 WHERE horarioCaptura >= NOW() - INTERVAL 1 DAY AND fkEmpresa = ${fkEmpresa}
 GROUP BY HOUR(horarioCaptura)
 ORDER BY variacao_temperaturaFINAL DESC 
 LIMIT 1;`
  return database.executar(instrucaoSql);
}

function kpi_3umid(fkEmpresa) {
  var instrucaoSql = `SELECT
   HOUR(horarioCaptura) AS horaUmid,
   CASE
   WHEN MAX(Umidade) - AVG(Umidade) > ABS(MIN(Umidade) - AVG(Umidade)) THEN TRUNCATE(MAX(Umidade) - AVG(Umidade), 2) 
   WHEN MAX(Umidade) - AVG(Umidade) < ABS(MIN(Umidade) - AVG(Umidade)) THEN TRUNCATE(ABS(MIN(Umidade) - AVG(Umidade)), 2)
   ELSE TRUNCATE(MAX(Umidade) - AVG(Umidade), 2) END AS variacao_umidadeFINAL
 FROM Dados 
 JOIN Sensor ON idSensor = fkSensor 
 JOIN Lote ON idLote = fkLote 
 JOIN Empresa ON idEmpresa = fkEmpresa 
 WHERE horarioCaptura >= NOW() - INTERVAL 1 DAY AND fkEmpresa = ${fkEmpresa}
 GROUP BY HOUR(horarioCaptura)
 ORDER BY variacao_umidadeFINAL DESC 
 LIMIT 1;`
  return database.executar(instrucaoSql);
}

function buscarUmidTempDia(fkEmpresa) {
  var instrucaoSql = `select truncate(avg(temperatura), 2) as mediaTemp, truncate(avg(umidade), 2) as mediaUmid, hour(horarioCaptura) as horario from Dados 
  JOIN Sensor ON idSensor = fkSensor 
  JOIN Lote ON idLote = fkLote
  JOIN Empresa ON idEmpresa = fkEmpresa 
  where fkEmpresa = ${fkEmpresa}
  group by hour(horarioCaptura) order by horario;`
  return database.executar(instrucaoSql);
}

function buscarUmidTempMes(fkEmpresa) {
  var instrucaoSql = `select truncate(avg(temperatura), 2) as mediaTemp, truncate(avg(umidade), 2) as mediaUmid, month(horarioCaptura) as mes from Dados 
  JOIN Sensor ON idSensor = fkSensor 
  JOIN Lote ON idLote = fkLote
  JOIN Empresa ON idEmpresa = fkEmpresa 
  where fkEmpresa = ${fkEmpresa}
  group by month(horarioCaptura) order by month(horarioCaptura);`
  return database.executar(instrucaoSql);
}

function kpi1_2Lotes(fkEmpresa, idLote) {
  var instrucaoSql = `SELECT TRUNCATE(AVG(Temperatura), 2) AS mediaTempDiariaLote, TRUNCATE(AVG(Umidade), 2) AS mediaUmidDiariaLote
  FROM Dados 
  JOIN Sensor ON idSensor = fkSensor 
  JOIN Lote ON idLote = fkLote 
  JOIN Empresa ON idEmpresa = fkEmpresa 
  WHERE horarioCaptura >= NOW() - INTERVAL 1 DAY AND fkEmpresa = ${fkEmpresa} AND idLote = ${idLote};`
  return database.executar(instrucaoSql);
}

function kpi_3tempLote(fkEmpresa, idLote) {
  var instrucaoSql = `SELECT
    HOUR(horarioCaptura) AS horaTemp,
    CASE
    WHEN MAX(Temperatura) - AVG(Temperatura) > ABS(MIN(Temperatura) - AVG(Temperatura)) THEN TRUNCATE(MAX(Temperatura) - AVG(Temperatura), 2) 
    WHEN MAX(Temperatura) - AVG(Temperatura) < ABS(MIN(Temperatura) - AVG(Temperatura)) THEN TRUNCATE(ABS(MIN(Temperatura) - AVG(Temperatura)), 2)
    ELSE TRUNCATE(MAX(Temperatura) - AVG(Temperatura), 2) END AS variacao_temperaturaFINAL
  FROM Dados 
  JOIN Sensor ON idSensor = fkSensor 
  JOIN Lote ON idLote = fkLote 
  JOIN Empresa ON idEmpresa = fkEmpresa 
  WHERE horarioCaptura >= NOW() - INTERVAL 1 DAY AND fkEmpresa = ${fkEmpresa} AND idLote = ${idLote}
  GROUP BY HOUR(horarioCaptura)
  ORDER BY variacao_temperaturaFINAL DESC 
  LIMIT 1;`
  return database.executar(instrucaoSql);
}

function kpi_3umidLote(fkEmpresa, idLote) {
  var instrucaoSql = `SELECT
    HOUR(horarioCaptura) AS horaUmid,
    CASE
    WHEN MAX(Umidade) - AVG(Umidade) > ABS(MIN(Umidade) - AVG(Umidade)) THEN TRUNCATE(MAX(Umidade) - AVG(Umidade), 2) 
    WHEN MAX(Umidade) - AVG(Umidade) < ABS(MIN(Umidade) - AVG(Umidade)) THEN TRUNCATE(ABS(MIN(Umidade) - AVG(Umidade)), 2)
    ELSE TRUNCATE(MAX(Umidade) - AVG(Umidade), 2) END AS variacao_umidadeFINAL
  FROM Dados 
  JOIN Sensor ON idSensor = fkSensor 
  JOIN Lote ON idLote = fkLote 
  JOIN Empresa ON idEmpresa = fkEmpresa 
  WHERE horarioCaptura >= NOW() - INTERVAL 1 DAY AND fkEmpresa = ${fkEmpresa} AND idLote = ${idLote}
  GROUP BY HOUR(horarioCaptura)
  ORDER BY variacao_umidadeFINAL DESC 
  LIMIT 1;`
  return database.executar(instrucaoSql);
}

function kpi4(tipo) {
  var instrucaoSql = `
SELECT
    quadrante,
    CASE
    WHEN MAX(${tipo}) - avg(${tipo})  > ABS(MIN(${tipo}) - avg(${tipo})) THEN TRUNCATE(MAX(${tipo}) - avg(${tipo}), 2) 
	WHEN MAX(${tipo}) - avg(${tipo})  < ABS(MIN(${tipo}) - avg(${tipo})) THEN TRUNCATE(ABS(MIN(${tipo}) - avg(${tipo})), 2)
    ELSE TRUNCATE(MAX(${tipo}) - avg(${tipo}), 2)  END AS variacao_${tipo}FINAL
FROM Dados JOIN Sensor
ON Dados.fkSensor = Sensor.idSensor
 WHERE horarioCaptura >= NOW() - interval 1 DAY
GROUP BY quadrante 
order by variacao_${tipo}FINAL DESC limit 1;
  `
  return database.executar(instrucaoSql);
}

function buscarTipo(fkEmpresa) {
  var instrucaoSql = `SELECT COUNT(tipo) as qtdTipo, tipo FROM Lote WHERE fkEmpresa = ${fkEmpresa} GROUP BY tipo ;`
  return database.executar(instrucaoSql);
}


function buscarUmidTempDiaLote(fkEmpresa, fkLote) {
  var instrucaoSql = `select truncate(umidade,2) as umidade, truncate(temperatura,2) as temperatura, DATE_SUB(horarioCaptura, INTERVAL 3 HOUR) AS horarioCaptura  from Dados 
  JOIN Sensor ON idSensor = fkSensor 
  JOIN Lote ON idLote = fkLote
  JOIN Empresa ON idEmpresa = fkEmpresa 
 WHERE horarioCaptura >= NOW() - INTERVAL 1 HOUR AND fkEmpresa = ${fkEmpresa} AND fkLote = ${fkLote} AND horarioCaptura <= NOW()
 group by horarioCaptura, umidade, temperatura
 ORDER BY horarioCaptura
 ;`
  return database.executar(instrucaoSql);
}

function buscarUmidTempMesLote(fkEmpresa, fkLote) {
  var instrucaoSql = `select truncate(avg(temperatura), 2) as mediaTemp, truncate(avg(umidade), 2) as mediaUmid, month(horarioCaptura) as mes from Dados 
  JOIN Sensor ON idSensor = fkSensor 
  JOIN Lote ON idLote = fkLote
  JOIN Empresa ON idEmpresa = fkEmpresa 
  where fkEmpresa = ${fkEmpresa} AND fkLote = ${fkLote}
  group by month(horarioCaptura) order by month(horarioCaptura);`
  return database.executar(instrucaoSql);

}
module.exports = { buscarUmidTempDiaLote, kpi4, cadastrar, atualizar, listar, kpi1_2, kpi_3temp, kpi_3umid, buscarUmidTempDia, buscarUmidTempMes, kpi1_2Lotes, kpi_3tempLote, kpi_3umidLote, buscarTipo, buscarUmidTempMesLote }



