$(function() {
	var $cartForm = $("#cartForm");
	$cartForm.validate({
		rules: {

			name: {
				required: true,
				lettersonly: true
			},
			
			email: {
				required: true,
				space: true,
				email: true
			},
			phno: {
				required: true,
				space: true,
				numericOnly: true,
				minlength: 10,
				maxlength: 12

			},
			address: {
				required: true
				
			},
			type:{
				required: true
			}
			
		},
		messages: {
			name: {
			required: 'name must be required',
            lettersonly: 'invalid name'
            },
            
			email: {
				required: 'email name must be required',
				space: 'space not allowed',
				email: 'Invalid email'
			},
			phno: {
				required: 'mob no must be required',
				space: 'space not allowed',
				numericOnly: 'invalid mob no',
				minlength: 'min 10 digit',
				maxlength: 'max 12 digit'
			},
			address: {
				required: "Address must be required"
				
			},
			type:{
				required: "choose payment mode"
			}
		}
	})


	jQuery.validator.addMethod('lettersonly', function(value, element) {
		return /^[^-\s][a-zA-Z_\s-]+$/.test(value);
	});


	jQuery.validator.addMethod('space', function(value, element) {
		return /^[^-\s]+$/.test(value);
	});

	jQuery.validator.addMethod('all', function(value, element) {
		return /^[^-\s][a-zA-Z0-9_,.\s-]+$/.test(value);
	});


	jQuery.validator.addMethod('numericOnly', function(value, element) {
		return /^[0-9]+$/.test(value);
	});
})












