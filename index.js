const express = require("express");
const mysql = require("mysql");
const session = require('express-session');
const { check, validationResult, checkSchema, body, query } = require('express-validator');

const app = express();
const PORT = process.env.port || 3000

app.set("view engine","ejs");
app.set("views",__dirname + "/public/views")
app.use(express.json({ extended: false }))
app.use(express.urlencoded({extended:false}))
app.use(express.static(__dirname+"/public"))
app.use(session({
    secret:'ASDFGHJKLpoiuytrewq1234567890_)(*&^%$#@!ZXCVBNM',
    resave:false,
    saveUninitialized:true
}))

const auth = (req,res,next) =>{
    if(req.session.user){
        next();
    }else{
        res.redirect('/');
    }
}

const conn = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    port:3306,
    database:'daycare'
});

conn.connect((err)=>{
    if(!err){
        console.log("Connected to Database")
    }else{
        console.log(err.message);
    }
})

app.get("/",(req,res)=>{
    sql = "SELECT * from plan";
    conn.query(sql,(err,result)=>{
        if(!err){
            res.render("index",{plans:result})
        }
    })
    
})

// Login Routes

app.get('/login',(req,res)=>{
    res.render('login',{errors:[]});
})

app.post('/login',[
    check('email','Enter a valid email').isEmail(),
    check('password','Enter password').notEmpty()
],(req,res)=>{
    const errors = validationResult(req);
    if(!errors.isEmpty()){
        res.render('login',{errors:errors.array()});
    }else{
        const { email, password } =  req.body;
        var sql = "SELECT * from users where u_email=? AND u_password=?";
        sql = mysql.format(sql,[email,password]);
        conn.query(sql,(err,result)=>{
            if(!err){
                if(result.length > 0){
                    req.session.user = result[0].u_email;
                    res.redirect('/user/');
                }else{
                    res.render("login",{errors:[{'msg':'User does not exist'}]});
                }
            }
        })
    }
})

// Register Routes

app.get("/register",(req,res)=>{
    res.render("register",{errors:[]});
})

app.post("/register",[
    check("email").isEmail().withMessage('Enter a Valid Email'),
    check('password').isLength({
        min: 6
    }).withMessage('Enter 6 digits password containing numbers and characters'),
    check('name','Enter a valid name').notEmpty(),
    check('address','Enter a valid address').notEmpty(),
    check('phone','Enter a valid phone number').isNumeric()
],(req,res)=>{
    const errors = validationResult(req);
    if(!errors.isEmpty()){
        res.render("register",{errors:errors.array()})
    }else{
        const { name, email, password, address, phone } = req.body;
        var sql = "SELECT * from users where u_email=?";
        conn.query(sql,[email],(err,result)=>{
            if(!err){
                if(result.length > 0){
                    res.render("register",{errors:[{'msg':'User already exits'}]})
                }else{
                    var sql = "INSERT into users values(?,?,?,?,?)";
                    let query = mysql.format(sql,[email,password,name,address,phone]);
                    conn.query(query,(err,result)=>{
                        if(!err){
                            if(result.affectedRows == 1){
                                res.json({message:'succes'})
                            }
                        }
                    })
                }
            }
        })
    }
})



app.get('/user/',auth,(req,res)=>{
    var sql = "select plan.title,plans_bought.p_id,plans_bought.p_time from plans_bought inner join plan on plans_bought.p_id=plan.id where plans_bought.u_email=? order by plans_bought.p_id,plans_bought.p_time";
    let user = 'rehmanmalik17@gmail.com'
    sql = mysql.format(sql,[user]);
    conn.query(sql,(err,result)=>{
        if(!err){
            res.render("dashboard/index",{plans:result, user:'Rehman Ali'});
        }
    })
})

app.listen(PORT, ()=> console.log(`Server running at port ${PORT}`));