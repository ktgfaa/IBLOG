$(window).on('load', function() {
	$(':checkbox[name="total"]').on({
		change : function(e) {
			if ($('#total').prop('checked')) {
				$('#service').prop('checked', true);
				$('#info').prop('checked', true);
				$('#join_next').removeAttr("disabled");
				$('#join_next').css('cursor', 'pointer');
				$('#join_next').css('background-color', '#efcae0');
			} else {
				$('#service').prop('checked', false);
				$('#info').prop('checked', false);
				$('#join_next').css('background-color', 'gray');
				$('#join_next').css('cursor', '');
				$('#join_next').attr("disabled", "disabled");
			}
		}
	});

	$(':checkbox[name="service"]').on({
		change : function(e) {
			if ($('#service').prop('checked') && $('#info').prop('checked')) {
				$('#service').prop('checked', true);
				$('#total').prop('checked', true);
			} else if ($('#sevice').prop('checked')) {
				$('#service').prop('checked', true);
			} else {
				$('#service').prop('checked', false);
				$('#total').prop('checked', false);
			}
		}
	});

	$(':checkbox[name="info"]').on({
		change : function(e) {
			if ($('#service').prop('checked') && $('#info').prop('checked')) {
				$('#info').prop('checked', true);
				$('#total').prop('checked', true);
			} else if ($('#info').prop('checked')) {
				$('#info').prop('checked', true);
			} else {
				$('#info').prop('checked', false);
				$('#total').prop('checked', false);
			}
		}
	});

	$('#join_next').click(function() {
		alert("hello");
	});
});