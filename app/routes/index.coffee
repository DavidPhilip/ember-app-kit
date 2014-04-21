IndexRoute = Ember.Route.extend
  redirect: ->
    if @controllerFor('application').get('session').isAuthenticated
      @transitionTo('dashboard')
    else
      @transitionTo('home')
  
`export default IndexRoute`