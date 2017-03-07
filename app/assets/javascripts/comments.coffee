# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#new_comment").submit ->
    $.ajax
      method: "post"
      url: $("#new_comment").attr("action")
      dataType: "json"
      data: { comment: { commenter: $("#comment_commenter").val(), body: $("#comment_body").val() } }
      success: (e, data, status) ->
        $("#add_comment").before "<div id='comment_id_"+e.id+"'><p><strong>Commenter: </strong>"+e.commenter+"</p>
                                  <p><strong>Comment: </strong>"+e.body+"</p>
                                  <p><a class='destroy_comment' data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/articles/"+e.article_id+"/comments/"+e.id+"'>Destroy Comment</a></p></div>"
        $("#comment_commenter").val("")
        $("#comment_body").val("")
    return false

  $("body").on "click", ".destroy_comment", ->
    if (confirm('Are you sure?'))
      $.ajax
        method: "delete"
        url: $(this).attr("href")
        dataType: "json"
        success: (e, data, status) ->
          $("#comment_id_"+e.id).css "display", "none"
      return false
    else
      return false