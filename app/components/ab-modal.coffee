AbModalComponent = Bootstrap.BsModalComponent.extend

  classNameBindings: ['fade:in']
  fade: false
  modalBackdrop: '<div class="modal-backdrop fade"></div>'

  show: ->
    @set 'isVisible', true
    
    setTimeout =>
      @set 'fade', true
    , 0

  hide: ->
    @set 'fade', false
    @_backdrop.toggleClass('in') if @_backdrop
    
    setTimeout =>
      @set 'isVisible', false
    , 200
    
  appendBackdrop: ->
    @_backdrop = Em.$(@modalBackdrop).insertBefore(@$())
    
    setTimeout =>
      @_backdrop.toggleClass('in') if @_backdrop
    , 0

  becameHidden: ->
    @._super()
    
    
`export default AbModalComponent`