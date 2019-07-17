const jwt = require('jsonwebtoken');

const secret = 'Fernandez';
const expirationTime = 50;

exports.generateToken = (user) =>{
        let userString = JSON.stringify(user);
        let token=jwt.sign({userID: user, exp:expirationTime }, secret);
        return token;
};

exports.validateToken = (token) => {
    return new Promise((resolve, reject) => {
        jwt.verify(token, secret, (err, payload) => {
            if (err) {
                reject(err);
            }else{
                resolve(payload);
            }
        });
    });
};