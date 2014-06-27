`import AbValidationsMixin from 'appkit/mixins/ab-validations'`

LoginController = Ember.Controller.extend Ember.SimpleAuth.LoginControllerMixin, Ember.I18n.TranslateableProperties, Ember.Validations.Mixin, AbValidationsMixin,
  # Auth type
  authenticatorFactory: 'authenticator:oauth2-password-grant'
  
  # Make modal pop up automatically
  isManual: false
  
  # Translations 
  loginModalTitleTranslation: 'general.login.login' 
  loginModalPasswordTranslation: 'general.login.password' 
  usernameHelpModalTitleTranslation: 'general.help.login.username.title'
  
  usernameBlankErrorTranslation: 'errors.login.error_1'
  passwordBlankErrorTranslation: 'errors.login.error_2'
  
  # Validations 
  validations:
    identification:
      presence: { message: 'usernameBlankError' }
    password:
      presence: { message: 'passwordBlankError' }
  
  actions:
    authenticate: ->
      if @get('isValid')
        @set('displayErrors', false)
        @._super()
      else
        @set('displayErrors', true)
    
    sessionAuthenticationFailed: (error) ->
      message = JSON.parse(error).msg
      @set('errorMessages', message)
      @set('displayAsyncErrors', true)
    
`export default LoginController`