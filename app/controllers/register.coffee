`import AbValidationsMixin from 'appkit/mixins/ab-validations'`

RegisterController = Ember.Controller.extend Ember.I18n.TranslateableProperties, Ember.Validations.Mixin, AbValidationsMixin,
  
  # Make modal pop up automatically
  isManual: false
  
  # Translations 
  registerModalTitleTranslation: 'general.register.register' 
  termsModalTitleTranslation: 'general.terms.title' 
  
  usernameNotUniqueErrorTranslation: 'errors.register.username_validation_unique'
  
  firstnameBlankErrorTranslation: 'errors.register.firstname_validation_required'
  
  lastnameBlankErrorTranslation: 'errors.register.lastname_validation_required'
  
  emailBlankErrorTranslation: 'errors.register.email_validation_required'
  emailUnconfirmedErrorTranslation: 'errors.register.email_validation_confirmed'
  emailInvalidErrorTranslation: 'errors.register.email_validation_email'
  
  birthdayBlankErrorTranslation: 'errors.register.birthday_validation_required'
  birthdayFormatErrorTranslation: 'errors.register.birthday_validation_date_format'
  birthdayInvalidErrorTranslation: 'errors.register.birthday_validation_date'
  birthdayFutureErrorTranslation: 'errors.register.birthday_validation_before'
  
  termsBlankErrorTranslation: 'errors.register.terms_validation_required'
  
  passwordBlankErrorTranslation: 'errors.register.password_validation_required'
  passwordUnconfirmedErrorTranslation: 'errors.register.password_validation_confirmed'
  passwordLengthErrorTranslation: 'errors.register.password_validation_min_string'
  
  # Validations 
  validations:
    firstname:
      presence: { message: 'firstnameBlankError' }
    lastname:
      presence: { message: 'lastnameBlankError' }
    birthday:
      presence: { message: 'birthdayBlankError' }
      format: { with: /^(\d{1,2}[\-\/\s\.]{1}\d{1,2}[\-\/\s\.]{1}\d{4})$/, message: 'birthdayFormatError' }
    registerPassword:
      presence: { message: 'passwordBlankError' }
      length: { minimum: 5, messages: { tooShort: 'passwordLengthError' } }
      confirmation: { message: 'passwordUnconfirmedError' }
    email:
      presence: { message: 'emailBlankError' }
      confirmation: { message: 'emailUnconfirmedError' }
    terms:
      acceptance: { message: 'termsBlankError' }
  
  userRegistrationSuccess: (response) ->
    @set('errorMessages', null)
    Bootstrap.ModalManager.hide('registerModal')
    Bootstrap.NM.push(response.message, 'success')
    
  userRegistrationFailed: (response) ->
    message = response.msg
    @set('errorMessages', message)
    @set('displayAsyncErrors', true)
  
  actions:
    register: ->
      if @get('isValid')
        @set('displayErrors', false)
        
        Ember.$.post( App.lang + "/register",
          "token": App.csrf
          "firstname": @get('firstname')
          "lastname": @get('lastname')
          "birthday": @get('birthday')
          "email": @get('email')
          "email_confirmation": @get('emailConfirmation')
          "password": @get('registerPassword') 
          "password_confirmation": @get('registerPasswordConfirmation') 
          "terms": @get('terms')
        ).then( (response) =>
          @userRegistrationSuccess(response.data)
        ).fail( (response) =>
          @userRegistrationFailed(JSON.parse(response.responseText))
        )
          
      else
        @set('displayErrors', true)
  
`export default RegisterController`