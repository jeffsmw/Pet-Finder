/**
 * Created by macbook on 2016-11-19.
 */

var DOMAIN = 'http://localhost:3000';

$(function () {


    $('form').on('submit', function (event) {
        event.preventDefault();
        var email = $('#log-in-form-email').val();
        var password = $('#log-in-form-password').val();
        // console.log(email);
        // console.log(password);
        $.post(DOMAIN + '/sessions', {email: email, password: password})

    });


});


//get show one user
// $.ajax({
//     url: "/users/1",
//     // data: data,
//     success: function (user) {
//         console.log(user.first_name);
//
//     }
//     // dataType: dataType
// });