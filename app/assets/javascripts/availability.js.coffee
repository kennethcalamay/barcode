@sortTable = ->
  tbl = $("#facilitators table").children()[1]
  store = []
  i = 0
  len = tbl.rows.length

  while i < len
    row = tbl.rows[i]
    sortnr = parseFloat(row.cells[0].textContent or row.cells[0].innerText)
    store.push [sortnr, row]  unless isNaN(sortnr)
    i++

  store.sort (x, y) ->
    x[0] - y[0]

  i = 0
  len = store.length

  while i < len
    tbl.appendChild store[i][1]
    i++
  store = null


getNumStudentsCell = (e)->
  row = $(e).parent().parent()
  return row.children().first()

decrementNumStudents = (e)->
  cell = getNumStudentsCell(e)
  numStudents = parseInt( cell.html() )
  if numStudents > 0
    cell.html(numStudents-1)
    sortTable()
    
incrementNumStudents = (e)->
  cell = getNumStudentsCell(e)
  numStudents = parseInt( cell.html() )
  cell.html(numStudents+1)
  sortTable()

$ ->
  $('td .minus').addClass('badge badge-important')
  $('td .plus').addClass('badge badge-success')

  $('td .minus').click ->
    decrementNumStudents $(this)

  $('td .plus').click ->
    incrementNumStudents $(this)
