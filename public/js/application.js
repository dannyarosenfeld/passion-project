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



//asyncrounous liking for follows partial

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

   $(pointSpan).empty().append("<p id='likecolor'>" + something.likes + "</p>" + " " + "Favorited this log");
   $("#likecolor").css("color", "#43A78C");
   $("#likecolor").css("float", "left");
 });
});


//show create log form

$("body").on('click',"#new-log", function(event) {
  event.preventDefault();

  $.ajax({
    type: "get",
    url: "/logs/new"

  }).done(function (data){

    $("#log-form-div").append(data);
  });
});


//submit create log form

$("#log-form-div").on('submit',"#log-form", function(event) {

  event.preventDefault();
  var inputs = $(this).serialize();

  $.ajax({
    type: "post",
    url: "/logs",
    data: inputs

  }).done(function (data){

    $("#loglist").append(data);
    $("#log-form").hide();
  });
});

// asyncronous following
//$(".ajaxfollow").on('click', ".vote-button", function(event) {
$(".ajaxfollow").on('submit', ".followbut", function(event) {

  event.preventDefault();
  id = $(this).parent().attr('id');
  id = id.substring(6);

    $.ajax({
    type: "post",
    url: "/logs/" + id + "/follow",
    data: id

  }).done(function (data){

    var buttonthing = $("#" + "follow" + data.log_id).children(":first")
     var numlikes2 = $("#fcount2" + data.log_id).parent().parent().attr('id');

    $(buttonthing).empty();
    $(buttonthing).append(data.unfollow);
    divthing2 = $("#" + numlikes2)[0];

    $(divthing2).children(":first").children(":first").empty().append("<span style='color: green'>" + (data.fcount - 1) + "<p style='color: white'>" + "Followers" + "<p>" + "</span>");




  });
})

//async follow for index
$("body").on('submit', ".followbut", function(event) {

  event.preventDefault();
  id = $(this).parent().attr('id');
  id = id.substring(6);

    $.ajax({
    type: "post",
    url: "/logs/" + id + "/follow",
    data: id

  }).done(function (data){
    var buttonthing = $("#" + "follow" + data.log_id).children(":first")
    //$(buttonthing).css("background", "blue");
    var numlikes = $("#fcount" + data.log_id).parent().parent().attr('id');

    $(buttonthing).empty();
    $(buttonthing).append(data.unfollow);
    divthing = $("#" + numlikes)[0];
    $(divthing).children(":first").children(":first").empty().append("<span style='color: green'>" + data.fcount + "</span>");
    $(divthing)
    // $("#fcount" + data.log_id).empty.

  });
})






});
