

attachRatingHandler = ->

  # to set summernote object
  # You should change '#post_content' to your textarea input id
  summer_note = $('#post_content')

  # to call summernote editor
  summer_note.summernote
    # to set options
    height:300
    onImageUpload: (files, editor, welEditable) ->
      sendFile files[0], editor, welEditable
        
    # toolbar: [
                # ['insert', ['picture', 'link']], // no insert buttons
                # ["table", ["table"]],
                # ["style", ["style"]],
                # ["fontsize", ["fontsize"]],
                # ["color", ["color"]],
                # ["style", ["bold", "italic", "underline", "clear"]],
                # ["para", ["ul", "ol", "paragraph"]],
                # ["height", ["height"]],
                # ["help", ["help"]]
             #]

  # to set code for summernote
  summer_note.code summer_note.val()

  # to get code for summernote
  summer_note.closest('form').submit ->
    # alert $('#post_content').code()
    summer_note.val summer_note.code()
    true

sendFile = (file, editor, welEditable) ->
	data = new FormData()
	data.append("file", file)
	$.ajax {
		url: '/upload',
		data: data,
		cache: false,
		contentType: false,
		processData: false,
		type: 'POST',
		success: (data) ->
			editor.insertImage(welEditable, data.url)
		error: (data) ->
			editor.insertImage(welEditable, data.url)
			alert(data.url)
	}    
    
$(document).ready attachRatingHandler
$(document).on "page:load", attachRatingHandler
