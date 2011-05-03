$(function () {
  var alert = $('.alert_flash');
  if (alert.length > 0) {
    alert.show().animate({height: alert.outerHeight()}, 200);

    window.setTimeout(function() {
      alert.fadeOut()
    }, 3500);
  }
});
