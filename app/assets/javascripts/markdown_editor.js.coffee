jQuery ($) ->
  ready = ->
    $("#uploadFile").change ->
      $("#uploadPlaceholder").val($(this).val())
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
               callback response.image_path + ' "TEST"'
               re = /enter image description here/g
               new_value = $("#wmd-input-content").val().replace(re, 'TEST TEXT')
               $("#wmd-input-content").val(new_value)
               return
               ), 0
             dialogClose()
           else
             alert response.message
             file.val(null)
             placeholder.val(null)
           return

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
