HomeView = Ember.View.extend
  classNames: ['home']
  didInsertElement: ->
    Ember.$('.carousel').carousel
      interval: false

`export default HomeView`
