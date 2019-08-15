const UsuariosRoutes = require( './myRoutes/UsuariosRoutes');
const EquiposRoutes = require('./myRoutes/EquiposRoutes');
const ValoresRoutes = require('./myRoutes/ValoresRoutes');
const LogrosRoutes = require('./myRoutes/LogrosRoutes');
const EmpresasRoutes = require('./myRoutes/EmpresasRoutes');
const NotasRoutes = require('./myRoutes/NotasRoutes');
const PizarrasRoutes = require('./myRoutes/PizarrasRoutes');
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
let equiposRoutes = new EquiposRoutes(express, router, sql, bodyParser, config);
let valoresRoutes = new ValoresRoutes(express, router, sql, bodyParser,config);
let logrosRoutes = new LogrosRoutes(express, router, sql, bodyParser, config);
let empresasRoutes = new EmpresasRoutes(express, router, sql, bodyParser, config);
let notasRoutes = new NotasRoutes(express, router, sql, bodyParser, config);
let pizarrasRoutes = new PizarrasRoutes(express, router, sql, bodyParser, config);

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

//Listar usuarios por equipo
         router.post('/usuariosPorEquipo', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query('EXEC Listar_UsuariosPorEquipo @idEquipo = ' + req.body.idEquipo, (err, result) => {
                  console.dir(result.recordset)
                  let datos = result.recordset;
                  res.send(
                    {
                      status: "OK",
                      data : datos
                    }
                   );
                   sql.close();
              });
            });
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

module.exports = router;
