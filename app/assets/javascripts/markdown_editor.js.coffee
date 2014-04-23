jQuery ($) ->
  # Get and set textarea selection from http://stackoverflow.com/questions/3286595/update-textarea-value-but-keep-cursor-position
  getInputSelection = (el) ->
    start = 0
    end = 0
    normalizedValue = undefined
    range = undefined
    textInputRange = undefined
    len = undefined
    endRange = undefined
    if typeof el.selectionStart is "number" and typeof el.selectionEnd is "number"
      start = el.selectionStart
      end = el.selectionEnd
    else
      range = document.selection.createRange()
      if range and range.parentElement() is el
        len = el.value.length
        normalizedValue = el.value.replace(/\r\n/g, "\n")

        # Create a working TextRange that lives only in the input
        textInputRange = el.createTextRange()
        textInputRange.moveToBookmark range.getBookmark()

        # Check if the start and end of the selection are at the very end
        # of the input, since moveStart/moveEnd doesn't return what we want
        # in those cases
        endRange = el.createTextRange()
        endRange.collapse false
        if textInputRange.compareEndPoints("StartToEnd", endRange) > -1
          start = end = len
        else
          start = -textInputRange.moveStart("character", -len)
          start += normalizedValue.slice(0, start).split("\n").length - 1
          if textInputRange.compareEndPoints("EndToEnd", endRange) > -1
            end = len
          else
            end = -textInputRange.moveEnd("character", -len)
            end += normalizedValue.slice(0, end).split("\n").length - 1
    start: start
    end: end

  offsetToRangeCharacterMove = (el, offset) ->
    offset - (el.value.slice(0, offset).split("\r\n").length - 1)

  setInputSelection = (el, startOffset, endOffset) ->
    if typeof el.selectionStart is "number" and typeof el.selectionEnd is "number"
      el.selectionStart = startOffset
      el.selectionEnd = endOffset
    else
      range = el.createTextRange()
      startCharMove = offsetToRangeCharacterMove(el, startOffset)
      range.collapse true
      if startOffset is endOffset
        range.move "character", startCharMove
      else
        range.moveEnd "character", offsetToRangeCharacterMove(el, endOffset)
        range.moveStart "character", startCharMove
      range.select()
    return

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
          $("#uploadForm").trigger("reset")
          return

        uploadStart = ->
          loader.css("display", "inline-block").show()
          return

        uploadComplete = (response) ->
          loader.hide()
          if response.success
            caption = decodeURI($("#captionText").val())
            credit = decodeURI($("#creditText").val())
            alt = $("#altText").val()
            area = $("#wmd-input-content")
            full_caption = deriveCaption(caption, credit)
            dialogClose()

            callback response.image_path + ' "' + full_caption + '"'
            sel = getInputSelection(area.get(0))
            startText = area.val().substring(0,sel.start)
            endText = area.val().substring(sel.end)
            area.val(startText + alt + endText)
            setInputSelection(area.get(0), sel.start, sel.start + alt.length)
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

        $("#closeImageDialog").off()
        $("#closeImageDialog").on 'click', ->
          dialogClose()

        $("#uploadImageButton").off()
        $("#uploadImageButton").on 'click', ->
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
