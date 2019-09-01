var MyRoutes = require('./MyRoutes');

class NotasRoutes extends MyRoutes{
    constructor(express, router, sql, bodyParser, config){
        super(express, router, sql, bodyParser, config);

        router.post('/nuevaNota', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                let creacionNota, evaluacion, evaluacionExcluyente, logrosNoGanados, result
                if(err) console.log("Control de error");
                let queries=[
                  (async()=>{
                    let queryCreacion=new sql.Request()
                    creacionNota= await queryCreacion
                    .query(' EXEC Notas_Insert '
                    + ' @idPizarra = "' + req.body.nombre
                    + '", @idAutor = "' + req.body.idAutor
                    + '", @idDestinatario = "' + req.body.idDestinatario
                    + '", @idValor = "' + req.body.idValor
                    + '", @descripcion = "' + req.body.descripcion
                    + '", @puntuacion = "' + req.body.puntuacion + '"');
                    return {
                      creacionNota:creacionNota.recordset
                    }
                  })(),
                  (async()=>{
                    let queryEvaluacion=new sql.Request()
                    evaluacion= await queryEvaluacion.query(' EXEC ConsultarValoresUsuario @idUsuario =  ' + req.body.idDestinatario);
                    return {
                      evaluacion:evaluacion.recordset
                    }
                  })(),
                  (async()=>{
                    let queryEvaluacionExcluyente = new sql.Request();
                    evaluacionExcluyente = await queryEvaluacionExcluyente
                    .query(' EXEC ConsultarValoresUsuarioExcluyente @idUsuario = ' + req.body.idDestinatario
                    + ', @idEquipo = ' + req.body.idEquipo);
                    return {
                      evaluacionExcluyente:evaluacionExcluyente.recordset
                    }
                  })(),
                  (async()=>{
                    let queryLogrosNoGanados = new sql.Request()
                    logrosNoGanados= await queryLogrosNoGanados
                    .query('  EXEC ConsultarPremiosNoGanados @idEmpresa = ' + req.body.idEmpresa
                    + ', @idUsuario = ' + req.body.idDestinatario);
                      return {
                        logrosNoGanados:logrosNoGanados.recordset
                      }
                  })(),
                ];
                let resultado=Promise.all(queries).then(
                  (result)=>{
                    sql.close();
                    console.log("Success: ")
                    let parseResult={
                      creacionNota:result[0].creacionNota,
                      evaluacion:result[1].evaluacion,
                      evaluacionExcluyente:result[2].evaluacionExcluyente,
                      logrosNoGanados:result[3].logrosNoGanados,
                      idUsuario: req.body.idDestinatario
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
    //Crear Nota
    // router.post('/nuevaNota', function(req, res, next){
    //     try
    //     {
    //       sql.connect(config, err => {
    //           if(err) console.log("Control de error");
    //           new sql.Request()
    //           .query(' EXEC Notas_Insert '
    //           + ' @idPizarra = "' + req.body.nombre
    //           + '", @idAutor = "' + req.body.idAutor
    //           + '", @idDestinatario = "' + req.body.idDestinatario
    //           + '", @idValor = "' + req.body.idValor
    //           + '", @descripcion = "' + req.body.descripcion
    //           + '", @puntuacion = "' + req.body.puntuacion + '"', (err, result) => {
    //             console.dir(result.recordset)
    //             console.log(result.recordset)
    //             let datos = result.recordset;
    //             res.send(
    //               {
    //                 status: "OK",
    //                 data : datos
    //               }
    //              );
    //              sql.close();
    //         });
    //       });
    //     }
    //     catch(e)
    //     {
    //     console.log(e);
    //     res.send({
    //         status: "error",
    //         message: e
    //     });
    //     }
    // });

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

      //Listar TODAS las Notas de un equipo
      router.post('/todasNotasEmpresa', function(req, res, next){
       try
       {
         sql.connect(config, err => {
             if(err) console.log("Control de error");
             new sql.Request()
             .query(' EXEC Listar_TodasNotasDeUnEmpresa @idEmpresa = "' + req.body.idEmpresa
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

      //Listar TODAS las Notas de un valors
      router.post('/todasNotasValor', function(req, res, next){
       try
       {
         sql.connect(config, err => {
             if(err) console.log("Control de error");
             new sql.Request()
             .query(' EXEC Listar_TodasNotasDeUnValor @idValor = "' + req.body.idValor
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
