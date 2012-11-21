$(document).ready ->
  myVar = ''

  $(document).keypress (e)->
    if e.which == 13
      if myVar == ''
        return false

      url = '/students/'+myVar

      fail_callback = ->
        $('#error').remove()
        $('body').prepend('<p id="error" style="background-color:red;color:white;">No student with barcode number: '+myVar+'</p>')
        myVar = ''

      success_callback = (data)->
        $('#error').remove()
        $('.students').prepend(data)
        #$("html, body").animate({scrollTop: $(document).height(), 1000 });
        myVar = ''

      $.get(url).
        success(success_callback).
        error(fail_callback)
    else
      myVar += String.fromCharCode(e.which)
