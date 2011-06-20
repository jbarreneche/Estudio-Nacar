$ ->
  # Hide nested menues
  $('#sidebar ul ul').hide()

  # Sidebar effect
  $('#sidebar > ul li a').live 'click', (event)->
    elem = $(this).next()
    if elem.is('ul')
      $('#menu ul:visible').not(elem).slideUp()
      elem.slideToggle()

  # pjax menu links
  unless $.browser.msie && $.browser.version < 9
    $('#sidebar a').live 'click', (event)->
      event.preventDefault()
      url = $(this).attr('href')
      unless url == '#'
        $('#content').load url + '#content article'
