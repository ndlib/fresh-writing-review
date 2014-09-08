jQuery ($) ->
  hasFlash = false
  ready = ->

    try flashTest()
    catch e then handleError e
    cleanUp()

  flashTest = ->
    fo = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
    if fo
      hasFlash = true

  handleError = (e) ->
    if navigator.mimeTypes && navigator.mimeTypes['application/x-shockwave-flash'] != undefined && navigator.mimeTypes['application/x-shockwave-flash'].enabledPlugin
      hasFlash = true

  cleanUp = ->
    console.log hasFlash
    if !hasFlash
      $(".flex-video").css("height", "auto").css("padding-bottom", "10px").html("<p><em>This essay has a multimedia component that is not able to be displayed on your device. If you are using a tablet or smartphone, please use a desktop web browser. If you are already using a desktop browser, please ensure that you have <a href='http://get.adobe.com/flashplayer/'>Adobe Flash Player</a> installed.</em></p>")

  $(document).ready(ready)
  $(document).on('page:load', ready)


