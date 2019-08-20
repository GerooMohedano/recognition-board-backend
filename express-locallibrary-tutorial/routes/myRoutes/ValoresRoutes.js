var MyRoutes = require('./MyRoutes.js');

class LogrosRoutes extends MyRoutes{

    constructor(express, router, sql, bodyParser, config){
        super(express, router, sql, bodyParser, config);

         //Alta Valor
         router.post('/altaValor', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Valores_Insert @nombre = "' + req.body.nombre
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
         //Modificar Valor
         router.post('/modificarValor', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Valores_Update '
                  + ' @idValor = "' + req.body.idValor
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

         //Borrar Valor
         router.post('/borrarValor', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC Valores_Delete @idValor = ' + req.body.idValor, (err, result) => {
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

         //Insertar valor en una empresa
         router.post('/AgregarValorParaEmpresa', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC EmpresasValores_Insert '
                + ' @idValor = "' + req.body.idValor
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

          //Modificar valor para una empresa
          router.post('/ModificarValorParaEmpresa', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC EmpresasValores_Update '
                  + ' @idValor = "' + req.body.idValor
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

         //Consultar Valores de un usuario
         router.post('/ValoresDeUnUsuario', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC ConsultarValoresUsuario @idUsuario = "' + req.body.idUsuario, (err, result) => {
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

        //Consultar Histórico sobre el valor de un usuario
        router.post('/HistoricoValorUsuario', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC ConsultarHistoricoValorUsuario '
                + ' @idUsuario = "' + req.body.idUsuario
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

module.exports = LogrosRoutes;
