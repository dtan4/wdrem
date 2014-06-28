clearForm = ->
  $('#wordInput').val('')
  $('#meaningInput').val('')

escape = (text) ->
  $('<div>').text(text).html()

$(document).on('ajax:success', (event, word) ->
  $('#tableBody').prepend(
    "<tr>" +
    "<td>#{escape(word.word)}</td>" +
    "<td>#{escape(word.meaning)}</td>" +
    "<td>#{escape(word.created_at)}</td>" +
    "</tr>"
  )
  $('#tableBody > tr').last().remove()
  clearForm()
).on('ajax:error', (event, errors) ->
  console.log event
  console.log JSON.parse(errors.responseText)
  clearForm()
)
