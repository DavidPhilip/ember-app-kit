Router = Ember.Router.extend() # ensure we don't share routes between all Router instances

Router.map ->
  @.resource('tournaments')
  @.route('login')
  @.route('register')
  @.route('home')
  
  # Protected Routes
  @.route('dashboard')

`export default Router`
