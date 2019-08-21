var MyRoutes = require('./MyRoutes.js');
const jwt = require ('jsonwebtoken');
const jwlVerifer = require('express-jwt');
const {generateToken,validateToken} =require('./jwt.js')
const secret = 'secret';
class UsuariosRoutes extends MyRoutes{

    constructor(express, router, sql, bodyParser, config) {
        super(express, router, sql, bodyParser, config);
        /*
        const user = {
          nombre : 'romina',
          contrasenia : 1234
        }
        //Login with token
        /* GET function.
        router.get('/home', jwlVerifer({secret:secret}), function(req, res, next) {
          res.send('Principal Page');
        });

        function createToken(){
          let expirationDate = Math.floor(Date.now()/1000) + 30
          var token = jwt.sign({userID: user.nombre, exp:expirationDate }, secret);
          return token;
        }

        router.post('/login', (req, res) => {
            console.log(req);
            if(req.body.nombre == user.nombre && req.body.contrasenia == user.contrasenia){
              res.send(createToken());
            }else{
              res.sendStatus(400);
            }

        })
        router.use((err, req, res, next) =>{
          if(err.name === 'No autorizado'){
            res.status(500).send(err.message);
          }
        });
        */

       function createToken(){
        let expirationDate = Math.floor(Date.now()/1000) + 30
        var token = jwt.sign({userID: user.nombre, exp:expirationDate }, secret);
        return token;
      }
       router.post('/login', async (req, res) => {

          try{
              sql.connect(config,  err => {
                  if(err) console.log("Control de error");
                  new sql.Request()
                  .query(' EXEC get_user '
                  + ' @nombre = "' + req.body.nombre
                  + '", @contrasenia = "' + req.body.contrasenia
                  + '"', (err, result) => {
                    console.log(result.recordset)
                    let user = result.recordset;
                    console.log(user);
                    if(user === undefined){
                      const error = new Error('Usuario y/o contraseña incorrectos');
                      error.code = 'EREQUEST';
                      throw error;
                    }
                    var token = generateToken(user);
                    token = token.slice(0,20);

                    console.log(user[0].nombre,typeof(user[0].nombre));
                    console.log("token",token,typeof(token));
                    new sql.Request()
                    .query(' EXEC insert_token '
                    + ' @nombre = "' + user[0].nombre
                    + '", @valorToken = "' + token
                    + '"', (err, result) => {
                      res.send(
                        {
                          status: "OK",
                        }
                      );
                    sql.close();
                });
              });

            });
          }
          catch(e){
            console.log("ERROR",e);
          }
        })
/*
       router.use('/', async (req, res, next) => {

        const authHeader = req.get('Authorization');
        if(!authHeader){
          res.status(401).end();
          return;
        }
        console.log('authHeader',authHeader);
/*
        try{
          const token = authHeader.split(' ')[1];
          const payload = await validateToken(token);
          const dbToken = (await connectionPool.request()
            .input('nombre', db.VarChar(30), payload.nombre)
            .input('token', db.VarChar(db.MAX), token)
            .execute('dbo.get_token')).recordset[0];

          if(!dbToken){
            throw new Error();
          }
          req.user = payload;
          next();
        }catch (err) {
          res.status(401).end();
        }
*//*
            try{
              const token = authHeader.split(' ')[1];
              const payload = await validateToken(token);
              sql.connect(config,  err => {
                  if(err) console.log("Control de error");
                  const dbToken = new sql.Request()
                      .query(' EXEC get_token '
                      + ' @nombre = "' + payload.nombre
                      + '", @valorToken = "' + token
                      + '"', (err, result) => {
                        if(!dbToken){
                          throw new Error();
                        }
                        req.user = payload;
                        next();
                      sql.close();
                  });
            });
          }
          catch(e){
            console.log("ERROR",e);
          }
       });
*/
        //Logueo
        router.post('/logeo', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                //const query = 'EXEC Usuarios_Insert '
                new sql.Request()
                .query(' EXEC Logeo '
                + ' @nombre = "' + req.body.nombre
                + '", @contrasenia = "' + req.body.contrasenia
                + '", @logeado = "' + req.body.logeado
                + '", @mensaje = "' + req.body.mensaje + '"', (err, result) => {
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
        //Buscar Usuario
        router.post('/buscarUsuario', function(req, res, next){
                try
                {
                  sql.connect(config, err => {
                      if(err) console.log("Control de error");
                      new sql.Request()
                      .query(' EXEC Buscar_Usuario @nombre = ' + req.body.nombre, (err, result) => {
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
        //Buscar Usuario por empresa
        router.post('/buscarUsuarioPorEmpresa', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC Buscar_UsuarioPorEmpresa'
                +' @idEmpresa = "' + req.body.idEmpresa
                +'", @idUsuario = "'+ req.body.idUsuario + '"', (err, result) => {
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
        //Buscar Usuario por mail
        router.post('/buscarUsuarioPorMail', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC Buscar_UsuarioPorMail @mail = ' + req.body.mail, (err, result) => {
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
        //Buscar perfil
        router.post('/buscarPerfil', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC BuscarPerfil @mailONombre = ' + req.body.mailONombre, (err, result) => {
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
         //ir al perfil
         router.get('/perfil/:id', function(req, res, next){
          try
          {
            sql.close();
            sql.connect(config, err => {
                var idUs = req.params.id
                let equipos, valores , logros , usuarios, suslogros, result
                console.log('id de usuario: ', idUs);
                if(err) console.log("Control de error");
                let queries=[
                  (async()=>{
                    let queryEquipos=new sql.Request()
                    equipos= await queryEquipos.query(' EXEC Listar_EquiposPorUsuario @idUsuario = ' + idUs);
                    return {
                      equipos:equipos.recordset
                    }
                  })(),
                  (async()=>{
                    let queryValores = new sql.Request();
                    valores = await queryValores.query(' EXEC ConsultarValoresUsuario @idUsuario = ' + idUs);
                    return {
                      valores:valores.recordset
                    }
                  })(),
                  (async()=>{
                    let querySusLogros = new sql.Request()
                    suslogros = await querySusLogros.query(' EXEC ConsultarLogrosDeUnUsuario @idUsuario = ' + idUs);
                      return {
                        suslogros:suslogros.recordset
                      }
                  })(),
                  (async()=>{
                    let queryUsuarios = new sql.Request()
                    usuarios= await queryUsuarios.query(' EXEC Usuarios_Get @idUsuario = ' + idUs)
                      return{
                        usuarios:usuarios.recordset
                      }
                  })(),
                  (async()=>{
                    let queryLogros = new sql.Request()
                    logros= await queryLogros.query(' EXEC Logros_EmpresaUsuario @idUsuario = ' + idUs)
                      return{
                        logros:logros.recordset
                      }
                  })(),
                ];
                let resultado=Promise.all(queries).then(
                  (result)=>{
                    sql.close();
                    console.log("Successssss: ")
                    let parseResult={
                      equipos:result[0].equipos,
                      valores:result[1].valores,
                      suslogros:result[2].suslogros,
                      usuarios:result[3].usuarios,
                      logros:result[4].logros
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

        //Cambiar contraseña
        router.post('/cambioContraseña', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC Cambiar_Contraseña '
                + ' @idUsuario = "' + req.body.idUsuario
                + '", @contraseniaactual = "' + req.body.contraseniaactual
                + '", @contrasenianueva = "' + req.body.contrasenianueva + '"', (err, result) => {
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

        //Listar usuarios por empresa
         router.post('/usuariosPorEmpresaPorEquipo', function(req, res, next){
                try
                {
                  sql.connect(config, err => {
                      if(err) console.log("Control de error");
                      new sql.Request()
                      .query('EXEC Listar_UsuariosPorEmpresaPorEquipo @idEquipo = ' + req.body.idEquipo, (err, result) => {
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
        //Listar usuarios por responsable
        router.post('/usuariosPorResponsable', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query('EXEC Listar_UsuariosPorResponsable @idUsuario = ' + req.body.idUsuario, (err, result) => {
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
        //Listar usuarios por rol
        router.post('/usuariosPorRol', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query('EXEC Listar_UsuariosPorRol @rol = ' + req.body.rol, (err, result) => {
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

        //Modificar mail de un Usuario
        router.post('/modificarMailUsuario', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC Usuarios_MailUpdate '
                + ' @idUsuario = "' + req.body.idUsuario
                + '", @mail = "' + req.body.mail + '"', (err, result) => {
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


        //Modificar foto perfil de un Usuario
        router.post('/modificarFotoPerfilUsuario', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query(' EXEC Usuarios_fotoPerfilUpdate '
                + ' @idUsuario = "' + req.body.idUsuario
                + '", @fotoPerfil = "' + req.body.fotoPerfil + '"', (err, result) => {
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



        //Logros que puede obtener un usuario
        router.post('/logrosUsuario', function(req, res, next){
          try
          {
            sql.connect(config, err => {
                if(err) console.log("Control de error");
                new sql.Request()
                .query('EXEC Logros_EmpresaUsuario @idUsuario = ' + req.body.idUsuario, (err, result) => {
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

        // Desligar un usuario de un equipo
         router.post('/borrarUsuarioDelEquipo', function(req, res, next){
      try
      {
        sql.connect(config, err => {
            if(err) console.log("Control de error");
            new sql.Request()
            new sql.Request()
            .query(' EXEC UsuariosEquipos_Delete '
            + ' @idEquipo = "' + req.body.idEquipo
            + '", @idUsuario = "' + req.body.idUsuario + '"', (err, result) => {
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
