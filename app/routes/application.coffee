ApplicationRoute = Ember.Route.extend Ember.SimpleAuth.ApplicationRouteMixin,

  beforeModel: ->
    new Ember.RSVP.Promise( (resolve) ->
      Ember.$.getJSON(App.lang + "/localization", {"token": App.csrf}).then( (data) ->
        Ember.I18n.translations = data
        resolve();
      )
    )
  
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
    
  actions:
    scrollTo: (target) ->
      $target = Ember.$('#'+target)
      if $target.length > 0
        $('html, body').animate
          scrollTop: $target.offset().top
          , 300
    
    showModal: (name) ->
      Bootstrap.ModalManager.show(name)
      
`export default ApplicationRoute`