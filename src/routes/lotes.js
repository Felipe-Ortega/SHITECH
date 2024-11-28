var express = require("express");
var router = express.Router();

var loteController = require("../controllers/loteController");

router.post("/cadastrar", function (req, res) {
    loteController.cadastrar(req, res);
});

router.get("/listar", function (req, res) {
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

module.exports = router;