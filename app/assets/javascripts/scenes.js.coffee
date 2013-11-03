# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $(".listdiv").mouseover ->
    $(this).animate({marginRight: '5px'; marginBottom: '5px'; height : '45px'; width: '45px'})
    
$ ->
  $(".listdiv").mouseleave ->
    $(this).animate({marginRight: '10px'; marginBottom: '10px';  height : '40px'; width: '40px'})


jQuery ->
  $('.best_in_place').best_in_place()
