LoginRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set('errorMessage', null)
  
  activate: ->
    @controllerFor('login').set('isManual', true)
  
`export default LoginRoute`