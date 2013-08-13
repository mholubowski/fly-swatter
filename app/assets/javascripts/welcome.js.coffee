# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $(document).ready ->
    $toggle_wrapper = $('.toggle-wrapper')
    active = $toggle_wrapper.data('active')
    $toggle_wrapper.find("[data-toggle='#{active}']").click()

  $('.radio-container').on 'click', '.btn', (e) ->
    $parent = $(e.delegateTarget)
    $this = $(this)
    $this.removeClass('btn-white')
         .siblings().addClass('btn-white') 
    $parent.next('.content-container').children().hide()
    $parent.next('.content-container').children("[data-toggle_label='"+$this.data('toggle')+"']").show()


