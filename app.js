const express = require('express');
var router = express.Router();
const app = express();
const bodyParser = require("body-parser")
const mysql = require('mysql');
const ejs = require('ejs');
let alert = require('alert');
process.env.PWD = process.cwd()
app.use(bodyParser.urlencoded({ extended: true }))
app.set('view engine', 'ejs');
// Then
app.use(express.static(process.env.PWD + '/public'));
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'dbms'
});
var Id
connection.connect();
app.get('/', function (req, res) {
    // res.sendFile(__dirname + "/index.html")
    res.render("index")
})

app.get('/index', function (req, res) {
    // res.sendFile(__dirname + "/index.html")
    res.render("index")
})

app.get('/admin_login', function (req, res) {
    // res.sendFile(__dirname + "/index.html")
    res.render("admin_login")
})

app.get('/404', function (req, res) {
    // res.sendFile(__dirname + "/index.html")
    res.render("404")
})

app.get('/admin_dashboard', function (req, res) {
    // res.sendFile(__dirname + "/index.html")
    res.render("admin_dashboard")
})



app.get('/sign_up', function (req, res) {
    // res.sendFile(__dirname + "/index.html")
    res.render("sign_up")
})

app.get('/home', function (req, res) {
    // res.sendFile(__dirname + "/index.html")
    console.log(Id)
    res.render("home")
})

app.get('/edit_movi', function (req, res) {

    res.render('edit_movi', { title: 'Movies' });

});

app.post("/user_login", function (req, res) {
    var username = (req.body.email)
    var password = (req.body.pswd)

    connection.query('SELECT * FROM users', function (error, results, fields) {
        if (error) throw error;
        var log = false;

        results.forEach(function (row) {
            if (username == row.user_email && password == row.user_password) {
                log = true
                Id = row.user_id
            }
        });
        if (log) {
            // res.sendFile(__dirname + '/edit.html')
            console.log(Id)
            res.render("home")
        }
        else {
            alert("Wrong Credentials");
            // res.redirect("/login_ad.html")
            // res.send("fail")
        }
    })
})

app.post("/user_signup", function (req, res) {
    var user_email = (req.body.mail)
    var user_password = (req.body.pswd)
    var user_name = (req.body.name)
    var user_phone = (req.body.phone)

    connection.query('INSERT INTO users (user_id,user_email,user_password,user_name,user_phone) VALUES(NULL,?,?,?,?)', [user_email, user_password, user_name, user_phone], function (error, results, fields) {
        if (error) throw error;
        alert("Succesfully Added");
    });

    res.redirect("/index")
})

app.get('/movies', function (req, res) {
    // res.sendFile(__dirname + "/index.html")
    connection.query('SELECT * FROM movies', function (error, movie, fields) {
        if (error) throw error;


        console.log(movie)
        console.log(Id)
        res.render("movies", { movies: movie })
    });

})

app.post("/admini_login", function (req, res) {
    var username = (req.body.email)
    var password = (req.body.pswd)

    connection.query('SELECT * FROM admin', function (error, results, fields) {
        if (error) throw error;
        var log = false;

        results.forEach(function (row) {
            if (username == row.admin_email && password == row.admin_password) {
                log = true
                // Id = row.user_id
            }
        });
        if (log) {
            // res.sendFile(__dirname + '/edit.html')
            res.render("admin_dashboard")
        }
        else {
            alert("Wrong Credentials");
            res.redirect("admin_login")
            // res.send("fail")
        }
    })
})

app.post('/movie_details', function (req, res) {
    // res.sendFile(__dirname + "/index.html")
    var movieid = (req.body.moiveid)
    console.log(movieid)
    connection.query('SELECT * FROM movies where movie_id=?', [movieid], function (error, movie, fields) {
        if (error) throw error;

        console.log(movie)
        res.render("movie_details", { md: movie })
    });

})

