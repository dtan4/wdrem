clearForm = ->
  $('#wordInput').val('')
  $('#meaningInput').val('')

escape = (text) ->
  $('<div>').text(text).html()

$(document).on('ajax:before', ->
  $('#alertSuccess').hide()
  $('#alertError').hide()

).on('ajax:success', (event, word) ->
  $('#tableBody').prepend(
    "<tr>" +
    "<td>#{escape(word.word)}</td>" +
    "<td>#{escape(word.meaning)}</td>" +
    "<td class=\"timeago\" title=\"#{escape(word.created_at)}\"></td>" +
    "</tr>"
  )
  $('#tableBody > tr').last().remove()
  $('.timeago').timeago()

  alertSuccess = $('#alertSuccess')
  alertSuccess.html("<strong>#{escape(word.word)}</strong> を投稿しました！")
  alertSuccess.show()
  clearForm()

).on('ajax:error', (event, errors) ->
  console.log(JSON.parse(errors.responseText))
  responseText = JSON.parse(errors.responseText).errors
  alertError = $('#alertError')
  alertError.html('<ul></ul>')

  $.each(responseText, (index, text) ->
    $(alertError, 'ul').append($('<li>').text(text))
  )

  alertError.show()
  clearForm()
)
