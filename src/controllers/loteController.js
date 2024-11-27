var loteModel = require("../models/loteModel")

function cadastrar(req, res){
    var fkEmpresa = req.body.fkEmpresa;
    var estufa = req.body.estufa;
    var tipo = req.body.tipo;
    loteModel.cadastrar(fkEmpresa, estufa, tipo)
    .then(function (resultado) 
    {
      res.json(resultado)
    })
    .catch(function (error) {
        console.log(error)
        console.log('Erro ao cadastrar lote', error.sqlMessage)
        res.status(500).json(error.sqlMessage)
    })
}

function atualizar(req, res){
    var dtPlantacao = req.body.dtplantioServer;
    var dtColheita = req.body.dtcolheitaServer;
    var dtFrutificacao = req.body.dtfrutiServer;
    var Lote = req.body.loteServer;
    loteModel.atualizar(dtPlantacao, dtColheita, dtFrutificacao, Lote)
    .then(function (resultado) 
    {
        res.json(resultado)
    })
    .catch(function (error) {
        console.log(error)
        console.log('Erro ao atualizar lote', error.sqlMessage)
        res.status(500).json(error.sqlMessage)
    })
}

function listar(req, res){
    loteModel.listar().then((resultado) => {
        res.status(200).json(resultado)
    })
}

function kpi1_2(req, res){
    loteModel.kpi1_2().then((resultado) => {
        res.status(200).json(resultado)
    })
}

function kpi_3temp(req, res){
    loteModel.kpi_3temp().then((resultado) => {
        res.status(200).json(resultado)
    })
}

function kpi_3umid(req, res){
    loteModel.kpi_3umid().then((resultado) => {
        res.status(200).json(resultado)
    })
}

module.exports = {cadastrar, atualizar, listar, kpi1_2, kpi_3temp, kpi_3umid}    