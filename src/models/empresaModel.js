var database = require("../database/config");

function buscarPorId(id) {
  var instrucaoSql = `SELECT * FROM empresa WHERE id = '${id}'`;

  return database.executar(instrucaoSql);
}

function listar() {
  var instrucaoSql = `SELECT id, razao_social, cnpj, codigo_ativacao FROM empresa`;

  return database.executar(instrucaoSql);
}
function buscarMaiorId(){
  var instrucaoSql = `SELECT MAX(idEmpresa) AS idEmpresa FROM empresa`
  return database.executar(instrucaoSql)
}
function buscarPorCnpj(cnpj) {
  var instrucaoSql = `SELECT * FROM empresa WHERE cnpj = '${cnpj}'`;

  return database.executar(instrucaoSql);
}

function cadastrar(razaoSocial, fantasia, cnpj, unidade) {
  var instrucaoSql = `INSERT INTO empresa (razaoSocial, nomeFantasia, cnpj, unidade, status_cliente) VALUES ('${razaoSocial}', '${fantasia}', '${cnpj}', '${unidade}', '1')`;

  return database.executar(instrucaoSql);
}

module.exports = { buscarPorCnpj, buscarPorId, cadastrar, listar, buscarMaiorId };