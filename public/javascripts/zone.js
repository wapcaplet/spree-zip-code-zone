$j(function() {
  if ($j('#country_based').attr('checked')) {
    show_country();
  } else if ($j('#state_based').attr('checked')) {
    show_state();
  } else if ($j('#zip_code_range_based').attr('checked')) {
    show_zip_code_range();
  } else {
    show_zone();
  }
  $j('#country_based').click(function()   { show_country();} );
  $j('#state_based').click(function()     { show_state();} );
  $j('#zip_code_range_based').click(function()  { show_zip_code_range();} );
  $j('#zone_based').click(function()      { show_zone();} );
})

var show_country = function() {
  $j('#state_members :input').each(function() { $(this).disable(); })
  $j('#state_members').hide();
  $j('#zone_members :input').each(function() { $(this).disable(); })
  $j('#zone_members').hide();
  $j('#zip_code_range_members :input').each(function() { $(this).disable(); })
  $j('#zip_code_range_members').hide();
  // Show Country
  $j('#country_members :input').each(function() { $(this).enable(); })
  $j('#country_members').show();
};

var show_state = function() {
  $j('#country_members :input').each(function() { $(this).disable(); })
  $j('#country_members').hide();
  $j('#zone_members :input').each(function() { $(this).disable(); })
  $j('#zone_members').hide();
  $j('#zip_code_range_members :input').each(function() { $(this).disable(); })
  $j('#zip_code_range_members').hide();
  // Show State
  $j('#state_members :input').each(function() { $(this).enable(); })
  $j('#state_members').show();
};

var show_zip_code_range = function() {
  $j('#country_members :input').each(function() { $(this).disable(); })
  $j('#country_members').hide();
  $j('#zone_members :input').each(function() { $(this).disable(); })
  $j('#zone_members').hide();
  $j('#state_members :input').each(function() { $(this).disable(); })
  $j('#state_members').hide();
  // Show ZIP code
  $j('#zip_code_range_members :input').each(function() { $(this).enable(); })
  $j('#zip_code_range_members').show();
};

var show_zone = function() {
  $j('#state_members :input').each(function() { $(this).disable(); })
  $j('#state_members').hide();
  $j('#country_members :input').each(function() { $(this).disable(); })
  $j('#country_members').hide();
  $j('#zip_code_range_members :input').each(function() { $(this).disable(); })
  $j('#zip_code_range_members').hide();
  // Show Zone
  $j('#zone_members :input').each(function() { $(this).enable(); })
  $j('#zone_members').show();
};

