# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@post_vote = (vote, post_id) ->
  url = Routes.post_vote_path(post_id)
  data = {
    post_id: post_id,
    vote: vote
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
      $('#post_votes').html(data.votes)

      post_upvote = $('#post_upvote')
      post_downvote = $('#post_downvote')

      post_upvote.removeClass("text-warning")
      post_downvote.removeClass("text-warning")

      if (data.vote == 1)
        post_upvote.addClass("text-warning")
      if (data.vote == -1)
        post_downvote.addClass("text-warning")

  })