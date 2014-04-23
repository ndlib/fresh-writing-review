jQuery ($) ->
  ready = ->

    setTimeout (->
      $(".alert").fadeOut()
      return
    ), 2000

    $("#uploadFile").change ->
      placeholderName = $(this).val().replace("C:\\fakepath\\", "")
      $("#uploadPlaceholder").val(placeholderName)
      return

    $('textarea.wmd-input').each (i, input) ->
      attr = $(input).attr('id').split('wmd-input')[1]

      converter = Markdown.getSanitizingConverter()
      editor = new Markdown.Editor(converter, attr)

      dialog = $("#insertImageDialog").modal('hide')
      file = $("#uploadFile")
      loader = $("#uploadLoader")
      placeholder = $("#uploadPlaceholder")

      editor.hooks.set "insertImageDialog", (callback) ->

         dialogClose = ->
            file.val(null)
            placeholder.val(null)
            loader.hide()
            dialog.modal('hide')
            callback(null)
            return

         uploadStart = ->
           loader.css("display", "inline-block").show()
           return

         uploadComplete = (response) ->
           loader.hide()
           if response.success
             setTimeout (->
               caption = decodeURI($("#captionText").val())
               credit = decodeURI($("#creditText").val())
               full_caption = deriveCaption(caption, credit)
               callback response.image_path + ' "' + full_caption + '"'
               re = /enter image description here/g
               alt_text = $("#wmd-input-content").val().replace(re, $("#altText").val())
               $("#wmd-input-content").val(alt_text)
               return
               ), 0
             $("#uploadForm").trigger("reset")
             dialogClose()
           else
             alert response.message
             file.val(null)
             placeholder.val(null)
           return

         deriveCaption = (caption, credit) ->
           full_caption = ''
           if caption
             full_caption = caption

           if credit
             full_caption = full_caption + ' - ' + credit

           return full_caption

         $("#closeImageDialog").click ->
           dialogClose()

         $("#uploadImageButton").click ->
           formData = new FormData(document.getElementById('uploadForm'))
           $.ajax
             url: file.attr("data-action")
             type: "POST"
             beforeSend: uploadStart
             success: uploadComplete
             data: formData
             cache: false
             contentType: false
             processData: false

         dialog.modal('show')

         true

      editor.run()

  $(document).ready(ready)
  $(document).on('page:load', ready)
