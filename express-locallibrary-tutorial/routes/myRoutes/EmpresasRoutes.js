var MyRoutes = require('./MyRoutes.js');

class EmpresasRoutes extends MyRoutes{

    constructor(express, router, sql, bodyParser, config){
        super(express, router, sql, bodyParser, config);

        //Buscar Empresa
        router.post('/buscarEmpresa', function(req, res, next){
                try
                {
                  sql.connect(config, err => {
                      if(err) console.log("Control de error");
                      new sql.Request()
                      .query(' EXEC Buscar_Empresa @nombre = ' + req.body.nombre, (err, result) => {
                        console.dir(result.recordset)
                        console.log(result.recordset)
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

        //Alta Empresa
        router.post('/altaEmpresa', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Empresas_Insert '
                  + ' @nombre = "' + req.body.nombre
                  + '", @direccion = "' + req.body.direccion
                  + '", @telefono = "' + req.body.telefono
                  + '", @logo = "' + req.body.logo
                  + '", @estado = "' + req.body.estado + '"', (err, result) => {
                    console.dir(result.recordset)
                    console.log(result.recordset)
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

        //Modificar Empresa
        router.post('/modificarEmpresa', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Empresas_Update '
                  + ' @idEmpresa = "' + req.body.idEmpresa
               //   + '", @nombre = "' + req.body.nombre
                  + '", @direccion = "' + req.body.direccion
                  + '", @telefono = "' + req.body.telefono + '"', (err, result) => {
                    console.dir(result.recordset)
                    console.log(result.recordset)
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

        //Cambiar imagen de una Empresa
        router.post('/modificarImagenEmpresa', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC Empresas_ImageUpdate '
                + ' @idEmpresa = "' + req.body.idEmpresa
                + '", @logo = "' + req.body.logo + '"', (err, result) => {
                  console.dir(result.recordset)
                  console.log(result.recordset)
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

      //Cambiar estado de una Empresa
      router.post('/modificarEstadoEmpresa', function(req, res, next){
        try
        {
          sql.connect(config, err => {
              if(err) console.log("Control de error");
              new sql.Request()
              .query(' EXEC Empresas_StateUpdate '
              + ' @idEmpresa = "' + req.body.idEmpresa
              + '", @estado = "' + req.body.estado + '"', (err, result) => {
                console.dir(result.recordset)
                console.log(result.recordset)
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
        //Borrar Empresa
        router.post('/borrarEmpresa', function(req, res, next){
                try
                {
                  sql.connect(config, err => {
                      if(err) console.log("Control de error");
                      new sql.Request()
                      .query(' EXEC Empresas_Delete @idEmpresa = ' + req.body.idEmpresa, (err, result) => {
                        console.dir(result.recordset)
                        console.log(result.recordset)
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

        //Consultar evaluación de una Empresa
        router.post('/evaluacionEmpresa', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC ConsultarEvaluacionEmpresa @idEmpresa = ' + req.body.idEmpresa, (err, result) => {
                    console.dir(result.recordset)
                    console.log(result.recordset)
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

        //Activar Empresa
        router.post('/activarEmpresa', function(req, res, next){
                try
                {
                  sql.connect(config, err => {
                      if(err) console.log("Control de error");
                      new sql.Request()
                      .query(' EXEC Empresa_Activate @id= ' + req.body.id, (err, result) => {
                        console.dir(result.recordset)
                        console.log(result.recordset)
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

        //Desactivar Empresa
        router.post('/desactivarEmpresa', function(req, res, next){
                try
                {
                  sql.connect(config, err => {
                      if(err) console.log("Control de error");
                      new sql.Request()
                      .query(' EXEC Empresa_Desactivate @id= ' + req.body.id, (err, result) => {
                        console.dir(result.recordset)
                        console.log(result.recordset)
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
        //ir a la configuracion de empresa
        router.get('/empresaConfig/:id', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                var idEmp = req.params.id
                let evaluacion, equipos , usuarios, valores, logros, empresas
                console.log('id de la empresa: ', idEmp);
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC ConsultarEvaluacionEmpresa @idEmpresa = ' + idEmp, (err, result) => {
                  console.dir(result.recordset)
                  console.log(result.recordset)
                  evaluacion = result.recordset;
                });
                new sql.Request()
                .query(' EXEC Empresas_Get @idEmpresa = ' + idEmp, (err, result) => {
                  console.dir(result.recordset)
                  console.log(result.recordset)
                  empresas  = result.recordset;
                });
                new sql.Request()
                .query(' EXEC Listar_EquiposPorEmpresa @idEmpresa = ' + idEmp, (err, result) => {
                  console.dir(result.recordset)
                  console.log(result.recordset)
                  equipos  = result.recordset;
                });
                new sql.Request()
                .query(' EXEC Listar_ValoresEmpresa @idEmpresa = ' + idEmp, (err, result) => {
                  console.dir(result.recordset)
                  console.log(result.recordset)
                  valores  = result.recordset;
                });
                new sql.Request()
                .query(' EXEC Listar_LogrosEmpresas @idEmpresa = ' + idEmp, (err, result) => {
                  console.dir(result.recordset)
                  console.log(result.recordset)
                  logros  = result.recordset;
                });
                new sql.Request()
                .query('EXEC Listar_UsuariosPorEmpresa @idEmpresa = ' + idEmp, (err, result) => {
                    console.dir(result.recordset)
                    console.log(result.recordset)
                    usuarios = result.recordset;
                   res.send(
                    {
                        status: "OK",
                        empresas: empresas,
                        evaluacion : evaluacion,
                        equipos: equipos,
                        usuarios: usuarios,
                        valores: valores,
                        logros: logros
                    }
                  );
/*-------------------------------*/
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

      //Consultar Histórico sobre el valor de un equipo
      router.post('/HistoricoValorEmpresa', function(req, res, next){
        try
        {
          sql.connect(config, err => {
              if(err) console.log("Control de error");
              new sql.Request()
              .query(' EXEC ConsultarHistoricoValorEmpresa '
              + ' @idEmpresa = "' + req.body.idEmpresa
              + '", @idValor = "' + req.body.idValor + '"', (err, result) => {
               // console.dir(result.recordset)
               // console.log(result.recordset)
                let datos = result.recordset;
                const results = [];
                console.log("----------------------------------");
                datos.forEach(dato => {
                  const index = results.findIndex(unResult => unResult.fechaInicio.getTime() === dato.fechaInicio.getTime())
                  if(index === -1)
                    {results.push(dato);}
                  else
                  { results[index].puntuacion = results[index].puntuacion + dato.puntuacion;  }

                });
                for (let i = 1; i < results.length; i++) {
                  results[i].puntuacion = results[i].puntuacion + results[i - 1].puntuacion;
                }
                res.send(
                  {
                    status: "OK",
                   data : results
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
        /*function CrearArray(item){
          if(item.)
        }*/
    });

    }

}

module.exports = EmpresasRoutes;