app.post('/movie_screen', function (req, res) {
    var movieid = req.body.id
    console.log(movieid)
    connection.query('SELECT * FROM theater where movie_id=?', [movieid], function (error, movie, fields) {
        if (error) throw error;
        connection.query('SELECT * FROM movies where movie_id=?', [movieid], function (error, name, fields) {


            res.render("movie_screen", { md: movie, m: name })
        })
    });

})

app.post('/movie_seat', function (req, res) {

    var showid1
    var theaterid = req.body.theater_id
    var showtime = req.body.show_time
    var showdate = req.body.date
    var movieid = req.body.moiveid

    console.log(theaterid)
    console.log(showtime)
    console.log(showdate)

    connection.query('SELECT * FROM shows WHERE shows.theater_id=? AND shows.show_time=? AND shows.show_date=?', [theaterid, showtime, showdate], function (error, movie, fields) {
        if (error) throw error; // md


        // showid1 = movie[0].show_id

        connection.query('SELECT * FROM movies where movie_id=?', [movieid], function (error, movies, fields) {
            if (error) throw error; // mov

            showid1 = movie[0].show_id
            console.log(showid1)
            connection.query('SELECT * FROM seats1 where show_id=?', [showid1], function (error, seat, fields) {
                if (error) throw error;
                res.render("movie_seat", { md: movie, m: seat, mov: movies, title: theaterid })
            })
        });
    });

})

// app.get('/movie_seat', function (req, res) {
//     // res.sendFile(__dirname + "/index.html")
//     res.render("movie_seat")
// })

app.post('/action1', function (req, res) {

    var action = req.body.action;

    if (action == 'fetch') {
        // alert("hi");
        var query = "SELECT * FROM movies";

        connection.query(query, function (error, data) {

            res.json({
                data: data
            });

        });
    }
    if (action == 'Add') {
        // var movie_id = req.body.first_name;

        var movie_name = req.body.movie_name;
        var movie_runtime = req.body.movie_runtime;
        var movie_genre = req.body.movie_genre;
        var movie_release = req.body.movie_release;
        var movie_toma = req.body.movie_toma;
        var movie_pop = req.body.movie_pop;
        var movie_trailer = req.body.movie_trailer;
        var movie_file = req.body.movie_file;
        var movie_desc = req.body.movie_desc;

        // var author_pub = req.body.author_pub;

        // var title_pub = req.body.title_pub;

        // var jour_pub = req.body.jour_pub;

        // var date_pub = req.body.date_pub;

        var query = `
		INSERT INTO movies 
		(movie_id,movie_name, movie_runtime, movie_genre,movie_release,movie_toma,movie_pop,movie_trailer,movie_file,movie_desc) 
		VALUES (NULL,"${movie_name}", "${movie_runtime}", "${movie_genre}","${movie_release}","${movie_toma}","${movie_pop}","${movie_trailer}","${movie_file}","${movie_desc}")
		`;

        connection.query(query, function (error, data) {

            res.json({
                message: 'Data Added'
            });

        });
    }
    if (action == 'fetch_single') {
        // var movie_id = req.body.movie_id;

        var movie_id = req.body.movie_id;

        var query = `SELECT * FROM movies WHERE movie_id = "${movie_id}"`;

        connection.query(query, function (error, data) {

            res.json(data[0]);

        });
    }

    if (action == 'Edit') {
        var movie_id = req.body.movie_id;

        // var first_name = req.body.first_name;

        var movie_name = req.body.movie_name;
        var movie_runtime = req.body.movie_runtime;
        var movie_genre = req.body.movie_genre;
        var movie_release = req.body.movie_release;
        var movie_toma = req.body.movie_toma;
        var movie_pop = req.body.movie_pop;
        var movie_trailer = req.body.movie_trailer;
        var movie_file = req.body.movie_file;
        var movie_desc = req.body.movie_desc;

        var query = `
		UPDATE movies 
		SET movie_name = "${movie_name}", 
		movie_runtime = "${movie_runtime}",
        movie_genre = "${movie_genre}",  
        movie_release = "${movie_release}",
        movie_toma = "${movie_toma}",
        movie_pop = "${movie_pop}",
        movie_trailer = "${movie_trailer}",
        movie_file = "${movie_file}",
        movie_desc = "${movie_desc}"
		WHERE movie_id = "${movie_id}"
		`;

        connection.query(query, function (error, data) {
            res.json({
                message: 'Data Edited'
            });
        });
    }

    if (action == 'delete') {
        var movie_id = req.body.movie_id;

        var query = `DELETE FROM movies WHERE movie_id = "${movie_id}"`;
        var query2 = `ALTER TABLE movies AUTO_INCREMENT = 1`;

        connection.query(query, function (error, data) {

            // connection.query(query1, function (error, data) {
            res.json({
                message: 'Data Deleted'
            });
            // })

        });

        connection.query(query2, function (error, data) {
            console.log('Done1!');
        });
    }
    // else {
    //     alert("NO");
    // }

});


