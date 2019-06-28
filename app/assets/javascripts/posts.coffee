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

@vote = (up, post_id) ->
  url = Routes.post_votes_path(post_id)
  data = {
    post_id: post_id,
    vote: up
  }
  $.ajax({
    type: "POST",
    url: url,
    beforeSend: (xhr) ->
      xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      return
    ,
    data: data,
    success: (data) ->
      $('#votes' + data.post).html(data.votes)
      return
  })
$(document).on("keydown", (e) ->
  e = e || window.event
  if (!$("input").add("textarea").is(":focus")) # Don't do global hotkeys when in input or textarea
    switch e.which
      when 39, 68 then navigatePost('/prev') # Right
      when 37, 65 then navigatePost('/next') # Left
)

navigatePost = (path) ->
  if (post_id? && Routes.post_path(post_id) == window.location.pathname)
    window.location.href = Routes.post_path(post_id) + path