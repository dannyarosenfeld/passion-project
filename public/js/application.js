$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
      //login ajax
     $(".list").on('click', '.login', function(event){
      event.preventDefault();

      var ajax = $.ajax({
        type: "GET",
        url: '/login',
        })
      ajax.done(function(login){
        $(".login-or-register-form").empty();
        $(".login-or-register-form").append(login);
      });
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});



//login button


    $(".login-or-register-form").on('submit', '.login-form', function(event){
      event.preventDefault();
      $.ajax({
        type: "POST",
        url: '/users',
        data: $('.login-form').serialize()
        }).done(function(data){


        $(".login-or-register-form").hide();
        $(".welcome").append(data.welcome);
        $('.list').empty();

        $('.list').append(data.a_tag);

        $('.ajaxfollow').append(data.follows);

      });
    });



//asyncrounous voting

  $(".ajaxfollow").on('click', ".vote-button", function(event) {
  event.preventDefault();
  var id = $(this).parent().attr('id');

  $.ajax({
    type: "POST",
    url: "/logs/" + id + "/like",
    data: id

  }).done(function (something){
    something

   var pointSpan = $("#" + something.log_id).children(":last")
   //var pointSpan = $("#" + something.id)

    $(pointSpan).empty().append(something.likes);
    $(pointSpan).css("background", "red");

  });
});








});
