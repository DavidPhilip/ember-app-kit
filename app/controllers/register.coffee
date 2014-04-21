RegisterController = Ember.Controller.extend Ember.I18n.TranslateableProperties,
  
  isManual: false
  
  registerModalTitleTranslation: 'general.register.register' 
  termsModalTitleTranslation: 'general.terms.title' 
  
  actions:
    setValidationError: (error) ->
      @.set('errorMessage', message)

    resetValidationOutputs: ->
      @.set('errorMessage', "")
      @.set('identification', "")
      @.set('password', "")
      @._super()

`export default RegisterController`