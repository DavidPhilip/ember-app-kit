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
  
    # Ember.$("form").keypress event, ->
    #   if (event.which == 13)
    #     event.preventDefault()
    #     $(@).submit()

  actions:
    scrollTo: (target) ->
      $target = Ember.$('#'+target)
      if $target.length > 0
        $('html, body').animate
          scrollTop: $target.offset().top
          , 300
    
    showModal: (name) ->
      Bootstrap.ModalManager.show(name)
      
    sessionAuthenticationFailed: (error) ->
      @controllerFor('login').send('sessionAuthenticationFailed', error)
      
`export default ApplicationRoute`