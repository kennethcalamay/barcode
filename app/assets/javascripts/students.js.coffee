$(document).ready ->
  updateGenderStats = ->
    $(".male").html( $('blockquote.genderM').length )
    $(".female").html( $('blockquote.genderF').length )

  updateYearStats = ->
    $(".first").html( $('blockquote.year1').length )
    $(".second").html( $('blockquote.year2').length )
    $(".third").html( $('blockquote.year3').length )
    $(".fourth").html( $('blockquote.year4').length )
    $(".unknown").html( $('blockquote.year').length )

  updateGenderStats()
  updateYearStats()

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
        updateGenderStats()
        updateYearStats()

        #$("html, body").animate({scrollTop: $(document).height(), 1000 });
        myVar = ''

      $.get(url).
        success(success_callback).
        error(fail_callback)
    else
      myVar += String.fromCharCode(e.which)
