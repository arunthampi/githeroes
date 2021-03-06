# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.HeroesController = class HeroesController
  constructor: (@heroName, @heroPresent) ->
    @fetchHero() unless @heroPresent
    @initEventHandlers()

  fetchHero: ->
    $.ajax({
      type: 'GET',
      url: "https://api.github.com/users/#{@heroName}",
      dataType: 'jsonp',
      jsonpCallback: 'window.heroes_controller.saveHero'
    })

  popupCenter: (url, width, height, name) =>
    left = (screen.width / 2) - (width / 2)
    top  = (screen.height / 2) - (height / 2)

    window.open(url, name, "menubar=no,toolbar=no,status=no,width=#{width},height=#{height},toolbar=no,left=#{left},top=#{top}")

  saveHero: (response) ->
    data = response.data

    if data.message != "Not Found"
      $.ajax({
        type: 'POST',
        url: '/heroes',
        format: 'script',
        data: { 'hero' : data }
      })
    else
      $('.hero-container').removeClass('loading')
      $('.hero').html("<p style='font-size: 24px; line-height: 32px;'>Unfortunately, we can't find this hero on GitHub. Are you sure you have the username right?</p><div id='nomination-container'><input class='xlarge' id='nominate-hero-text-field' name='xlInput' placeholder=\"Your hero's GitHub username\" size='50' type='text'><a class='btn success' href='#' id='nominate-hero-button'>Nominate</a></div>")
      $('#nominate-hero-text-field').focus()

  initEventHandlers: ->
    $('textarea.copy-code').live 'click', (e) =>
      $(e.currentTarget).focus()
      $(e.currentTarget).select()

    $('a.popup').live 'click', (e) =>
      @popupCenter($(e.currentTarget).attr('href'), $(e.currentTarget).attr('data-width') || 600, $(e.currentTarget).attr('data-height') || 400, 'authPopup')
      e.stopPropagation()
      false

  refreshSession: ->