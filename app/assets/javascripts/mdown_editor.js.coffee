jQuery ($) ->

  $(document).ready ->
    document.getElementById("uploadFile").onchange = ->
      document.getElementById("uploadPlaceholder").value = @value
      return

    $('textarea.wmd-input').each (i, input) ->
      attr = $(input).attr('id').split('wmd-input')[1]
      converter = new Markdown.Converter()
      editor = new Markdown.Editor(converter, attr)
      dialog = $("#insertImageDialog").modal('hide')
      file = $("#uploadFile")
      loader = $("#uploadLoader")

      editor.hooks.set "insertImageDialog", (callback) ->

         dialogClose = ->
            file.val ""
            dialog.modal('hide')
            return
         
         uploadStart = ->
           loader.css("display", "inline-block").show()
           return
      
         uploadComplete = (response) ->
           loader.hide()
           if response.success
             callback response.imagePath
             dialogClose()
           else
             alert response.message
             file.val ""
           return
         
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
