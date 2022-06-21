const { faker } = require('@faker-js/faker');

var mysql = require('mysql');

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'join_us'
});


// var q = 'SELECT CURTIME() AS time, CURDATE() AS date, NOW() AS now';
// connection.query(q, function(error, results, fields) {
// 	if (error) throw error;
// 	console.log('Date: ', results[0].date.toString());
// 	console.log('Time: ', results[0].time.toString());
// 	console.log('Now: ', results[0].now.toString());
// });
// connection.end();


// var q = 'SELECT 1+1 AS answer';
// connection.query(q, function(error, results, fields) {
// 	if (error) throw error;
// 	console.log(results[0].answer);
// });


// console.log(faker.internet.email());


// console.log(faker.date.past().toString());


// One fake address
// console.log(faker.address.streetAddress());
// console.log(faker.address.city());
// console.log(faker.address.state());


// Multiple addresses
// function GenerateAddress(){
// 	console.log(faker.address.streetAddress());
// 	console.log(faker.address.city());
// 	console.log(faker.address.state());
// }


// for (var i = 0; i < 3; i++){
// 	GenerateAddress(); //Calling the function
// }

