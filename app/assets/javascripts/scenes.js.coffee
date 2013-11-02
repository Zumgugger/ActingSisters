# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $(".listdiv").mouseover ->
    $(".listdiv").not(this).each ->

    $(this).animate(height:60, width:60)
    
$ ->
  $(".listdiv").mouseleave ->
    $(this).animate(height:40, width:40)

$ ->
  $(".listdiv").click ->
    $(this).animate(width:80, height:80)