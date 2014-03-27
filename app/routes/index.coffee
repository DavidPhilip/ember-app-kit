IndexRoute = Ember.Route.extend
  activate: ->
    # $(document).find(".modal[data-show=true]").modal()
  
    $('form input[name=_token]').each (index, element) ->
      $(@).attr('name', 'token')
    
    $("form").keypress event, ->
      if (event.which == 13)
        event.preventDefault()
        $(@).submit()

    # $('form input[name=birthday], form input[name="person.birthday"], form input[name=startdate], form input[name=enddate], form input[name=date]').datepicker
    #   startView: 2
    #   autoclose: true
    #   format: 'dd.mm.yyyy'
    #   language: $('html').attr('lang')

`export default IndexRoute`