# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.HeroesController = class HeroesController
  constructor: (@heroName, @heroPresent) ->
    @fetchHero() unless @heroPresent

  fetchHero: ->
    $.ajax({
      type: 'GET',
      url: "https://api.github.com/users/#{@heroName}",
      dataType: 'jsonp',
      jsonpCallback: 'window.heroes_controller.saveHero'
    })

  saveHero: (response) ->
    console.log("Save Hero called")

    data = response.data

    if data.message != "Not Found"
      $.ajax({
        type: 'POST',
        url: '/heroes',
        format: 'script',
        data: { 'hero' : data }
      })

