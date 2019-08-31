var MyRoutes = require('./MyRoutes.js');

class LogrosRoutes extends MyRoutes{
    constructor(express, router, sql, bodyParser, config){
        super(express, router, sql, bodyParser, config);

         //Alta Logro
         router.post('/altaLogro', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Logros_Insert '
                  + ' @nombre = "' + req.body.nombre
                  + '", @descripcion = "' + req.body.descripcion 
                  + '", @idEmpresa = "' + req.body.idEmpresa + '"', (err, result) => {
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

        router.post('/ganarLogro', function(req, res, next){
           try
           {
             sql.connect(config, err => {
                 if(err) console.log("Control de error");
                 new sql.Request()
                 .query(' EXEC GanarPremio '
                 + ' @idLogro = "' + req.body.idLogro
                 + '", @idUsuario = "' + req.body.idUsuario
                 + '", @fecha = "' + req.body.fecha + '"', (err, result) => {
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

        //Modificar Logro
          router.post('/modificarLogro', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Logros_Update '
                  + ' @idLogro = "' + req.body.idLogro 
                  + '", @nombre = "' + req.body.nombre 
                  + '", @descripcion = "' + req.body.descripcion + '"', (err, result) => {
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

        //Borrar Logro --> sp borra en la columna de LogroCondicion, LogroUsuario y Logro
         router.post('/borrarLogro', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Logros_Delete @idLogro = ' + req.body.idLogro, (err, result) => {
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

        //Consultar logros de un usuario
          router.post('/consultarLogrosUsuario', function(req, res, next){
            try
            {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC ConsultarLogrosDeUnUsuario @idLogro = ' + req.body.idLogro, (err, result) => {
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
              
        //Listar condiciones de un logro
        router.post('/condiciones', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC Listar_Condiciones @idLogro = ' + req.body.idLogro, (err, result) => {
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
            //Borrar La condicion de un logro --> usará el boton delete condicion
          router.post('/borrarLogroCondicion', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                    .query(' EXEC LogrosCondiciones_delete '
                  + ' @idLogro = "' + req.body.idLogro 
                  + '", @idCondicion = "' + req.body.idCondicion + '"', (err, result) => {
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
            //Agregar condicion a un Logro
            router.post('/agregarCondicion', function(req, res, next){
              try
              {
                sql.connect(config, err => {
                    if(err) console.log("Control de error");
                    new sql.Request()
                    .query(' EXEC LogrosCondiciones_Insert '
                    + ' @idLogro = "' + req.body.idLogro 
                    + '", @idCondicion = "' + req.body.idCondicion 
                    + '", @idValor = "' + req.body.idValor 
                    + '", @puntuacion = "' + req.body.puntuacion
                    + '", @modificador = "' + req.body.modificador  
                    + '", @excluyente = "' + req.body.excluyente + '"', (err, result) => {
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

module.exports = LogrosRoutes;
