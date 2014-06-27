ApplicationView = Ember.View.extend
    
  didInsertElement: ->
    Ember.$('form input[name=birthday], form input[name="person.birthday"], form input[name=startdate], form input[name=enddate], form input[name=date]').datepicker
      startView: 2
      autoclose: true
      format: 'dd.mm.yyyy'
      language: $('html').attr('lang')

`export default ApplicationView`
