$(function() {
	var $UserregisterForm = $("#userRegister");
	$UserregisterForm.validate({
		rules: {

			fname: {
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
				required: true,
				all: true
			},
			city: {
				required: true,
				space: true,
				lettersonly: true

			},
			state: {
				required: true,
				space: true,
				lettersonly: true

			},
			pincode: {
				required: true,
				space: true,
				numericOnly: true,
				minlength: 6

			},
			password: {
				required: true,
				space: true

			},
			confirmpassword: {
				required: true,
				space: true,
				equalTo: '#pwd'

			},
			phnoo: {
				required: true,
				space: true,
				numericOnly: true,
				minlength: 10,
				maxlength: 12
				
			},
			
		},
		messages: {
			fname: {
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
				required: 'address must be required',
				all: 'invalid'

			},

			city: {
				required: 'city must be required',
				space: 'space not allowed',
				lettersonly: 'invalid city'

			},
			state: {
				required: 'state must be required',
				space: 'space not allowed',
				lettersonly: 'invalid state'

			},
			pincode: {
				required: 'pincode must be required',
				space: 'space not allowed',
				numericOnly: 'invalid pincode',
				minlength: 'min 6 digit',

			}
			,
			password: {
				required: 'password must be required',
				space: 'space not allowed'

			},
			confirmpassword: {
				required: 'confirm password must be required',
				space: 'space not allowed',
				equalTo: 'password mismatch'

			},
			phnoo:{
				required: 'mob no must be required',
				space: 'space not allowed',
				numericOnly: 'invalid mob no',
				minlength: 'min 10 digit',
				maxlength: 'max 12 digit'
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












