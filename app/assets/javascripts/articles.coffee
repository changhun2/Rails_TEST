# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#article_title").on "keydown", (e) ->
    now_article_title_count = $("#article_title_count").text()
    
    if now_article_title_count > 0 && e.key != "Backspace"
      $("#article_title_count").text(now_article_title_count-1)
      
    if e.key == "Backspace" && now_article_title_count < 10
      $("#article_title_count").text(parseInt(now_article_title_count)+1)
