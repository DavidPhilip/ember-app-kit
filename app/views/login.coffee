LoginView = Ember.View.extend
  classNameBindings: ['viewType']
  viewType: 'login'
  
  transitionToRoot: ( ->
    if @get('childViews').length <= 0
      @get('controller').transitionToRoute('home')
  ).observes('childViews.@each.isDestroyed')
  
  didInsertElement: ->
    if Ember.$('.home').length > 0
      @set('viewType', 'home-login')
    
`export default LoginView`