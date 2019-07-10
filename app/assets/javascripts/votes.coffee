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
      console.log(data)
      $('#post_votes').html(data.votes)

      post_upvote = $('#post_upvote')
      post_downvote = $('#post_downvote')

      post_upvote.removeClass("text-warning")
      post_downvote.removeClass("text-warning")

      if (data.vote == true)
        post_upvote.addClass("text-warning")
      if (data.vote == false)
        post_downvote.addClass("text-warning")
      return
  })

@comment_vote = (vote, comment_id) ->
  url = Routes.comment_vote_path(comment_id)
  data = {
    comment_id: comment_id,
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
      $("#comment_#{data.voteable_id}_votes").html(data.votes);
      comment_upvote = $("#comment_#{data.voteable_id}_upvote")
      comment_downvote = $("#comment_#{data.voteable_id}_downvote")

      comment_upvote.removeClass("text-warning")
      comment_downvote.removeClass("text-warning")

      if (data.vote == true)
        comment_upvote.addClass("text-warning")
      if (data.vote == false)
        comment_downvote.addClass("text-warning")
      return
  })