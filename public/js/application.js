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







});
