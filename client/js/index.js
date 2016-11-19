var DOMAIN = "http://localhost:3000"

$(function() {
  setup();
  populateMain();
});

var setup = function() {
  // Menu selector
  $('li').on('click', function() {
    var id = $(this).attr('id');
    var backId = $(this).parents('section').attr('id');
    $(this).parents('section').hide();
    $('section#'+id).show();
    $('.back-button').attr('id',backId);
    console.log(id);
  });

  // Back selector
  // sets home as default, temp. fix for 3 levels of menus
  // ex. Home > lost-pet > ;lst-form
  $('.back-button').on('click', function() {
    var id = $(this).attr('id');
    $(this).parents('section').hide();
    $('section#'+id).show();
    $(this).attr('id', 'home');
  });

};

var populateMain = function() {
  var petList = $('.pet-list');
  getPets();
};

function getPets () {
  $.ajax({
    url: `${DOMAIN}/questions.json`, //<<
    success: function (pets) {
      renderPets(pets);
    },
    error: function () {
      alert('Could not load pets, please try again...')
    }
  })
};

// render json for list of pets
function renderPets (pets) {
  var petTemplate = $('#pet-list').html();
  var petList = $('.pet-listing');
  Mustache.parse(petTemplate);

  var petsHTML = pets
    .map(function (pet) {
      return Mustache.render(petTemplate, pet)
    }).join('');
  petList.html(petsHTML);
};
