LoginController = Ember.Controller.extend Ember.SimpleAuth.LoginControllerMixin,
  
  modalEvent: ( ->
    console.log "Modal changed!"
  ).observes('loginModal') 
  
  actions:
    showModal: ->
      Bootstrap.ModalManager.show('loginModal')
    
    # display an error when logging in fails
    sessionAuthenticationFailed: (message) ->
      @.set('errorMessage', message)

    # handle login success
    sessionAuthenticationSucceeded: ->
      @.set('errorMessage', "");
      @.set('identification', "");
      @.set('password', "");
      @._super();

`export default LoginController`