# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#article_title").on "keyup", (e) ->
    total_article_title_length = 10

    now_article_title_count = $("#article_title_count").text()
    input_article_title_count = $(this).val().length

    $("#article_title_count").text(parseInt(total_article_title_length)-parseInt(input_article_title_count))
