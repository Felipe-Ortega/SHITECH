var database = require("../database/config");

function cadastrar(fkEmpresa, estufa, tipo){
   var instrucaoSql = `INSERT INTO Lote (fkEmpresa, estufa, tipo)
   VALUES (${fkEmpresa}, '${estufa}', '${tipo}');`;

 return database.executar(instrucaoSql);    
}

function atualizar(dtPlantacao, dtColheita, dtFrutificacao, Lote){
 var instrucaoSql = `UPDATE Lote SET dtPlantacao = '${dtPlantacao}', dtColheita = '${dtColheita}', dtFrutificacao = '${dtFrutificacao}' WHERE idLote = ${Lote};`;
 return database.executar(instrucaoSql); 
}

function listar(fkEmpresa){
   var instrucaoSql = `SELECT * FROM Lote JOIN Empresa ON idEmpresa = fkEmpresa WHERE fkEmpresa = ${fkEmpresa};`
   return database.executar(instrucaoSql);
}

function kpi1_2(fkEmpresa){
 var instrucaoSql = `SELECT TRUNCATE(AVG(Temperatura), 2) AS mediaTempDiaria, TRUNCATE(AVG(Umidade), 2) AS mediaUmidDiaria 
 FROM Dados 
 JOIN Sensor ON idSensor = fkSensor 
 JOIN Lote ON idLote = fkLote 
 JOIN Empresa ON idEmpresa = fkEmpresa 
 WHERE horarioCaptura >= NOW() - INTERVAL 1000 DAY AND fkEmpresa = ${fkEmpresa};`
 return database.executar(instrucaoSql);
}

function kpi_3temp(fkEmpresa){
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
 WHERE horarioCaptura >= NOW() - INTERVAL 1000 DAY AND fkEmpresa = ${fkEmpresa}
 GROUP BY HOUR(horarioCaptura)
 ORDER BY variacao_temperaturaFINAL DESC 
 LIMIT 1;`
 return database.executar(instrucaoSql);
}

function kpi_3umid(fkEmpresa){
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
 WHERE horarioCaptura >= NOW() - INTERVAL 1000 DAY AND fkEmpresa = ${fkEmpresa}
 GROUP BY HOUR(horarioCaptura)
 ORDER BY variacao_umidadeFINAL DESC 
 LIMIT 1;`
 return database.executar(instrucaoSql);
}

function buscarUmidTempDia(fkEmpresa){
  var instrucaoSql = `select truncate(avg(temperatura), 2) as mediaTemp, truncate(avg(umidade), 2) as mediaUmid, hour(horarioCaptura) as horario from Dados 
  JOIN Sensor ON idSensor = fkSensor 
  JOIN Lote ON idLote = fkLote
  JOIN Empresa ON idEmpresa = fkEmpresa 
  where fkEmpresa = ${fkEmpresa}
  group by hour(horarioCaptura) order by horario;`
  return database.executar(instrucaoSql);
 }

 function buscarUmidTempMes(fkEmpresa){
  var instrucaoSql = `select truncate(avg(temperatura), 2) as mediaTemp, truncate(avg(umidade), 2) as mediaUmid, month(horarioCaptura) as mes from Dados 
  JOIN Sensor ON idSensor = fkSensor 
  JOIN Lote ON idLote = fkLote
  JOIN Empresa ON idEmpresa = fkEmpresa 
  where fkEmpresa = ${fkEmpresa}
  group by month(horarioCaptura) order by month(horarioCaptura);`
  return database.executar(instrucaoSql);
 }

module.exports = {cadastrar, atualizar, listar, kpi1_2, kpi_3temp, kpi_3umid, buscarUmidTempDia, buscarUmidTempMes}

