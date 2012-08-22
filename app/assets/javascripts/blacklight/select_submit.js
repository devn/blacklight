//= require blacklight/core
(function($) {
// Used for sort-by and per-page controls, hide the submit button
    // and make the select auto-submit
    Blacklight.do_select_submit = function() {
      nav_row = $(Blacklight.do_select_submit.selector);
      $.each(Blacklight.do_select_submit.controls, function(i, control) {
        
        form = Blacklight.find_select_submit_form(control);

        form.hide();
        
        dropdown = Blacklight.find_select_submit_dropdown(control);
        dropdown.show();
 
        dropdown.find('ul.dropdown-menu a').click( function () {
          selection = $(this).attr('data-value');
          selection_key = $(this).text();

          dropdown = Blacklight.find_select_submit_dropdown(control);
          dropdown.find('a.dropdown-toggle').html(selection_key + ' <b class="caret"></b>');

          form = Blacklight.find_select_submit_form(control);
          form.find('select').val(selection);
          console.log(form.find('select').val());
          form.find('form').submit();

        });
      });

    };

    Blacklight.find_select_submit_form = function (control) {
      return $(Blacklight.do_select_submit.selector).find('li.' + control + "_form");
    };

    Blacklight.find_select_submit_dropdown = function (control) {
      return $(Blacklight.do_select_submit.selector).find('li.' + control);
    };


    Blacklight.do_select_submit.selector = "ul#sortAndPerPage";
    Blacklight.do_select_submit.controls = ["per_page", "sort"];
$(document).ready(function() {
  Blacklight.do_select_submit();
});
    })(jQuery);
