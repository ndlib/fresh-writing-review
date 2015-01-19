jQuery ($) ->

  ready = ->
    csrf_token = $("meta[name=csrf-token]").attr("content")
    csrf_param = $("meta[name=csrf-param]").attr("content")
    params = undefined
    params = csrf_param + "=" + encodeURIComponent(csrf_token)  if csrf_param isnt `undefined` and csrf_token isnt `undefined`
    $("#wmd-input-content").redactor
      buttons: [
        'html'
        'formatting'
        'bold'
        'italic'
        'unorderedlist'
        'orderedlist'
        'image'
        'link'
      ]
      buttonSource: true
      focus: true
      focusEnd: true
      formatting: [
        'p'
        'blockquote'
        'h3'
      ]
      imageUpload: "/redactor_rails/pictures?" + params
      imageEditable: false
      imageGetJson: "/redactor_rails/pictures"
      imageUploadCallback: (image, json) ->
        imgUrl = $(image).prop('src')
        $(image).attr 'alt', json.title
        $(image).wrap('<ul class="small-block-grid-2"></ul>')
        $(image).wrap('<li></li>')
        $(image).wrap('<figure></figure>')
        $(image).after('<figcaption>INSERT CAPTION</figcaption>')
        $(image).wrap('<a href="' + imgUrl + '" data-lightbox="essay"></a>')
        return
      fileUpload: "/redactor_rails/documents?" + params
      fileGetJson: "/redactor_rails/documents"
      path: "/assets/redactor-rails"
      plugins: ['scriptbuttons']
    $(".redactor-editor").focus()

  $(document).ready(ready)
  $(document).on('page:load', ready)

