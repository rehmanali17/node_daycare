const express = require("express");
const util = require('util');
const mysql = require("mysql");
const bcrypt = require("bcrypt");
const session = require('express-session');
const flash = require('connect-flash');
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
    saveUninitialized:true,
    cookie:{maxAge: 86400}
}))
app.use(flash());

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

const dbquery = util.promisify(conn.query).bind(conn);

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
    if(req.session.user){
        res.redirect('/user/')
    }else{
        res.render('login',{errors:[]});
    }
    
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
        var sql = "SELECT * from users where u_email=?";
        sql = mysql.format(sql,[email,password]);
        conn.query(sql,async (err,result)=>{
            if(!err){
                if(result.length > 0){
                    let user = result[0]
                    const isMatch = await bcrypt.compare(password,user.u_password)
                    if(!isMatch){
                        res.render("login",{errors:[{'msg':'Incorrect Credentials'}]});
                    }else{
                        req.session.user = user.u_email;
                        res.redirect('/user/');
                    }
                    
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
        conn.query(sql,[email], async (err,result)=>{
            if(!err){
                if(result.length > 0){
                    res.render("register",{errors:[{'msg':'User already exits'}]})
                }else{
                    const salt = await bcrypt.genSalt(10)
                    const hashedPassword = await bcrypt.hash(password,salt)
                    var sql = "INSERT into users values(?,?,?,?,?)";
                    let query = mysql.format(sql,[email,hashedPassword,name,address,phone]);
                    conn.query(query,(err,result)=>{
                        if(!err){
                            if(result.affectedRows == 1){
                                req.session.user = email;
                                res.redirect('/user/');
                            }
                        }
                    })
                }
            }
        })
    }
})


app.get('/contact', (req,res)=>{
    res.render("contact",{errors: [], msgs:[]});
})

app.post("/contact",[
    check("email").isEmail().withMessage('Enter a Valid Email'),
    check('address','Enter a valid address').notEmpty(),
    check('phone','Enter a valid phone number').isNumeric(),
    check("message", "Enter the message").notEmpty()
],(req,res)=>{
    const errors = validationResult(req);
    if(!errors.isEmpty()){
        res.render("contact",{errors:errors.array(), msgs:[]})
    }else{
        const { address, email, message, phone } = req.body;
        var sql = "Insert into messages(m_email, m_phone, m_address, m_message) Values(?,?,?,?)";
        sql = mysql.format(sql,[email,phone,address,message]);
        conn.query(sql,(err,result)=>{
            if(!err){
                if(result.affectedRows > 0){
                    res.render("contact",{msgs:[{'msg':'Message sent successfully'}], errors:[]})
                }else{
                    res.render("contact",{errors: [{'msg':'Error sending the message'}], msgs:[]});
                }
            }
        })
    }
})





app.get('/user/',auth,(req,res)=>{
    var sql = "select plan.title,plans_bought.id,plans_bought.p_id,plans_bought.p_time from plans_bought inner join plan on plans_bought.p_id=plan.id where plans_bought.u_email=? order by plans_bought.p_id,plans_bought.p_time";
    let user = req.session.user;
    sql = mysql.format(sql,[user]);
    conn.query(sql,(err,result)=>{
        if(!err){
            res.render("dashboard/index",{plans:result, user:req.session.user, msg: req.flash('message') });
        }
    })
})

app.get('/user/plan',auth,(req,res)=>{
    const { id, time } = req.query;
    var sql = "SELECT * from plan where id=?";
    conn.query(sql,[id],(err,result)=>{
        if(!err){
            if(result.length > 0){
               res.render('dashboard/plan',{ plan:result[0], time:time }) 
            }
        }
    })
})

app.get('/user/buy_plan/:id',auth,(req,res)=>{
    const { id } = req.params;
    var sql = "SELECT * from plan where id=?";
    conn.query(sql,[id],(err,result)=>{
        if(!err){
            if(result.length > 0){
               res.render('dashboard/buy-plan',{ plan:result[0], id }) 
            }
        }
    })
})

app.post('/user/buy_plan',(req,res)=>{
    const { id , time } = req.body
    const user = req.session.user
    var sql = "INSERT into plans_bought(p_id,u_email,p_time) VALUES(?,?,?)";
    sql = mysql.format(sql,[id,user,time]);
    conn.query(sql,(err,result)=>{
        if(!err){
            if(result.affectedRows > 0){
                req.flash('message', 'Plan bought successfully');
                res.redirect('/user/');
            }
        }
    })
})

app.get('/user/update_profile',auth,(req,res)=>{
    let email = req.session.user;
    var sql = "SELECT * from users where u_email=?";
    conn.query(sql,[email],(err,result)=>{
        if(!err){
            res.render("dashboard/update-profile",{errors: [], msgs:[], user:result[0]});
        }
    })
    
})



app.post("/user/update_profile",[
    check('address','Enter a valid address').notEmpty(),
    check('phone','Enter a valid phone number').isNumeric(),
    check("name", "Enter the message").notEmpty(),
    check('password').isLength({
        min: 6
    }).withMessage('Enter 6 digits password containing numbers and characters'),
],async (req,res)=>{
    const errors = validationResult(req);
    let email = req.session.user;
    var rows = await dbquery("SELECT * from users where u_email=?",[email]);
    var user = rows[0]
    if(!errors.isEmpty()){
        console.log(user)
        res.render("dashboard/update-profile",{errors:errors.array(), msgs:[], user: user})
    }else{
        const { address, name, password, phone } = req.body;
        var sql = "UPDATE users set u_name=?,u_password=?,u_phone=?,u_address=? where u_email=?";
        sql = mysql.format(sql,[name,password,phone,address,email]);
        conn.query(sql, async (err,result)=>{
            if(!err){
                if(result.affectedRows > 0){
                    var rows = await dbquery("SELECT * from users where u_email=?",[email])
                    var user = rows[0]
                    res.render("dashboard/update-profile",{msgs:[{'msg':'Profile updated successfully'}], errors:[], user: user})
                }else{
                    res.render("dashboard/update-profile",{errors: [{'msg':'Error updating the profile'}], msgs:[], user: user});
                }
            }
        })
    }
})

app.post('/user/delete_plan',(req,res)=>{
    const { id } = req.body;
    var sql="DELETE from plans_bought where id=?";
    sql = mysql.format(sql,[id]);
    conn.query(sql,(err,result)=>{
        if(!err){
            if(result.affectedRows > 0){
                res.json({'token':1})
            }else{
                res.json({'token':0})
            }
        }
    })
})

app.get('/user/logout',(req,res)=>{
    req.session.user = null;
    res.redirect('/');
})

app.listen(PORT, ()=> console.log(`Server running at port ${PORT}`));