LanguageController = Ember.Controller.extend
  actions:
    selectLang: (lang) ->
      localStorage.lang = lang
      location.reload()

`export default LanguageController`