app.post('/action2', function (req, res) {

    var action = req.body.action;

    if (action == 'fetch') {
        // alert("hi");
        var query = "SELECT * FROM admin";

        connection.query(query, function (error, data) {

            res.json({
                data: data
            });

        });
    }
    if (action == 'Add') {
        var admin_id = req.body.admin_id;

        var admin_email = req.body.admin_email;
        var admin_password = req.body.admin_password;
        var admin_name = req.body.admin_name;
        var admin_phone = req.body.admin_phone;





        // var author_pub = req.body.author_pub;

        // var title_pub = req.body.title_pub;

        // var jour_pub = req.body.jour_pub;

        // var date_pub = req.body.date_pub;

        var query = `
		INSERT INTO admin 
		(admin_id,admin_email, admin_password, admin_name,admin_phone) 
		VALUES (NULL,"${admin_email}", "${admin_password}", "${admin_name}","${admin_phone}")
		`;

        connection.query(query, function (error, data) {

            res.json({
                message: 'Data Added'
            });

        });
    }
    if (action == 'fetch_single') {
        // var admin_id = req.body.admin_id;

        var admin_id = req.body.admin_id;

        var query = `SELECT * FROM admin WHERE admin_id = "${admin_id}"`;

        connection.query(query, function (error, data) {

            res.json(data[0]);

        });
    }

    if (action == 'Edit') {
        var admin_id = req.body.admin_id;

        // var first_name = req.body.first_name;

        var admin_email = req.body.admin_email;
        var admin_password = req.body.admin_password;
        var admin_name = req.body.admin_name;
        var admin_phone = req.body.admin_phone;

        var query = `
		UPDATE admin 
		SET admin_email = "${admin_email}", 
		admin_password = "${admin_password}",
        admin_name = "${admin_name}",  
        admin_phone = "${admin_phone}"
		WHERE admin_id = "${admin_id}"
		`;

        connection.query(query, function (error, data) {
            res.json({
                message: 'Data Edited'
            });
        });
    }

    if (action == 'delete') {
        var admin_id = req.body.admin_id;

        var query = `DELETE FROM admin WHERE admin_id = "${admin_id}"`;
        var query2 = `ALTER TABLE admin AUTO_INCREMENT = 1`;

        connection.query(query, function (error, data) {

            // connection.query(query1, function (error, data) {
            res.json({
                message: 'Data Deleted'
            });
            // })

        });

        connection.query(query2, function (error, data) {
            console.log('Done1!');
        });
    }
    // else {
    //     alert("NO");
    // }

});

app.get('/edit_admin', function (req, res) {

    res.render('edit_admin', { title: 'Admins' });

});

