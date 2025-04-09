//
const express=require("express");
const bodyParser=require("body-parser");

const app=express();
 
var players=[];

app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({extended:true}));

app.get("/",function(req,res){
   res.render("list",{newplayerList:players});
})
app.post("/",function(req,res){
    var player = req.body.newPlayer;
    players.push(player);
    res.redirect("/");
})
if(players.lenght === 11){
    console.log("bass karo bhaiii");
}

app.listen(1200,function(){
    console.log("Server is running at port 1200");
})
