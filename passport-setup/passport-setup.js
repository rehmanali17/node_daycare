const passport = require('passport');
const GoogleStartegy = require('passport-google-oauth20').Strategy;
const FacebookStrategy = require('passport-facebook').Strategy;
const keys = require('../config')
const conn = require('../dbconfig');
const mysql = require("mysql");

passport.serializeUser((user,done)=>{
    done(null, user.u_email)
})

passport.deserializeUser((email,done)=>{
    var sql = "SELECT * from users where u_email=?";
    conn.query(sql,[email],async (err,result)=>{
        if(!err){
            if(result.length > 0){
                let user = result[0]
                done(null, user);
            }
        }
    })
})

passport.use(new GoogleStartegy({
    clientID : keys.clientID,
    clientSecret: keys.clientSecret,
    callbackURL: '/login/google/redirect'
},(accessToken,refreshToken,profile,done)=>{
    const name = profile.displayName
    const email = profile._json.email
    const image_url = profile._json.picture
    var sql = "SELECT * from users where u_email=?";
        conn.query(sql,[email], async (err,result)=>{
            if(!err){
                const user = {
                    u_email:email,
                    u_name: name,
                    image_url: image_url,
                }
                if(result.length > 0){
                    done(null,result[0])
                }else{
                    var sql = "INSERT into users(u_email,u_name,image_url) values(?,?,?)";
                    let query = mysql.format(sql,[email,name,image_url]);
                    conn.query(query,(err,result)=>{
                        if(!err){
                            if(result.affectedRows == 1){
                                done(null,user)
                            }
                        }
                    })
                }
            }
        })
}))


// passport.use(new FacebookStrategy({
//     clientID: keys.appID,
//     clientSecret: keys.appSecret,
//     callbackURL: "/login/facebook/redirect"
//   },(accessToken, refreshToken, profile, done)=>{
    
//   }
// ));
