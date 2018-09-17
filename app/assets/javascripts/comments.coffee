# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.deleteAction').on 'click', ->
    current_comment = $(this).parents'div'[1] #второй эл-т = (.comment-view) в массиве DOM
    current_post = $(this).parents'div'[2] #третий эл-т _comment.html.erb в массиве DOM
    if confirm('Are you sure?')
      $.ajax
        url: '/posts/'+ $(current_post).attr('data-post_id') + '/comments/'  +  $(current_comment).attr('data-comment_id')
        type: 'POST'
        data: { _method: 'DELETE'}
        success: (result) ->
          $(current_comment).fadeOut(500)
          console.log result
        error: (e) ->
          console.log e
