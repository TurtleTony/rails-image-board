# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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
      $('#votes'+data.post).html(data.votes)

      $('#upvoteicon').add('#downvoteicon').removeClass("text-warning")
      if (data.vote == 1)
        $('#upvoteicon').addClass("text-warning")
      else
        $('#downvoteicon').addClass("text-warning")

  })