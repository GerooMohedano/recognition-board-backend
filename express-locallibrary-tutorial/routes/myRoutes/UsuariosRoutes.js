var MyRoutes = require('./MyRoutes.js');

class UsuariosRoutes extends MyRoutes{

    constructor(express, router, sql, bodyParser, config) {
        super(express, router, sql, bodyParser, config);

        //ALta Usuario
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