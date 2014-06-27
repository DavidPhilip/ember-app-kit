AbValidationsMixin = Ember.Mixin.create
  
  errorMessage: ''
  hasErrors: false
  hasAsyncErrors: false
  
  translatedErrors: ( ->
    translatedErrors = []
    
    flatErrors = JSON.parse(JSON.stringify(@get('errors')))
    
    for own type, errorMessageKeysList of flatErrors
      cleanType = type.substring(0, type.indexOf('_'))
      if errorMessageKeysList.length <= 0
        @set(type+'Error', false)
      else
        for own index, messageKey of errorMessageKeysList
          @set(type+'Error', true)
          translatedErrors.push @get(messageKey)
            
    translatedErrors
  ).property(
              'errors.identification',
              'errors.password',
              'errors.registerPassword',
              'errors.registerPasswordConfirmation',
              'errors.firstname',
              'errors.lastname',
              'errors.birthday',
              'errors.email',
              'errors.emailConfirmation',
              'errors.terms'
            )
  
  showPasswordError: ( ->
    @get('passwordError') && @get('displayErrors')
  ).property('passwordError', 'displayErrors', 'translatedErrors')
  
  showIdentificationError: ( ->
    @get('identificationError') && @get('displayErrors')
  ).property('identificationError', 'displayErrors', 'translatedErrors')
  
  showFirstnameError: ( ->
    @get('firstnameError') && @get('displayErrors')
  ).property('firstnameError', 'displayErrors', 'translatedErrors')

  showLastnameError: ( ->
    @get('lastnameError') && @get('displayErrors')
  ).property('lastnameError', 'displayErrors', 'translatedErrors')
  
  showBirthdayError: ( ->
    @get('birthdayError') && @get('displayErrors')
  ).property('birthdayError', 'displayErrors', 'translatedErrors')
  
  showEmailError: ( ->
    @get('emailError') && @get('displayErrors')
  ).property('emailError', 'displayErrors', 'translatedErrors')
  
  showEmailUnconfirmedError: ( ->
    @get('emailConfirmationError') && @get('displayErrors')
  ).property('emailConfirmationError', 'displayErrors', 'translatedErrors')
  
  showRegisterPasswordError: ( ->
    @get('registerPasswordError') && @get('displayErrors')
  ).property('registerPasswordError', 'displayErrors', 'translatedErrors')
  
  showPasswordUnconfirmedError: ( ->
    @get('registerPasswordConfirmationError') && @get('displayErrors')
  ).property('registerPasswordConfirmationError', 'displayErrors', 'translatedErrors')
  
  showTermsError: ( ->
    @get('termsError') && @get('displayErrors')
  ).property('termsError', 'displayErrors', 'translatedErrors')
    
`export default AbValidationsMixin`