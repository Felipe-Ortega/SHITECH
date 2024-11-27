var database = require("../database/config");

function cadastrar(fkEmpresa, estufa, tipo){
    var instrucaoSql = `INSERT INTO lote (fkEmpresa, estufa, tipo)
    VALUES (${fkEmpresa}, '${estufa}', '${tipo}');`;

  return database.executar(instrucaoSql);    
}

function atualizar(dtPlantacao, dtColheita, dtFrutificacao, Lote){
  var instrucaoSql = `update lote set dtPlantacao = '${dtPlantacao}', dtColheita = '${dtColheita}', dtFrutificacao = '${dtFrutificacao}' where idLote = ${Lote};`;
  return database.executar(instrucaoSql); 
}

function listar(){
    var instrucaoSql = `select * from lote;`
    return database.executar(instrucaoSql);
}

function kpi1_2(){
  var instrucaoSql = `SELECT TRUNCATE(avg(temperatura),2)AS mediaTempDiaria, TRUNCATE(avg(umidade),2) AS mediaUmidDiaria FROM dados WHERE horarioCaptura >= NOW() - interval 1 DAY;`
  return database.executar(instrucaoSql);
}

function kpi_3temp(){
  var instrucaoSql = `SELECT
    HOUR(horarioCaptura) AS horaTemp,
    CASE
    WHEN MAX(temperatura) - avg(temperatura)  > ABS(MIN(temperatura) - avg(temperatura)) THEN TRUNCATE(MAX(temperatura) - avg(temperatura), 2) 
	WHEN MAX(temperatura) - avg(temperatura)  < ABS(MIN(temperatura) - avg(temperatura)) THEN TRUNCATE(ABS(MIN(temperatura) - avg(temperatura)), 2)
    ELSE TRUNCATE(MAX(temperatura) - avg(temperatura), 2)  END AS variacao_temperaturaFINAL
FROM Dados WHERE horarioCaptura >= NOW() - interval 1 DAY
GROUP BY HOUR(horarioCaptura)
order by variacao_temperaturaFINAL DESC limit 1;`
  return database.executar(instrucaoSql);
}

function kpi_3umid(){
  var instrucaoSql = `SELECT
    HOUR(horarioCaptura) AS horaUmid,
        CASE
    WHEN MAX(umidade) - avg(umidade)  > ABS(MIN(umidade) - avg(umidade)) THEN TRUNCATE(MAX(umidade) - avg(umidade), 2) 
	WHEN MAX(umidade) - avg(umidade)  < ABS(MIN(umidade) - avg(umidade)) THEN TRUNCATE(ABS(MIN(umidade) - avg(umidade)), 2)
    ELSE TRUNCATE(MAX(umidade) - avg(umidade), 2)  END AS variacao_umidadeFINAL
FROM Dados WHERE horarioCaptura >= NOW() - interval 1 DAY
GROUP BY HOUR(horarioCaptura)
order by variacao_umidadeFINAL desc limit 1;`
  return database.executar(instrucaoSql);
}

module.exports = {cadastrar, atualizar, listar, kpi1_2, kpi_3temp, kpi_3umid}