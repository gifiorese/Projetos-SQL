var express = require("express");
var app = express();
var mysql = require("mysql");
var bodyParser = require("body-parser");

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'join_us'
});

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/public"));

app.get("/", function(req, res){
	var q = "SELECT COUNT(*) AS count FROM users";
	connection.query(q, function(err, results){
		if (err) throw err;
		var count = results[0].count;
		// res.send("We have " + count + " users registered! :D");
		res.render("home", {data: count});
	});
});

app.post("/register", function(req, res){
	var person = {
		email: req.body.email
	};

	connection.query('INSERT INTO users SET ?', person, function(error, results) {
		if (error) throw error;
		res.redirect("/");
	});
});

app.listen(3000, function(){
	console.log("Server running on port 3000");
});


// app.get("/", function(req, res){
// 	res.send("SOMEONE REQUESTED THIS MESSAGE! :D");
// });

// app.get("/joke", function(req, res){
// 	var joke = "O que uma táboa disse para a outra?  Tá boa?";
// 	res.send(joke);
// });

// app.get("/number", function(req, res){
// 	var num = Math.floor(Math.random() * 10) + 1;
// 	res.send("Your lucky number is: " + num);
// });


