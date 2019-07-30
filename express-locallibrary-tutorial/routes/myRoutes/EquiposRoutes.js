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
         
    //Borrar valor a un Equipo
        router.post('/borrarValor', function(req, res, next){
            try
            {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC EquiposValores_Delete '
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
                .query(' EXEC UsuariosEquipos_Update '
                + ' @idEquipo = "' + req.body.idEquipo 
                + '", @idUsuario = "' + req.body.nombre 
                + '", @rol = "' + req.body.rol 
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
                  let evaluacion, valores , usuarios, equipos
                  console.log('id del equipo: ', idEq);
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC ConsultarEvaluacionEquipo @idEquipo = ' + idEq, (err, result) => {
                    console.dir(result.recordset)
                    console.log(result.recordset)
                    evaluacion = result.recordset;
                  });
                  new sql.Request()
                  .query(' EXEC Listar_ValoresDeUnEquipo @idEquipo = ' + idEq, (err, result) => {
                    console.dir(result.recordset)
                    console.log(result.recordset)
                    valores  = result.recordset;
                  });
                  new sql.Request()
                  .query(' EXEC Equipos_Get @idEquipo = ' + idEq, (err, result) => {
                    console.dir(result.recordset)
                    console.log(result.recordset)
                    equipos  = result.recordset;
                  });
                  new sql.Request()
                  .query('EXEC Listar_UsuariosPorEquipo @idEquipo = ' + idEq, (err, result) => {
                      console.dir(result.recordset)
                      console.log(result.recordset)
                      usuarios = result.recordset;
                     res.send(
                      {
                          status: "OK",
                          data : evaluacion,
                          valores: valores,
                          usuarios: usuarios,
                          equipos: equipos
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

      //ir a la configuración de un equipo
        router.get('/equipoConfig/:id', function(req, res, next){
        try
        {
          sql.connect(config, err => {
              var idEq = req.params.id
              let valores , usuarios, equipos
              console.log('id del equipo: ', idEq);
              if(err) console.log("Control de error");
              new sql.Request()
              .query(' EXEC Listar_UsuariosPorEquipo @idEquipo = ' + idEq, (err, result) => {
                console.dir(result.recordset)
                console.log(result.recordset)
                usuarios = result.recordset;
              });
              new sql.Request()
              .query(' EXEC Equipos_Get @idEquipo = ' + idEq, (err, result) => {
                console.dir(result.recordset)
                console.log(result.recordset)
                equipos  = result.recordset;
              });
              new sql.Request()
              .query('EXEC Listar_ValoresDeUnEquipo @idEquipo = ' + idEq, (err, result) => {
                  console.dir(result.recordset)
                  console.log(result.recordset)
                  valores = result.recordset;
                 res.send(
                  {
                      status: "OK",
                      valores : valores,
                      usuarios: usuarios,
                      equipos: equipos
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
  
        }
        
}

module.exports = EquiposRoutes;