app.post('/action3', function (req, res) {

    var action = req.body.action;

    if (action == 'fetch') {
        // alert("hi");
        var query = "SELECT * FROM users";

        connection.query(query, function (error, data) {

            res.json({
                data: data
            });

        });
    }
    if (action == 'Add') {
        var user_id = req.body.user_id;

        var user_email = req.body.user_email;
        var user_password = req.body.user_password;
        var user_name = req.body.user_name;
        var user_phone = req.body.user_phone;





        // var author_pub = req.body.author_pub;

        // var title_pub = req.body.title_pub;

        // var jour_pub = req.body.jour_pub;

        // var date_pub = req.body.date_pub;

        var query = `
		INSERT INTO users 
		(user_id,user_email, user_password, user_name,user_phone) 
		VALUES (NULL,"${user_email}", "${user_password}", "${user_name}","${user_phone}")
		`;

        connection.query(query, function (error, data) {

            res.json({
                message: 'Data Added'
            });

        });
    }
    if (action == 'fetch_single') {
        // var user_id = req.body.user_id;

        var user_id = req.body.user_id;

        var query = `SELECT * FROM users WHERE user_id = "${user_id}"`;

        connection.query(query, function (error, data) {

            res.json(data[0]);

        });
    }

    if (action == 'Edit') {
        var user_id = req.body.user_id;

        // var first_name = req.body.first_name;

        var user_email = req.body.user_email;
        var user_password = req.body.user_password;
        var user_name = req.body.user_name;
        var user_phone = req.body.user_phone;

        var query = `
		UPDATE users 
		SET user_email = "${user_email}", 
		user_password = "${user_password}",
        user_name = "${user_name}",  
        user_phone = "${user_phone}"
		WHERE user_id = "${user_id}"
		`;

        connection.query(query, function (error, data) {
            res.json({
                message: 'Data Edited'
            });
        });
    }

    if (action == 'delete') {
        var user_id = req.body.user_id;

        var query = `DELETE FROM users WHERE user_id = "${user_id}"`;
        var query2 = `ALTER TABLE users AUTO_INCREMENT = 1`;

        connection.query(query, function (error, data) {

            // connection.query(query1, function (error, data) {
            res.json({
                message: 'Data Deleted'
            });
            // })

        });

        connection.query(query2, function (error, data) {
            console.log('Done1!');
        });
    }
    // else {
    //     alert("NO");
    // }

});


app.get('/edit_user', function (req, res) {

    res.render('edit_user', { title: 'Users' });

});

app.post('/movie_book_com', function (req, res) {


    var user_id = Id
    var show_id = req.body.showids
    var movie_id = req.body.movieiss
    var seat_no = req.body.showseatno
    var theaterid = req.body.theater_id
    var seat_rema = req.body.seat_rema

    var query1 = `SELECT * FROM movies where movie_id = "${movie_id}"`;

    connection.query(query1, function (error, data) {
        console.log('Done1!');

        var query2 = `SELECT * FROM shows where show_id = "${show_id}"`;

        connection.query(query2, function (error, data1) {
            console.log('Done1!');

            var query3 = `SELECT * FROM theater where theater_id = "${theaterid}"`;

            connection.query(query3, function (error, data2) {
                console.log('Done1!');

                connection.query('INSERT INTO ticket(ticket_id,show_id, user_id, seat_no) VALUES (NULL,?,?,?)', [show_id, user_id, seat_no], function (error, book, fields) {
                    if (error) throw error;

                    var query4 = `UPDATE seats1 SET seat_rema = "${seat_rema}"-"${seat_no}" WHERE show_id = "${show_id}"`;

                    connection.query(query4, function (error, data3) {
                        console.log('Done1!');
                    });

                    res.render("movie_book_com", { mo: data, sh: data1, th: data2, title: seat_no })


                });

            });

        });

    });

})

app.get('/user_prof', function (req, res) {

    var userr_id = Id

    connection.query('SELECT * FROM users where user_id=?', [userr_id], function (error, movie, fields) {
        if (error) throw error;

        console.log(movie)
        console.log(Id)
        res.render("user_prof", { us: movie })
    });

    // res.render("user_prof")
});

