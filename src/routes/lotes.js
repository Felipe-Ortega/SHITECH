var express = require("express");
var router = express.Router();

var loteController = require("../controllers/loteController");

router.post("/cadastrar", function (req, res) {
    loteController.cadastrar(req, res);
});

router.get("/listar", function (req, res) {
    loteController.listar(req, res);
});

module.exports = router;