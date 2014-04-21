LoginRoute = Ember.Route.extend
  activate: ->
    @controllerFor('login').set('isManual', true)
  
`export default LoginRoute`