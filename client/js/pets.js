//index
// get retrieve from the server
// var DOMAIN = 'https://secret-forest-36683.herokuapp.com/';
// $.get(
//   DOMAIN + '/pets.json',
//   function (datas) {
//       console.table(datas);
//   }
// );
//
// // //show
// $.get(
//   DOMAIN + '/pets/1.json',
//   function (datas) {
//       console.log(datas);
//   }
// );


//delete in database
// $.ajax({
//   url: DOMAIN + '/pets/1.json',
//   type: 'DELETE',
//   success: function () {
//     console.log("good!!");
//   }
// });

//update
// $.ajax({
//   url: DOMAIN + '/pets/15.json',
//   type: 'patch',
//   data:{'pet[type]': "A",
//         'pet[breed]': "B",
//         'pet[name]': "C",
//         'pet[sex]': "D",
//         'pet[color]': "E",
//         'pet[age]': "F",
//         'pet[date_seen]': "G",
//         'pet[note]': "H",
//         'pet[images]': "I",
//         'pet[lost]': "J",
//         'pet[address]': "K",
//         'pet[longitude]': "L",
//         'pet[latitude]': "M"
//        },
//   success: function () {
//       console.log("good!!");
//   }
// });

// post
// submit data
// $.post(
//   DOMAIN + '/pets.json',
//   {type:  type,
//    breed: breed,
//    name:  name,
//    sex:   sex,
//    color:  color,
//    age:   age,
//    date_seen: date_seen,
//    note:  note,
//    images: images,
//    lost:   lost,
//    address: address,
//    longitude: longitude,
//    latitude:  latitude
//   },
