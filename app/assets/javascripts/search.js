$(function() {
	$('#top_day').hide();
	$('#top_month').hide();
	$('#top_week').hide();

	$('#top_hour_btn').on('click', function() {
		$('#top_hour').show(200);
		$('#top_day').hide();
		$('#top_month').hide();
		$('#top_week').hide();
	});

	$('#top_day_btn').on('click', function() {
		$('#top_hour').hide();
		$('#top_day').show(200);
		$('#top_month').hide();
		$('#top_week').hide();
	});

	$('#top_week_btn').on('click', function() {
		$('#top_hour').hide();
		$('#top_day').hide();
		$('#top_month').hide();
		$('#top_week').show(200);
	});

	$('#top_month_btn').on('click', function() {
		$('#top_hour').hide();
		$('#top_day').hide();
		$('#top_month').show(200);
		$('#top_week').hide();
	});
});


