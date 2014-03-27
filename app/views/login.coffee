LoginView = Ember.View.extend
  transitionToRoot: ( ->
    if @get('childViews').length <= 0
      @get('controller').transitionToRoute('/')
  ).observes('childViews.@each.isDestroyed')
    
`export default LoginView`