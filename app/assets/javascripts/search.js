function active(object) {
	$(object).css("color", "#48B04C");
	$(object).css("background-color", "#FFFFFF");
}

function inactive(object) {
	$(object).css("color", "#FFFFFF");
	$(object).css("background-color", "#48B04C");
}

$(function() {
	$('#top_day').hide();
	$('#top_month').hide();
	$('#top_week').hide();
	active($('#top_hour_btn'));

	$('#top_hour_btn').on('click', function() {
		inactive($('.tab'));
		active(this);
		$('#top_hour').show(200);
		$('#top_day').hide();
		$('#top_month').hide();
		$('#top_week').hide();
	});

	$('#top_day_btn').on('click', function() {
		inactive($('.tab'));
		active(this);
		$('#top_hour').hide();
		$('#top_day').show(200);
		$('#top_month').hide();
		$('#top_week').hide();
	});

	$('#top_week_btn').on('click', function() {
		inactive($('.tab'));
		active(this);
		$('#top_hour').hide();
		$('#top_day').hide();
		$('#top_month').hide();
		$('#top_week').show(200);
	});

	$('#top_month_btn').on('click', function() {
		inactive($('.tab'));
		active(this);
		$('#top_hour').hide();
		$('#top_day').hide();
		$('#top_month').show(200);
		$('#top_week').hide();
	});
});


