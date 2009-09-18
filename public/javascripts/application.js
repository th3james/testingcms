// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

 $(document).ready(function(){
    selected_menu_item = parseInt($('#menu_selected_index').text());
    $('#accordion').accordion({ active: selected_menu_item });
  });
