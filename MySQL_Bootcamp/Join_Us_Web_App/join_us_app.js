//CONNECTION
const { faker } = require('@faker-js/faker');

var mysql = require('mysql');

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'join_us'
});


// CODE - SELECTING DATA
// var q = 'SELECT COUNT(*) AS total FROM users';
// connection.query(q, function(error, results, fields) {
// 	if (error) throw error;
// 	console.log("Total users: ", results[0].total);
// });
// connection.end();


// CODE - INSERTING ONE USER'S DATA
// var q = 'INSERT INTO users(email) VALUES("wyatt_the_dog@gmail.com")';
// connection.query(q, function(error, results, fields) {
// 	if (error) throw error;
// 	console.log(results);
// });
// connection.end();


// CODE - INSERTING DATA - DYNAMIC
// var q = 'INSERT INTO users SET ?';
// var person = {
// 	email: faker.internet.email(),
// 	created_at: faker.date.past()
// };

// connection.query(q, person, function(error, results) {
// 	if (error) throw error;
// 	console.log(results);
// });
// connection.end();


// console.log(faker.date.past().toString());


// CODE - INSERTING LOTS OF DATA - SMALL INSERT
// var q = 'INSERT INTO users (email, created_at) VALUES ?';
// var data = [
// 	['blah@gmail.com', '2022-03-28 14:02:36'],
// 	['ugh@gmail.com', '2022-03-28 14:02:36'],
// 	['meh@gmail.com', '2022-03-28 14:02:36']
// ];

// connection.query(q, [data], function(error, results) {
// 	if (error) throw error;
// 	console.log(results);
// });
// connection.end();


// CODE - INSERTING LOTS OF DATA - SMALL INSERT
var q = 'INSERT INTO users (email, created_at) VALUES ?';

var data = [];

for(i = 0; i < 500; i++){
	data.push([
		faker.internet.email(),
		faker.date.past()
	]);
};

connection.query(q, [data], function(error, results) {
	if (error) throw error;
	console.log(results);
});
connection.end();
