var empresaModel = require("../models/empresaModel");


function buscarMaiorId(req,res){
    empresaModel.buscarMaiorId().then((resultado) => {
      res.status(200).json(resultado)
    }).catch(
      function (erro) {
          console.log(erro);
          console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
          res.status(500).json(erro.sqlMessage);
      }
  );
}
function buscarPorCnpj(req, res) {
  var cnpj = req.query.cnpj;

  empresaModel.buscarPorCnpj(cnpj).then((resultado) => {
    res.status(200).json(resultado)
  }).catch(
    function (erro) {
        console.log(erro);
        console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    }
);
}

function listar(req, res) {
  empresaModel.listar().then((resultado) => {
    res.status(200).json(resultado);
  }).catch(
    function (erro) {
        console.log(erro);
        console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    }
);
}

function buscarPorId(req, res) {
  var id = req.params.id;

  empresaModel.buscarPorId(id).then((resultado) => {
    res.status(200).json(resultado);
  }).catch(
    function (erro) {
        console.log(erro);
        console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    }
);
}

function cadastrar(req, res) {
  var cnpj = req.body.cnpjServer;
  var fantasia = req.body.nomefantasiaServer;
  var razaoSocial = req.body.razaosocialServer;
  var unidade = req.body.unidadeServer;

  empresaModel.buscarPorCnpj(cnpj).then((resultado) => {
    if (resultado.length > 0) {
      res
        .status(401)
        .json({ mensagem: `A empresa com o CNPJ ${cnpj} já existe` });
    } else {
      empresaModel.cadastrar(razaoSocial, fantasia, cnpj, unidade).then((resultado) => {
        res.status(201).json(resultado);
      }).catch((erro) => { // O .catch deve estar diretamente após este .then
        console.log("\nHouve um erro ao cadastrar a empresa! Erro:", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
      });
    }
  }).catch((erro) => { // Este .catch captura erros de buscarPorCnpj
    console.log("\nHouve um erro ao buscar o CNPJ! Erro:", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });}
  

module.exports = {
  buscarPorCnpj,
  buscarPorId,
  buscarMaiorId,
  cadastrar,
  listar,
};
