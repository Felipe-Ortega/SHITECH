var express = require("express");
var router = express.Router();

var loteController = require("../controllers/loteController");

router.post("/cadastrar", function (req, res) {
    loteController.cadastrar(req, res);
});

router.post("/listar", function (req, res) {
    loteController.listar(req, res);
});

router.post("/atualizar", function (req, res) {
    loteController.atualizar(req, res);
});

router.post("/kpi1_2", function (req, res) {
    loteController.kpi1_2(req, res);
});

router.post("/kpi_3temp", function (req, res) {
    loteController.kpi_3temp(req, res);
});

router.post("/kpi_3umid", function (req, res) {
    loteController.kpi_3umid(req, res);
});

router.post("/buscarUmidTempDia", function (req, res) {
    loteController.buscarUmidTempDia(req, res);
});

router.post("/buscarUmidTempMes", function (req, res) {
    loteController.buscarUmidTempMes(req, res);
});

router.post("/kpi1_2Lotes", function (req, res) {
    loteController.kpi1_2Lotes(req, res);
});

router.post("/kpi_3tempLote", function (req, res) {
    loteController.kpi_3tempLote(req, res);
});

router.post("/kpi_3umidLote", function (req, res) {
    loteController.kpi_3umidLote(req, res);
});


router.get("/kpi4_geral/:tipo", function (req,res){
    loteController.kpi4(req,res);
})


router.get("/buscarTipo/:fkEmpresa", function (req,res){
    loteController.buscarTipo(req,res);
})

router.get("/buscarUmidTempDiaLote/:tipo/:fkEmpresa/:fkLote", function (req,res){
    loteController.buscarUmidTempDiaLote(req,res)
})
module.exports = router;