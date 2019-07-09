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
                  + '", @foto = "' + req.body.nombre + '"', (err, result) => {
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
                  + '", @descripcion = "' + req.body.descripcion 
                  + '", @foto = "' + req.body.foto + '"', (err, result) => {
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

        //Borrar Logro
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
                .query(' EXEC ConsultarLogrosDeUnUsuario @idLogro = ' + req.body.idUsuario, (err, result) => {
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