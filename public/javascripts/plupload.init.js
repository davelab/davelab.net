

    // Convert divs to queue widgets when the DOM is ready
    $(function() {
      //RoR - capture authenticity token
      var atoken = $("input[name=authenticity_token]").val();
      $("#uploader").pluploadQueue({
        // General settings
        runtimes : 'html5,flash,silverlight,gears,browserplus',
        url : '/photos',
        max_file_size : '10mb',
        chunk_size : '1mb',
        unique_names : true,
        //RoR - make sure form is multipart
        multipart: true,
        //RoR - make sure to send authenticity token and any other parameters that are on the plain html form


        // Specify what files to browse for
        filters : [
          {title : "Image files", extensions : "jpg,gif,png"},
          {title : "Zip files", extensions : "zip"}
        ],

        // Flash settings
        flash_swf_url : '/js/plupload/plupload.flash.swf',

        // Silverlight settings
        silverlight_xap_url : '/js/plupload/plupload.silverlight.xap'
      });

      // Client side form validation
      $('form').submit(function(e) {
        var uploader = $('#uploader').pluploadQueue();

        // Validate number of uploaded files
        if (uploader.total.uploaded == 0) {
          // Files in queue upload them first
          if (uploader.files.length > 0) {
            // When all files are uploaded submit form
            uploader.bind('UploadProgress', function() {
              if (uploader.total.uploaded == uploader.files.length)
                $('form').submit();
            });

            uploader.start();
          } else
            alert('You must at least upload one file.');

          e.preventDefault();
        }
      });
    });
