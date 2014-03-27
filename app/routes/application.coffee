ApplicationRoute = Ember.Route.extend Ember.SimpleAuth.ApplicationRouteMixin,
  beforeModel: ->
    new Ember.RSVP.Promise( (resolve) ->
      Ember.$.getJSON(App.lang + "/localization", {"token": App.csrf}).then( (data) ->
        Ember.I18n.translations = data
        resolve();
      )
    )

`export default ApplicationRoute`