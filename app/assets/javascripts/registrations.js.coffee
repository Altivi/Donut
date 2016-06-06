$ ->
	$('#signup_form').on 'ajax:success', (e, data, status, xhr) ->
		$('.alert-danger').remove()
		$('#signup_form').prepend('<div class="alert alert-notice">A confirmation link has been sent to your email address!</div>')

	$('#signup_form').on 'ajax:error', (e, data, status, xhr) ->
		labels = $("#signup_form").children('.form-group')
		$('.alert-danger').remove()
		if data.responseJSON.errors
			$('#signup_form').prepend('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><ul></ul></div>')
		$.each(data.responseJSON.errors, (field, msg) ->
			$('.alert-danger ul').append('<li>' + capitalizeFirstLetter(field) + ' ' + msg + '</li>')

		)
capitalizeFirstLetter = (string) ->
  string.charAt(0).toUpperCase() + string.slice(1)