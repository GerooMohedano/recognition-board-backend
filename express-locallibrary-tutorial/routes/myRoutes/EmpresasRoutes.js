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
        //Desactivar Usuario de una Empresa
        router.post('/desactivarUsuarioEmpresa', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC UsuarioEmpresa_Desactivate @idUsuario= ' + req.body.idUsuario, (err, result) => {
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
        //Activar Usuario de una Empresa
        router.post('/activarUsuarioEmpresa', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC UsuarioEmpresa_Activate @idUsuario= ' + req.body.idUsuario, (err, result) => {
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
      //Eliminar Usuario de una Empresa
      router.post('/eliminarUsuarioEmpresa', function(req, res, next){
        try
        {
          sql.connect(config, err => {
              if(err) console.log("Control de error");
              new sql.Request()
              .query(' EXEC UsuarioEmpresa_Delete @idUsuario= ' + req.body.idUsuario, (err, result) => {
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
      //Eliminar valor por defecto de una Empresa
      router.post('/eliminarEmpresaValor', function(req, res, next){
        try
        {
          sql.connect(config, err => {
              if(err) console.log("Control de error");
              new sql.Request()
              .query(' EXEC EmpresaValor_Delete @idValor= ' + req.body.idValor, (err, result) => {
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
                let evaluacion, equipos , usuarios, valores, logros, empresas,result
                console.log('id de la empresa: ', idEmp);
                if(err) console.log("Control de error");
                let queries=[
                  (async()=>{
                    let queryEvaluacion=new sql.Request()
                    evaluacion= await queryEvaluacion.query(' EXEC ConsultarEvaluacionEmpresa @idEmpresa = ' + idEmp);
                    return {
                      evaluacion:evaluacion.recordset
                    }
                  })(),
                  (async()=>{
                    let queryEmpresas = new sql.Request();
                    empresas = await queryEmpresas.query(' EXEC Empresas_Get @idEmpresa = ' + idEmp);
                    return {
                      empresas:empresas.recordset
                    }
                  })(),
                  (async()=>{
                    let queryEquipos = new sql.Request()
                    equipos= await queryEquipos.query(' EXEC Listar_EquiposPorEmpresa @idEmpresa = ' + idEmp);
                      return {
                        equipos:equipos.recordset
                      }
                  })(),
                  (async()=>{
                    let queryValores = new sql.Request()
                    valores = await queryValores.query(' EXEC Listar_ValoresEmpresa @idEmpresa = ' + idEmp);
                      return {
                        valores:valores.recordset
                      }
                  })(),
                  (async()=>{
                    let queryLogros = new sql.Request()
                    logros= await queryLogros.query(' EXEC Listar_LogrosEmpresas @idEmpresa = ' + idEmp)
                      return{
                        logros:logros.recordset
                      } 
                  })(),
                  (async()=>{
                    let queryUsuarios = new sql.Request();
                    usuarios = await queryUsuarios.query('EXEC Listar_UsuariosPorEmpresa @idEmpresa = ' + idEmp)
                        return {
                          usuarios:usuarios.recordset
                        }
                  })(),
                ];
                let resultado=Promise.all(queries).then(
                  (result)=>{
                    sql.close();
                    console.log("Succes: ")
                    let parseResult={
                      evaluacion:result[0].evaluacion,
                      empresas:result[1].empresas,
                      equipos:result[2].equipos,
                      valores:result[3].valores,
                      logros:result[4].logros,
                      usuarios:result[5].usuarios
                    }
                    res.send(parseResult)
                  }
                );
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
