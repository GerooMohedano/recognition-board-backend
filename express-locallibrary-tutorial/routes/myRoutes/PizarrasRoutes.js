var MyRoutes = require('./MyRoutes.js');

class PizarrasRoutes extends MyRoutes{

    constructor(express, router, sql, bodyParser, config){
        super(express, router, sql, bodyParser, config);

        //Alta Pizarra
        router.post('/altaPizarra', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Pizarras_Insert '
                  + ' @titulo = "' + req.body.titulo
                  + '", @idEquipo = "' + req.body.idEquipo
                  + '", @fechaInicio = "' + req.body.fechaInicio
                  + '", @fechaFin = "' + req.body.fechaFin + '"', (err, result) => {
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

         //Modificar Pizarra
        router.post('/ModificarPizarra', function(req, res, next){
                    try
                    {
                      sql.connect(config, err => {
                          if(err) console.log("Control de error");
                          new sql.Request()
                          .query(' EXEC Pizarras_Update '
                          + ' @idPizarra = "' + req.body.idPizarra
                          + '", @titulo = "' + req.body.titulo
                          + '", @fechaInicio = "' + req.body.fechaInicio
                          + '", @fechaFin = "' + req.body.fechaFin + '"', (err, result) => {
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

         //Borrar Pizarra
        router.post('/BorrarPizarra', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Pizarras_Delete @idPizarra = ' + req.body.idPizarra, (err, result) => {
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

        //Consultar Pizarra de un equipo
        router.post('/consultarPizarra', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC ConsultarPizarraEquipo @idEquipo = ' + req.body.idEquipo, (err, result) => {
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

        router.post('/consultarNotasPizarra', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC ConsultarNotasPizarra @idPizarra = ' + req.body.idPizarra, (err, result) => {
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

        //Consultar Pizarras coincidentes
        router.post('/consultarPizarraCoincidentes', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Buscar_PizarrasCoincidentes'
                  +' @idPizarra = "' + req.body.idPizarra
                  +'", @fechaInicio = "' + req.body.fechaInicio
                  +'", @fechaFin = "' + req.body.fechaFin
                  +'", @idEquipo = "'+ req.body.idEquipo + '"', (err, result) => {
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

         //Consultar Pizarra activa de un usuario
        router.post('/consultarPizarraActivaUsuario', function(req, res, next){
                    try
                    {
                      sql.connect(config, err => {
                          if(err) console.log("Control de error");
                          new sql.Request()
                          .query(' EXEC ConsultarPizarraActivaUsuario @idUsuario = ' + req.body.idUsuario, (err, result) => {
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

         //Consultar Pizarra activa de un equipo
         router.post('/consultarPizarraActivaEquipo', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC ConsultarPizarraActivaEquipo @idEquipo = ' + req.body.idEquipo, (err, result) => {
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

         //Listar pizarras de un equipo
         router.post('/pizarrasEquipo', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Listar_PizarrasDeUnEquipo @idEquipo = ' + req.body.idEquipo, (err, result) => {
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
    }
}

module.exports = PizarrasRoutes;
