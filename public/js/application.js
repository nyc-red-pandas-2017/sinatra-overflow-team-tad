$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $("#new-question").on("click", function(event){
    event.preventDefault();
      $("#submit-new-question-container").show();
    })

  $("#hide-form").on("click", function(event){
    event.preventDefault();
      $("#submit-new-question-container").hide();
    })

  $("#submit-new-question").on("submit", function(event) {
    event.preventDefault();

    var $obj = $(this);
    var url = $obj.attr("action");
    var method = $obj.attr("method");
    var data = $obj.serialize();

    $.ajax({
      url: url,
      method: method,
      data: data
    })

    .done(function(response){
      $(".list").prepend(response)
      //$("#submit-new-question textarea").html("")
    });

  })

});
