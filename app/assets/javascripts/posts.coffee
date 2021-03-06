# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Show/hide a reply form and hide all others
@displayCommentForm = (id, hide = false) ->
  comment_id = '#comment_message' + id
  $(".comment-reply:not(#{comment_id})").hide()
  if (hide)
    $(comment_id).hide()
  else
    $(comment_id).show()
  $(comment_id + " > p > textarea").focus()

pressedKeys = []

$(document).on("keydown", (e) ->
  e = e || window.event
  return if (pressedKeys[e])
  pressedKeys[e] = true;
  if (!$("input").add("textarea").is(":focus")) # Don't do global hotkeys when in input or textarea
    switch e.which
      when 39, 68 then navigatePost('/prev') # Right
      when 37, 65 then navigatePost('/next') # Left
      # Vote system not using arrow keys because they are already used for navigation
      when 87 then votePost(post_id, true) # Up
      when 83 then votePost(post_id, false) # Down
).on("keyup", (e) ->
  pressedKeys[e] = false;
)

votePost = (id, vote) ->
  $("#Post_" + id + "_" + (if vote then "upvote" else "downvote") + " > a:nth-child(1)")[0].click()

navigatePost = (path) ->
  if (post_id? && Routes.post_path(post_id) == window.location.pathname)
    window.location.href = Routes.post_path(post_id) + path