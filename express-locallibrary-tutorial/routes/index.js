const UsuariosRoutes = require( './myRoutes/UsuariosRoutes');
var express = require('express');
var router = express.Router();
var sql = require('mssql');
var bodyParser = require('body-parser');

const config = {
  user: 'Usuario',
  password : '1234',
  server : "localhost\\SQLEXPRESS",
  port : 1433,
  database : 'OnBoardDataBase',
  options: {
    encrypt: true
  }
};
//const pool = new sql.ConnectionPool(config);
router.use(bodyParser.json());

let usuariosRoutes = new UsuariosRoutes(express, router, sql, bodyParser, config);



/* GET function. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

//Listar empresas
router.get('/empresas', function(req, res, next) {
  
  try{
    sql.connect(config, err => {
      if(err) console.log("Control de error");

      new sql.Request()
      .execute('OnBoardDataBase.dbo.Listar_Empresas', (err, result) => {
          console.log(result.recordset); //datos
          let datos = result.recordset;
          res.send({status: "OK",
          data: datos});
      });
    })
  }
  catch(e){
    console.log(e);
    res.send({
      status: "error",
      message: e
    });
  }
});


//Listar Equipos
router.get('/equipos', function(req, res, next){
  try
  {
    sql.connect(config, err => {
      if(err) console.log("Control de error");

      new sql.Request()
      .execute('OnBoardDataBase.dbo.Listar_Equipos', (err, result) => {
        console.log(result.recordset);
        let datos = result.recordset;
        res.send(
          {
            status: "OK",
            data : datos
          }
         );
      });
    })
  }
  catch(e)
  {
    console.log(e);
    res.send({
      status: "error",
      message: e
    });
  }
});

//Listar Equipos por empresa
router.post('/equiposxempresa', function(req, res, next){
  try
  {
    sql.connect(config, err => {
      if(err) console.log("Control de error");
      console.log(req.body.idEmpresa  );
      new sql.Request()
      .input('idEmpresa', req.body.idEmpresa)
      .execute('Listar_EquiposPorEmpresa', (err, result) => {
          console.dir(result.recordset)
          let datos = result.recordset;
          res.send(
            {
              status: "OK",
              data : datos
            }
           );
      });
    })
  }
  catch(e)
  {
    console.log("--------------------------");
    console.log(e);
    res.send({
      status: "error",
      message: e
    });
  }
});

router.post('/equiposxempresa2', function(req, res, next){
  try
  {
    sql.connect(config, err => {
      if(err) console.log("Control de error");
      console.log(req.body.idEmpresa  );
      new sql.Request()
      .query('EXEC Listar_EquiposPorEmpresa @idEMpresa = ' + req.body.idEmpresa, (err, result) => {
          console.dir(result.recordset)
          let datos = result.recordset;
          res.send(
            {
              status: "OK",
              data : datos
            }
           );
      });
    })
  }
  catch(e)
  {
    console.log("--------------------------");
    console.log(e);
    res.send({
      status: "error",
      message: e
    });
  }
});

module.exports = router;
