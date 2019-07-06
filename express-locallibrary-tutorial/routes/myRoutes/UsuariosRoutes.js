var MyRoutes = require('./MyRoutes.js');

class UsuariosRoutes extends MyRoutes{

    constructor(express, router, sql, bodyParser, config) {
        super(express, router, sql, bodyParser, config);
         //Alta Usuario
         router.post('/altaUsuario', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                //const query = 'EXEC Usuarios_Insert ' 
                new sql.Request()
                .query(' EXEC Usuarios_Insert '
                + ' @nombre = "' + req.body.nombre 
                + '", @contraseña = "' + req.body.contraseña 
                + '", @mail = "' + req.body.mail 
                + '", @fotoPerfil = "' + req.body.fotoPerfil 
                + '", @adminGeneral = "' + req.body.adminGeneral + '"', (err, result) => {
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
        //Listar usuarios por empresa
         router.post('/usuariosPorEmpresa', function(req, res, next){
                try
                {
                  sql.connect(config, err => {
                      if(err) console.log("Control de error");
                      //const query = 'EXEC Usuarios_Insert ' 
                      new sql.Request()
                      .query('EXEC Listar_UsuariosPorEmpresa @idEmpresa = ' + req.body.idEmpresa, (err, result) => {
                        console.dir(result.recordset)
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

         //Listar usuarios por equipo
         router.post('/usuariosPorEquipo', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query('EXEC Listar_UsuariosPorEquipo @idEquipo = ' + req.body.idEquipo, (err, result) => {
                  console.dir(result.recordset)
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

       //Modificar Usuario
         router.post('/modificarUsuario', function(req, res, next){
        try
        {
          sql.connect(config, err => {
              if(err) console.log("Control de error");
              new sql.Request()
              .query(' EXEC Usuarios_Update '
              + ' @idUsuario = "' + req.body.idUsuario 
              + '", @nombre = "' + req.body.nombre 
              + '", @contraseña = "' + req.body.contraseña 
              + '", @mail = "' + req.body.mail 
              + '", @fotoPerfil = "' + req.body.fotoPerfil 
              + '", @adminGeneral = "' + req.body.adminGeneral + '"', (err, result) => {
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
      //Eliminar usuario
         router.post('/eliminarUsuario', function(req, res, next){
        try
        {
          sql.connect(config, err => {
              if(err) console.log("Control de error");
              new sql.Request()
              .query('EXEC Usuarios_Delete @idUsuario = ' + req.body.idUsuario, (err, result) => {
                console.dir(result.recordset)
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
    //Agregar un usuario a un equipo
         router.post('/agregarUsuarioEnEquipo', function(req, res, next){
      try
      {
        sql.connect(config, err => {
            if(err) console.log("Control de error");
            new sql.Request()
            new sql.Request()
            .query(' EXEC UsuariosEquipos_Insert '
            + ' @idEquipo = "' + req.body.idEquipo 
            + '", @idUsuario = "' + req.body.idUsuario 
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
        //ListarUsuarios
         router.get('/usuarios', function(req, res, next){
            try
            {
              sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .execute('OnBoardDataBase.dbo.Listar_Usuarios', (err, result) => {
                  console.log(result.recordset);
                  let datos = result.recordset;
                  res.send({status: "OK",
                   data : datos});
                   sql.close();
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
    }
    
    
}

module.exports = UsuariosRoutes;