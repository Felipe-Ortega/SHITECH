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

module.exports = {cadastrar, atualizar, listar}