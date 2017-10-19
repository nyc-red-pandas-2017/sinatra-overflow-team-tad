$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $("#new-question").on("click", function(event){
    event.preventDefault();

    var $obj = $(this);
    var url = $obj.attr("action");
    var method = $obj.attr("method");

    $.ajax({
      url: url,
      method: method
    })

    .done(function(response){
      $("#new-question").append(response);
    })

  })
});
