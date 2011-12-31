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
      dataType: 'json',
      success: (response, textStatus, XMLHttpRequest) =>
        if response.message != "Not Found"
          $.ajax({
            type: 'POST',
            url: '/heroes',
            format: 'script',
            data: { 'hero' : response }
          })
    })
