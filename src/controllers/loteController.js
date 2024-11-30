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
    var fkEmpresa = req.body.fkempresaServer;
    loteModel.listar(fkEmpresa).then((resultado) => {
        res.status(200).json(resultado)
    }).catch(
        function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        }
    );
}

function kpi1_2(req, res){
    var fkEmpresa = req.body.fkempresaServer
    loteModel.kpi1_2(fkEmpresa).then((resultado) => {
        res.status(200).json(resultado)
    }).catch(
        function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao puxar dados da kpi 2. Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        }
    );
}

function kpi_3temp(req, res){
    var fkEmpresa = req.body.fkempresaServer;
    loteModel.kpi_3temp(fkEmpresa).then((resultado) => {
        res.status(200).json(resultado)
    }).catch(
        function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao puxar dados da kpi 3 temperatura. Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        }
    );
}

function kpi_3umid(req, res){
    var fkEmpresa = req.body.fkempresaServer;
    loteModel.kpi_3umid(fkEmpresa).then((resultado) => {
        res.status(200).json(resultado)
    }).catch(
        function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao puxar dados da kpi 3 umidade. Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        }
    );
}

function buscarUmidTempDia(req, res){
    var fkEmpresa = req.body.fkempresaServer;
    loteModel.buscarUmidTempDia(fkEmpresa).then((resultado) => {
        res.status(200).json(resultado)
    }).catch(
        function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao puxar dados para o gráfico! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        }
    );
}

function buscarUmidTempMes(req, res){
    var fkEmpresa = req.body.fkempresaServer;
    loteModel.buscarUmidTempMes(fkEmpresa).then((resultado) => {
        res.status(200).json(resultado)
    }).catch(
        function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao puxar dados para o gráfico! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        }
    );
}

function kpi1_2Lotes(req, res){
    var fkEmpresa = req.body.fkempresaServer
    var idLote = req.body.idLoteServer
    loteModel.kpi1_2Lotes(fkEmpresa, idLote).then((resultado) => {
        res.status(200).json(resultado)
    }).catch(
        function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao puxar dados da kpi 2. Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        }
    );
}

function kpi_3tempLote(req, res){
    var fkEmpresa = req.body.fkempresaServer;
    var idLote = req.body.idLoteServer
    loteModel.kpi_3tempLote(fkEmpresa, idLote).then((resultado) => {
        res.status(200).json(resultado)
    }).catch(
        function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao puxar dados da kpi 3 temperatura. Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        }
    );
}

function kpi_3umidLote(req, res){
    var fkEmpresa = req.body.fkempresaServer;
    var idLote = req.body.idLoteServer
    loteModel.kpi_3umidLote(fkEmpresa, idLote).then((resultado) => {
        res.status(200).json(resultado)
    }).catch(
        function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao puxar dados da kpi 3 umidade. Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        }
    );
}

module.exports = {cadastrar, atualizar, listar, kpi1_2, kpi_3temp, kpi_3umid, buscarUmidTempDia, buscarUmidTempMes, kpi1_2Lotes, kpi_3tempLote, kpi_3umidLote}    