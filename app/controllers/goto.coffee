GotoController = Ember.ArrayController.extend
  queryParams: ['anchor'],
  anchor: null,
  
  showAnchor: (->
    $elem = $(@anchor)
    
    if $elem
      $("body").animate
        scrollTop: $elem.offset().top
      , 300
  ).observes 'anchor'

`export default GotoController`