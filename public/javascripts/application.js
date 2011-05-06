function remove_fields(link) {
   var hidden_field = $(link).prev('input[type=hidden]');
   if(hidden_field) {
               hidden_field.value = '1';
   }
   $(link).parents('.fields').hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}



