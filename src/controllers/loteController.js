var loteModel = require("../models/loteModel")

function cadastrar(req, res){
    var fkEmpresa = req.body.fkEmpresa;
    var estufa = req.body.estufa;
    var tipo = req.body.tipo;
    loteModel.cadastrar(fkEmpresa, estufa, tipo)
    .then(function (res) 
    {
        res.json(res)
    })
    .catch(function (error) {
        console.log(error)
        console.log('Erro ao cadastrar lote', error.sqlMessage)
        res.status(500).json(error.sqlMessage)
    })
}

function atualizar(req, res){
    var dtPlantacao = req.body.dtPlantacao;
    var dtColheita = req.body.dtColheita;
    var dtFrutificacao = req.body.dtFrutificacao;
    var idLote = req.body.idLote;
    loteModel.atualizar(dtPlantacao, dtColheita, dtFrutificacao, idLote)
    .then(function (res) 
    {
        res.json(res)
    })
    .catch(function (error) {
        console.log(error)
        console.log('Erro ao atualizar lote', error.sqlMessage)
        res.status(500).json(error.sqlMessage)
    })
}

module.exports = {cadastrar, atualizar}