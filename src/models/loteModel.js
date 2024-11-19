var database = require("../database/config");

function cadastrar(fkEmpresa, estufa, tipo){
    var instrucaoSql = `INSERT INTO lote (fkEmpresa, estufa, tipo)
    VALUES (${fkEmpresa}, '${estufa}', '${tipo}');`;

  return database.executar(instrucaoSql);    
}

function atualizar(dtPlantacao, dtColheita, dtFrutificacao, idLote){
  var instrucaoSql = `update lote set dtPlantacao = '${dtPlantacao}', 
  dtColheita = '${dtColheita}', dtFruticacao = '${dtFrutificacao}' where idLote = ${idLote}');`;
  return database.executar(instrucaoSql); 
}

module.exports = {cadastrar, atualizar}