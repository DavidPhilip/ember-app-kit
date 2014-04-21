LoginController = Ember.Controller.extend Ember.SimpleAuth.LoginControllerMixin, Ember.I18n.TranslateableProperties,
  
  isManual: false
  
  loginModalTitleTranslation: 'general.login.login' 
  loginModalPasswordTranslation: 'general.login.password' 
    
  usernameHelpModalTitleTranslation: 'general.help.login.username.title' 
  
  actions:
    # display an error when logging in fails
    sessionAuthenticationFailed: (message) ->
      @.set('errorMessage', message)

    # handle login success
    sessionAuthenticationSucceeded: ->
      @.set('errorMessage', "")
      @.set('identification', "")
      @.set('password', "")
      @._super()

`export default LoginController`