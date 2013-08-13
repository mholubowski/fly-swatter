# jQuery ($) ->
class flySwatter
  constructor: (options) ->
    @options = options
    @id = "fly-swatter-widget-wrapper"
    @render()
    @_init_binders()

  render: () ->
    html = """
            <div id="#{@id}">
              <div class="click-tab">
                <div class="bug-icon"><i class="icon-bug"></i></div>
              </div>

              <div class="form-wrapper">
                <form>
                  Bug: <textarea type="input" name="bug"></textarea>
                </form>

                <div class="fs-button-wrapper">
                  <div class="fs-submit-button">Submit Bug</div>
                </div>
              </div>
            </div>
           """
    $('body').append html

  submit_bug_report: () =>
    input_data = @_parse_form()
    $.ajax({
      url: 'http://localhost:3001/bug_reports',
      data: input_data,
      dataType: 'json',
      type: 'POST',
      # don't expect success to work with CORS
      complete: @thank_you()
    })

  thank_you: () ->
    $elm = $("##{@id}")
    $elm.find('.form-wrapper').html('<h1>Thank you</h1>')
    $elm.find('.click-tab').click()


  _init_binders: () ->
    $elm = $("##{@id}")
    $elm.on 'click', '.click-tab', ->
      change = if $(this).hasClass('hidden') then '+=335px' else '-=335px'
      $elm.animate({left: change})
      $(this).toggleClass('hidden')
    $elm.on 'click', '.fs-submit-button', @submit_bug_report
  

  _parse_form: () ->
    $form = $("##{@id}").find('form')
    data = {}
    data.description  = $form.find('textarea[name="bug"]').val()
    data.page_url     = window.location.href
    data.browser_info = @_browser_info()
    data.unique_key   = _fly_swatter_id
    return data

  _browser_info: () ->
    ua = navigator.userAgent
    N  = navigator.appName
    M  = ua.match(/(opera|chrome|safari|firefox|msie|trident)\/?\s*([\d\.]+)/i) || []
    M  =  if M[2] then [M[1], M[2]] else [N, navigator.appVersion, '-?']
    if (M && (tem= ua.match(/version\/([\.\d]+)/i))!= null) then M[2]= tem[1]
    return M.join(' ')

development = false

# url = if development then "http://localhost:3001/users/#{_fly_swatter_id}/widget.json" else "http://fly-swatter.herokuapp.com/users/#{_fly_swatter_id}/widget.json"

# $.ajax({
#   url: url,
#   type: 'GET',
#   success: (json) -> 
#     renderWidget(json)
# })

renderWidget = () -> 
  f = new flySwatter
  console.log 'here!' 

renderWidget()

  # window.f = f
  # f.render()
