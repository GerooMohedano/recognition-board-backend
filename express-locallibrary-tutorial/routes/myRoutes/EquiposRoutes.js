var MyRoutes = require('./MyRoutes.js');

class EquiposRoutes extends MyRoutes{

    constructor(express, router, sql, bodyParser, config){
        super(express, router, sql, bodyParser, config);

    //Buscar Equipo
        router.post('/buscarEquipo', function(req, res, next){
            try
            {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC Buscar_Equipo @nombre = ' + req.body.nombre, (err, result) => {
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

    //Alta Equipo
        router.post('/altaEquipo', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Equipos_Insert '
                  + ' @nombre = "' + req.body.nombre
                  + '", @imagen = "' + req.body.imagen
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

    //Modificar Equipo
        router.post('/modificarEquipo', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Equipos_Update '
                  + ' @idEquipo = "' + req.body.idEquipo
                  + '", @nombre = "' + req.body.nombre
                  + '", @imagen = "' + req.body.imagen
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

        //Modificar Nombre Equipo
            router.post('/modificarNombreEquipo', function(req, res, next){
                try
                {
                  sql.connect(config, err => {
                      if(err) console.log("Control de error");
                      new sql.Request()
                      .query(' EXEC Equipos_Update_Name '
                      + ' @idEquipo = "' + req.body.idEquipo
                      + '", @nombre = "' + req.body.nombre + '"', (err, result) => {
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

    //Borrar Equipo
        router.post('/BorrarEquipo', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Equipos_Delete @idEquipo = ' + req.body.idEquipo, (err, result) => {
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

    //Listar Equipos por empresa
        router.post('/equiposPorEmpresa', function(req, res, next){
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

    //Listar valores de un Equipo
        router.post('/valoresEquipo', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Listar_ValoresDeUnEquipo @idEquipo = "' + req.body.idEquipo , (err, result) => {
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

    //Listar Sprints de un Equipo
         router.post('/sprints', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Listar_PizarrasDeUnEquipo @idEquipo = "' + req.body.idEquipo , (err, result) => {
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

    //Agregar valor a un Equipo
        router.post('/valorEnEquipo', function(req, res, next){
            try
            {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC EquiposValores_Insert '
                + ' @idValor = "' + req.body.idValor
                + '", @idEquipo = "' + req.body.idEquipo + '"', (err, result) => {
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

     //Modificar valor a un Equipo: ACTIVAR
        router.post('/activarValor', function(req, res, next){
            try
            {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC EquiposValores_Activate '
                + ' @idValor = "' + req.body.idValor
                + '", @idEquipo = "' + req.body.idEquipo + '"', (err, result) => {
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

    //Modificar valor a un Equipo: DESACTIVAR
        router.post('/desactivarValor', function(req, res, next){
            try
            {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC EquiposValores_Desactivate '
                + ' @idValor = "' + req.body.idValor
                + '", @idEquipo = "' + req.body.idEquipo + '"', (err, result) => {
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

    //Cambiar admin de un equipo -- MODIFICAR
        router.post('/cambiarAdm', function(req, res, next){
            try
            {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC CambiarAdminEquipo '
                + ' @idEquipo = "' + req.body.idEquipo
                + '", @idViejoAdmin = "' + req.body.idViejoAdmin
                + '", @idNuevoAdmin = "' + req.body.idNuevoAdmin + '"', (err, result) => {
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

        router.post('/equiposxempresa2', function(req, res, next){
        try
        {
        sql.connect(config, err => {
            if(err) console.log("Control de error");
            console.log(req.body.idEmpresa  );
            new sql.Request()
            .query('EXEC Listar_EquiposPorEmpresa @idEmpresa = ' + req.body.idEmpresa, (err, result) => {
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

       //Consultar evaluacion de un equipo
       router.post('/evaluacionEquipo', function(req, res, next){
        try
        {
          sql.connect(config, err => {
              if(err) console.log("Control de error");
              new sql.Request()
              .query(' EXEC ConsultarEvaluacionEquipo @idEquipo = "' + req.body.idEquipo , (err, result) => {
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

        //ir al equipo
        router.get('/equipo/:id', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                var idEq = req.params.id
                let evaluacion, usuarios, equipos, pizarras, result
                console.log('id del equipo: ', idEq);
                if(err) console.log("Control de error");
                let queries=[
                  (async()=>{
                    let queryEvaluacion=new sql.Request()
                    evaluacion= await queryEvaluacion.query(' EXEC ConsultarEvaluacionEquipo @idEquipo =  ' + idEq);
                    return {
                      evaluacion:evaluacion.recordset
                    }
                  })(),
                  (async()=>{
                    let queryPizarra = new sql.Request();
                    pizarras = await queryPizarra.query(' EXEC ConsultarPizarraEquipo @idEquipo = ' + idEq);
                    return {
                      pizarras:pizarras.recordset
                    }
                  })(),
                  (async()=>{
                    let queryEquipos = new sql.Request()
                    equipos= await queryEquipos.query('  EXEC Equipos_Get @idEquipo = ' + idEq);
                      return {
                        equipos:equipos.recordset
                      }
                  })(),
                  (async()=>{
                    let queryUsuarios = new sql.Request()
                    usuarios = await queryUsuarios.query(' EXEC Listar_UsuariosPorEquipo @idEquipo = ' + idEq);
                      return {
                        usuarios:usuarios.recordset
                      }
                  })(),
                ];
                let resultado=Promise.all(queries).then(
                  (result)=>{
                    sql.close();
                    console.log("Success: ")
                    let parseResult={
                      evaluacion:result[0].evaluacion,
                      pizarras:result[1].pizarras,
                      equipos:result[2].equipos,
                      usuarios:result[3].usuarios
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

      //ir a la configuración de un equipo
        router.get('/equipoConfig/:id', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                var idEq = req.params.id
                let valores, usuarios, equipos, result
                console.log('id del equipo: ', idEq);
                if(err) console.log("Control de error");
                let queries=[
                  (async()=>{
                    let queryUsuarios=new sql.Request()
                    usuarios= await queryUsuarios.query(' EXEC Listar_UsuariosPorEquipo @idEquipo = ' + idEq);
                    return {
                      usuarios:usuarios.recordset
                    }
                  })(),
                  (async()=>{
                    let queryEquipos = new sql.Request();
                    equipos = await queryEquipos.query('  EXEC Equipos_Get @idEquipo = ' + idEq);
                    return {
                      equipos:equipos.recordset
                    }
                  })(),
                  (async()=>{
                    let queryValores = new sql.Request()
                    valores= await queryValores.query(' EXEC Listar_ValoresDeUnEquipo @idEquipo = ' + idEq);
                      return {
                        valores:valores.recordset
                      }
                  })(),
                  ];
                let resultado=Promise.all(queries).then(
                  (result)=>{
                    sql.close();
                    console.log("Success: ")
                    let parseResult={
                      usuarios:result[0].usuarios,
                      equipos:result[1].equipos,
                      valores:result[2].valores
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
        router.post('/HistoricoValorEquipo', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC ConsultarHistoricoValorEquipo '
                + ' @idEquipo = "' + req.body.idEquipo
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

module.exports = EquiposRoutes;