app.post('/ticke', function (req, res) {

    var action = req.body.action;

    if (action == 'fetch') {
        //         // alert("hi");

        var userr_id = Id

        var query = "SELECT * FROM ticket NATURAL JOIN shows NATURAL JOIN theater NATURAL JOIN movies WHERE ticket.user_id=?";

        connection.query(query, [userr_id], function (error, data) {

            res.json({
                data: data
            });

        });
    }

    //     //  movie_name
    //     //   movie_genre
    //     //   theater_name
    //     //   show_date
    //     //   show_time
    //     //   seat_no
    //     //
    //     //
    //     //
    //     //
    //     //
    //     //

    if (action == 'delete') {
        var ticket_id = req.body.ticket_id;

        var query = `DELETE FROM ticket WHERE ticket_id = "${ticket_id}"`;
        //         var query2 = `ALTER TABLE ticket AUTO_INCREMENT = 1`;

        //          connection.query(query2, function (error, data) {
        //             console.log('Done1!');
        //         });

        connection.query(query, function (error, data) {

            // connection.query(query1, function (error, data) {
            res.json({
                message: 'TIcket has been Cancelled Successfully'
            });
            // })

        });

        //         
    }
    //     // else {
    //     //     alert("NO");
    //     // }

});

app.get('/edit_tickets', function (req, res) {

    res.render('edit_tickets', { title: 'Your Tickets' });

});

app.post('/action4', function (req, res) {

    var action = req.body.action;
    var userr_id = Id

    if (action == 'fetch') {
        // alert("hi");
        var query = "SELECT * FROM users where user_id=?";

        connection.query(query, [userr_id], function (error, data) {

            res.json({
                data: data
            });

        });
    }
    // if (action == 'Add') {
    //     var user_id = req.body.user_id;

    //     var user_email = req.body.user_email;
    //     var user_password = req.body.user_password;
    //     var user_name = req.body.user_name;
    //     var user_phone = req.body.user_phone;





    //     // var author_pub = req.body.author_pub;

    //     // var title_pub = req.body.title_pub;

    //     // var jour_pub = req.body.jour_pub;

    //     // var date_pub = req.body.date_pub;

    //     var query = `
    // 	INSERT INTO users 
    // 	(user_id,user_email, user_password, user_name,user_phone) 
    // 	VALUES (NULL,"${user_email}", "${user_password}", "${user_name}","${user_phone}")
    // 	`;

    //     connection.query(query, function (error, data) {

    //         res.json({
    //             message: 'Data Added'
    //         });

    //     });
    // }
    if (action == 'fetch_single') {
        // var user_id = req.body.user_id;

        var user_id = req.body.user_id;

        var query = `SELECT * FROM users WHERE user_id = "${user_id}"`;

        connection.query(query, function (error, data) {

            res.json(data[0]);

        });
    }

    if (action == 'Edit') {
        var user_id = req.body.user_id;

        // var first_name = req.body.first_name;

        var user_email = req.body.user_email;
        var user_password = req.body.user_password;
        var user_name = req.body.user_name;
        var user_phone = req.body.user_phone;

        var query = `
		UPDATE users 
		SET user_email = "${user_email}", 
		user_password = "${user_password}",
        user_name = "${user_name}",  
        user_phone = "${user_phone}"
		WHERE user_id = "${user_id}"
		`;

        connection.query(query, function (error, data) {
            res.json({
                message: 'Data Edited'
            });
        });
    }

    // if (action == 'delete') {
    //     var user_id = req.body.user_id;

    //     var query = `DELETE FROM users WHERE user_id = "${user_id}"`;
    //     var query2 = `ALTER TABLE users AUTO_INCREMENT = 1`;

    //     connection.query(query, function (error, data) {

    //         // connection.query(query1, function (error, data) {
    //         res.json({
    //             message: 'Data Deleted'
    //         });
    //         // })

    //     });

    //     connection.query(query2, function (error, data) {
    //         console.log('Done1!');
    //     });
    // }
    // else {
    //     alert("NO");
    // }

});


app.get('/edit_us', function (req, res) {

    res.render('edit_us', { title: 'Users' });

});

// app.get('/edit_tickets', function (req, res) {

//     res.render('edit_tickets', { title: 'Your Tickets' });

// });


// app.get('/movie_book_com', function (req, res) {
//     // res.sendFile(__dirname + "/index.html")
//     res.render("movie_book_com")
// })



app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
});

module.exports = router;