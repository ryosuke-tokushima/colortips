$(document).ready(function() {
    $("#images").on("change", function() {
      var files = $(this)[0].files;
      $(".preview-images").empty(); // Clear out the old images
      $.each(files, function(index, file) {
        var reader = new FileReader();
        reader.onload = function(e) {
          $(".preview-images").append('<img src="' + e.target.result + '" style="width:200px; height:auto; margin: 10px;">');
        };
        reader.readAsDataURL(file);
      });
    });
  });

  // Color palette selection
$(".color-palette-selection").on("click", function() {
    // Remove the selected class from all color palettes
    $(".color-palette-selection").removeClass("selected");
    // Add the selected class to the clicked color palette
    $(this).addClass("selected");
    // Set the hidden field value to the ID of the clicked color palette
    $("#selected-palette-id").val($(this).data("id"));
});
