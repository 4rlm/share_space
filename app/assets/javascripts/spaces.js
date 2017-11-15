// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){

  $("#desk_bookings").hide();

  $("button.display_bookings").on("click", function(){
    $("#desk_bookings").toggle();
  });

})




