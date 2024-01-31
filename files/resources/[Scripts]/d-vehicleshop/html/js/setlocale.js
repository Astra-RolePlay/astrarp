var usedlocale = 'en';
$(function () {
  window.addEventListener('message', function (event) {
    var v = event.data;

    if (v.setlocale == true) {
      var locale2 = v.locale;
      usedlocale = locale2;
      if (locale2 == 'en') {
        $('.locale').each(function () {
          var locl = $(this).data('locale');
          $(this).html(locale[locl]);
        });

        $('.plocale').each(function () {
          var locl = $(this).data('locale');
          $(this).attr('placeholder', locale[locl]);
        });
      }

      if (locale2 == 'de') {
        $('.locale').each(function () {
          var locl = $(this).data('locale');
          $(this).html(localede[locl]);
        });

        $('.plocale').each(function () {
          var locl = $(this).data('locale');
          $(this).attr('placeholder', localede[locl]);
        });
      }

      if (locale2 == 'fr') {
        $('.locale').each(function () {
          var locl = $(this).data('locale');
          $(this).html(localefr[locl]);
        });

        $('.plocale').each(function () {
          var locl = $(this).data('locale');
          $(this).attr('placeholder', localefr[locl]);
        });
      }
    }
  });
});

function setlocale() {
  $('.locale').each(function () {
    var locl = $(this).data('locale');
    $(this).html(localede[locl]);
  });

  $('.plocale').each(function () {
    var locl = $(this).data('locale');
    $(this).attr('placeholder', locale[locl]);
  });
}

function useLocal(element, locl) {
  var text = locale[locl];
  if (usedlocale == 'de') text = localede[locl];
  if (usedlocale == 'fr') text = localefr[locl];

  element.html(text);
}
