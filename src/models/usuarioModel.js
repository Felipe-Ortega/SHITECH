
var database = require("../database/config")

function autenticar(email, senha) {
   console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
   var instrucaoSql = `
       SELECT email, senha, fkEmpresa, nome, idRepresentante FROM Usuario WHERE Email = '${email}' AND Senha = MD5('${senha}');`;
   console.log("Executando a instrução SQL: \n" + instrucaoSql);
   return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, email, senha, telefone, cpf, cargo, fkEmpresa) {
   console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha, telefone, cpf, cargo, fkEmpresa);
   
   // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
   //  e na ordem de inserção dos dados.
   var instrucaoSql = `
      INSERT INTO Usuario (nome, status_colaborador, email, senha, telefone, cpf, cargo, fkEmpresa) VALUES ('${nome}', ${1}, '${email}', MD5('${senha}'), '${telefone}', '${cpf}', '${cargo}', ${fkEmpresa});
   `;
   console.log("Executando a instrução SQL: \n" + instrucaoSql);
   return database.executar(instrucaoSql);
}



module.exports = {
   autenticar,
   cadastrar
};
