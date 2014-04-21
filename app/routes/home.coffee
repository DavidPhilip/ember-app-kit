HomeRoute = Ember.Route.extend
  activate: ->
    @controllerFor('login').set('isManual', false)
  
`export default HomeRoute`