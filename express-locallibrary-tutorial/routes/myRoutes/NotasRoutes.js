var MyRoutes = require('./MyRoutes');

class NotasRoutes extends MyRoutes{
    constructor(express, router, sql, bodyParser, config){
        super(express, router, sql, bodyParser, config);

    //Crear Nota
    router.post('/nuevaNota', function(req, res, next){
        try
        {
          sql.connect(config, err => {
              if(err) console.log("Control de error");
              new sql.Request()
              .query(' EXEC Notas_Insert '
              + ' @idPizarra = "' + req.body.nombre
              + '", @idAutor = "' + req.body.idAutor
              + '", @idDestinatario = "' + req.body.idDestinatario
              + '", @idValor = "' + req.body.idValor
              + '", @descripcion = "' + req.body.descripcion
              + '", @puntuacion = "' + req.body.puntuacion + '"', (err, result) => {
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

    //Modificar Nota
    router.post('/modificarNota', function(req, res, next){
        try
        {
          sql.connect(config, err => {
              if(err) console.log("Control de error");
              new sql.Request()
              .query(' EXEC Notas_Update '
              + ' @idNota = "' + req.body.idNota
              + '", @idPizarra = "' + req.body.idPizarra
              + '", @idAutor = "' + req.body.idAutor
              + '", @idDestinatario = "' + req.body.idDestinatario
              + '", @idValor = "' + req.body.idValor
              + '", @descripcion = "' + req.body.descripcion
              + '", @puntuacion = "' + req.body.puntuacion + '"', (err, result) => {
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

   //Borrar Nota
   router.post('/borrarNota', function(req, res, next){
    try
    {
      sql.connect(config, err => {
          if(err) console.log("Control de error");
          new sql.Request()
          .query(' EXEC Notas_Delete @idNota = ' + req.body.idNota, (err, result) => {
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

   //Listar Notas de un usuario
   router.post('/notasUsuario', function(req, res, next){
    try
    {
      sql.connect(config, err => {
          if(err) console.log("Control de error");
          new sql.Request()
          .query(' EXEC Listar_NotasDeUnUsuario @idUsuario = "' + req.body.idUsuario
          + '", @idValor = "' + req.body.idValor
          + '", @idPizarra = "' + req.body.idPizarra + '"', (err, result) => {
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

    //Listar TODAS las Notas de un usuario
    router.post('/todasNotasUsuario', function(req, res, next){
     try
     {
       sql.connect(config, err => {
           if(err) console.log("Control de error");
           new sql.Request()
           .query(' EXEC Listar_TodasNotasDeUnUsuario @idUsuario = "' + req.body.idUsuario
           + '"', (err, result) => {
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

     //Listar TODAS las Notas de un equipo
     router.post('/todasNotasEquipo', function(req, res, next){
      try
      {
        sql.connect(config, err => {
            if(err) console.log("Control de error");
            new sql.Request()
            .query(' EXEC Listar_TodasNotasDeUnEquipo @idEquipo = "' + req.body.idEquipo
            + '"', (err, result) => {
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

module.exports = NotasRoutes;
