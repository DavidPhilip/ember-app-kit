IndexController = Ember.ArrayController.extend
  queryParams: ['anchor'],
  anchor: null,
  
  showAnchor: (->
    $elem = $(@anchor)
    $("body").animate
      scrollTop: $elem.offset().top
    , 300
  ).property 'anchor'

`export default IndexController`