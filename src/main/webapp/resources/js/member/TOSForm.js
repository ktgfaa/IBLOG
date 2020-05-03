$(window).on('load', function() {
	$(':checkbox[name="total"]').on({
		change : function(e) {
			if ($('#total').prop('checked')) {
				$('#service').prop('checked', true);
				$('#info').prop('checked', true);
				$('#join_next').removeAttr("disabled");
				$('#join_next').css('cursor', 'pointer');
				$('#join_next').css('background-color', '#efcae0');
				$('#total_val').val('yes');
				$('#service_val').val('yes');
				$('#info_val').val('yes');
			} else {
				$('#service').prop('checked', false);
				$('#info').prop('checked', false);
				$('#join_next').css('background-color', 'gray');
				$('#join_next').css('cursor', '');
				$('#join_next').attr("disabled", "disabled");
				$('#total_val').val('no');
				$('#service_val').val('no');
				$('#info_val').val('no');
			}
		}
	});

	$(':checkbox[name="service"]').on({
		change : function(e) {
			if ($('#service').prop('checked') && $('#info').prop('checked')) {
				$('#service').prop('checked', true);
				$('#total').prop('checked', true);
				$('#join_next').removeAttr("disabled");
				$('#join_next').css('cursor', 'pointer');
				$('#join_next').css('background-color', '#efcae0');
				$('#total_val').val('yes');
				$('#service_val').val('yes');
				$('#info_val').val('yes');
				
			} else if ($('#service').prop('checked')) {
				$('#service').prop('checked', true);
			} else {
				console.log($('#sevice').prop('checked'));
				$('#service').prop('checked', false);
				$('#total').prop('checked', false);
				$('#join_next').css('background-color', 'gray');
				$('#join_next').css('cursor', '');
				$('#join_next').attr("disabled", "disabled");
				$('#total_val').val('no');
				$('#service_val').val('no');
				$('#info_val').val('no');
			}
		}
	});

	$(':checkbox[name="info"]').on({
		change : function(e) {
			if ($('#service').prop('checked') && $('#info').prop('checked')) {
				$('#info').prop('checked', true);
				$('#total').prop('checked', true);
				$('#join_next').removeAttr("disabled");
				$('#join_next').css('cursor', 'pointer');
				$('#join_next').css('background-color', '#efcae0');
				$('#total_val').val('yes');
				$('#service_val').val('yes');
				$('#info_val').val('yes');
			} else if ($('#info').prop('checked')) {
				$('#info').prop('checked', true);
			} else {
				$('#info').prop('checked', false);
				$('#total').prop('checked', false);
				$('#join_next').css('background-color', 'gray');
				$('#join_next').css('cursor', '');
				$('#join_next').attr("disabled", "disabled");
				$('#total_val').val('no');
				$('#service_val').val('no');
				$('#info_val').val('no');
			}
		}
	});
	
	$('#join_next').click(function(){
		const total_val = $('#total_val').val();
		const service_val = $('#service_val').val();
		const info_val = $('#info_val').val();
		
		if(total_val == 'yes' && service_val == 'yes' && info_val == 'yes' ){
			$('#IBpolisy').submit();
		} else {
			alert('전부 동의후 넘어가 주세요!!');
		}
	});
});