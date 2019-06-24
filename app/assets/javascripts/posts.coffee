# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@setCommentForm = (id, hide = false) ->
  comment_id = '#comment_message' + id
  $(".comment-reply:not(#{comment_id})").hide()
  if (hide)
    $(comment_id).hide()
  else
    $(comment_id).show()
  $(comment_id + " > p > textarea").focus()

$(document).on("keydown", (e) ->
  e = e || window.event
  console.log(e.which)
  switch e.which
    when 39, 68 then prevPost() # Right
    when 37, 65 then nextPost() # Left
)

navigatePost = (path) ->
  if (window.location.href.indexOf("/posts/") > -1)
    window.location.href += path

nextPost = () ->
  navigatePost('/next')

prevPost = () ->
  navigatePost('/prev')