Vehicle = {
  selected: null,
  canSelect: true,
  park: {},
  customize: {
    enabled: true,
    selected: null,
    intestdrive: false,
    data: {},
  },
  testdrive: {
    enabled: true,
  },
  impoundmode: false,
  playermoney: 30000,
  testdrive: {},
  currency: '$',
};

var alreadyadded = {
  primary: false,
  secondary: false,
  plate: false,
  clear: function () {
    alreadyadded.primary = false;
    alreadyadded.secondary = false;
    alreadyadded.plate = false;
  },
};

$(function () {
  $('#vehicleshop').fadeOut(0);
  $('.vehicleinformation').fadeOut(0);
  $('.customizecontainer').fadeOut(0);
  $('.park').fadeOut(0);
  $('#conformation').fadeOut(0);
  $('#payment').fadeOut(0);

  $('#slider').fadeOut(0);
  $('#customize').fadeOut(0);
  $('#testdrive').fadeOut(0);

  var searchbar = document.forms['searchbar'].querySelector('input');
  searchbar.addEventListener('keyup', function (e) {
    const term = e.target.value.toLocaleLowerCase();
    var notAvailable = document.getElementById('notAvailable');

    var hasResults = false;

    $('.vehicle-element').each(function () {
      var e = $(this);
      var vehicle = e.children('div.vehicle.name').html();
      var brand = e.children('div.vehicle.brand').html();
      var plate = e.children('div.vehicle.plate').html();

      if (
        vehicle.toString().toLowerCase().includes(term.toString()) ||
        brand.toString().toLowerCase().includes(term.toString()) ||
        plate.toString().toLowerCase().includes(term.toString())
      ) {
        $(this).show(0);
      } else {
        $(this).hide(0);
      }
    });

    $('.category-element').each(function () {
      var e = $(this);
      var category2 = e.children('div.vehicle.category2').html();

      if (category2.toString().toLowerCase().includes(term.toString())) {
        $(this).show(0);
      } else {
        $(this).hide(0);
      }
    });
  });

  window.addEventListener('message', function (event) {
    var item = event.data;

    if (item.load) {
      $('#vehicle-headline').html(item.headline);
      Vehicle.load(item.html, 'general');
      Vehicle.impoundmode = false;
    } else if (item.loadvehicles) {
      Vehicle.load(item.html, 'category');
    } else if (item.show) {
      Vehicle.show();
    } else if (item.hide) {
      Vehicle.hide();
    } else if (item.setbuttonunpark) {
      $('#vi-button').removeClass('out');
      var park = 'unpark';

      if (usedlocale == 'de') {
        $('#vi-button').html(localede[park]);
      } else {
        $('#vi-button').html(locale[park]);
      }
    }

    if (item.settheme) {
      setTheme(item.theme);
    }

    if (item.park) {
      Vehicle.park.show();
    } else if (item.parkhide) {
      Vehicle.park.hide();
    } else if (item.parkload) {
      Vehicle.park.load(item.html);
    }

    if (item.updateTestdriveTime) {
      Vehicle.testdrive.show();
      Vehicle.testdrive.update(item.remaining);
      $('#testdrive-stopkey').html(item.stopkey);
    } else if (item.hideTestdrive) {
      Vehicle.testdrive.hide();
    }

    if (item.showCustomize) Vehicle.customize.enabled = true;
    if (item.hideCustomize) Vehicle.customize.enabled = false;
    if (item.setCustomizeData) {
      Vehicle.customize.data[item.key] = item.price;
    }

    if (item.setCustomizeOptions)
      Vehicle.customize.enable(item.key, item.state);

    if (item.showTestdrive) Vehicle.testdrive.enabled = true;
    if (item.hideTestdrive) Vehicle.testdrive.enabled = false;

    if (item.setCurrency) Vehicle.currency = item.currency;

    if (item.canselect) {
      Vehicle.canSelect = item.state;
    }
  });

  $(document).keyup(function (data) {
    // Change closing Phone http://gcctech.org/csc/javascript/javascript_keycodes.htm
    if (data.which == 27) {
      sendData('close');
    }
  });
});

function sendData(name, data) {
  $.post(
    'http://d-vehicleshop/' + name,
    JSON.stringify(data),
    function (datab) {
      // vehicleshop(datab);
    }
  );
}

Vehicle.hide = function () {
  $('#vehicleshop').fadeOut(500);
  $('.vehicleinformation').fadeOut(500);
  $('#slider').fadeOut(500);
  $('#customize').fadeOut(500);
  $('#conformation').fadeOut(500);
  $('#payment').fadeOut(500);

  // Vehicle.selected = null;
};

Vehicle.show = function () {
  $('#vehicleshop').fadeIn(500);

  $('.vehicleinformation').fadeOut(500);
  $('#slider').fadeOut(500);
  $('#customize').fadeOut(500);
  if (Vehicle.customize.intestdrive == true) {
    $('.vehicleinformation').fadeIn(500);
    $('#slider').fadeIn(500);
    Vehicle.customize.intestdrive = false;
  }
  $('#searchbar-input').val('');
};

Vehicle.load = function (html, category) {
  $('#searchbar-input').val('');
  if (category == 'category') {
    var headline = `<i class="fa-solid fa-chevron-left back"></i>
    <font class="locale" data-locale="BACK" id="back-font"> BACK </font>`;
    $('#vehicle-headline').html(headline);
    useLocal($('#back-font'), 'BACK');
  } else {
  }
  $('#vehicle-container').html('');
  $('#vehicle-container').html(html);
  $('#vehicle-container').scrollTop(0);
  $('.vehicle-element')
    .sort(function (a, b) {
      if (a.textContent < b.textContent) {
        return -1;
      } else {
        return 1;
      }
    })
    .appendTo('#vehicle-container');

  $('.category-element')
    .sort(function (a, b) {
      if (a.textContent < b.textContent) {
        return -1;
      } else {
        return 1;
      }
    })
    .appendTo('#vehicle-container');

  $('.vehicle-element').each(function (index, element) {
    // element == this
    var e = $(this);
    var icon = e.children('div.icon');
    var img = icon.children('img');
    var iconsrc = icon.children('img').attr('src');

    checkImage(
      iconsrc,
      function () { },
      function () {
        icon.children('img').attr('src', './images/icons/example.png');
      }
    );

    if (img.css('background-color') == 'rgba(0, 0, 0, 0)') {
      img.addClass('example');
    }

    var price = e.children('div.plate');
  });

  $('.category-element').each(function (index, element) {
    // element == this
    var e = $(this);
    var icon = e.children('div.icon');
    var img = icon.children('img');
    var iconsrc = icon.children('img').attr('src');

    checkImage(
      iconsrc,
      function () { },
      function () {
        icon.children('img').attr('src', './images/icons/example.png');
      }
    );

    if (img.css('background-color') == 'rgba(0, 0, 0, 0)') {
      img.addClass('example');
    }
  });

  Vehicle.loadanimation();
};

var inprocess = false;
$(document).on('click', '.vehicle-element', function () {
  if (Vehicle.canSelect == false) return;
  if (inprocess == true) return;
  inprocess = true;
  $('.vehicle-element').each(function (index, element) {
    $(this).css({
      'background-color': 'var(--element-bg-color)',
    });
    $(this).removeClass('selected');
    // $(this).children('div.icon').children('img').removeClass('black');
  });
  var e = $(this);
  alreadyadded.clear();
  e.addClass('selected');

  var vehicle = e.children('div.vehicle.name').html();
  var icon = e.children('div.icon');
  var iconcolor = icon.children('img').css('background-color');
  var iconsrc = icon.children('img').attr('src');
  var price = e.data('price');

  $('#vi-h-name').html(vehicle);
  $('#vi-h-price').html(price);
  $('#vi-h-name').parent().css({
    'background-color': iconcolor,
  });
  $('#vi-h-image').attr('src', iconsrc);

  if (iconcolor.indexOf('a') == -1) {
    var result = iconcolor.replace(')', ', 0.3)').replace('rgb', 'rgba');
    $('.selected').css({
      'background-color': result,
    });

    var slider = document.getElementById('slider');
    slider.style.setProperty('--SliderColor', result);

    if (Vehicle.customize.enabled == true) {
      $('#customize-button').show(0);
    } else {
      $('#customize-button').hide(0);
    }

    if (Vehicle.testdrive.enabled == true) {
      $('#vi-test').show(0);
    } else {
      $('#vi-test').hide(0);
    }

    $('#customize-button').css('background', iconcolor);
    $('.inner').css('background-color', iconcolor);
  }

  $('.vehicleinformation').fadeIn(500);

  var id = e.data('id');

  Vehicle.selected = {
    id: id,
    price: price,
  };

  sendData('vehicleshop:loadpreview', {
    id: id,
  });

  park = 'buy';
  if (price > Vehicle.playermoney) $('#vi-button').addClass('out');

  if (usedlocale == 'de') {
    $('#vi-button').html(localede[park]);
  } else {
    $('#vi-button').html(locale[park]);
  }

  var id = e.data('id');
  // vehicleshop(e.data('speed'));
  if (e.data('speed') != 'nil' && e.data('speed') != null) {
    $('#vi-b').show(0);
    var maxSpeed = 260; // km/h
    var alphaSpeed = parseFloat(e.data('speed')); // km/h
    var speedPercentage = (alphaSpeed / maxSpeed) * 100;

    $('#vi-b-speed').css('width', speedPercentage + '%');

    var alphaBraking = e.data('braking');
    var brakingPercentage =
      (parseFloat(alphaBraking.split('/')[0]) /
        parseFloat(alphaBraking.split('/')[1])) *
      100;

    $('#vi-b-braking').css('width', brakingPercentage + '%');

    var alphaAcceleration = e.data('handling');
    var accelerationPercentage =
      (parseFloat(alphaAcceleration.split('/')[0]) /
        parseFloat(alphaAcceleration.split('/')[1])) *
      100;

    $('#vi-b-acceleration').css('width', accelerationPercentage + '%');

    var alphaHandling = e.data('braking');
    var handlingPercentage =
      (parseFloat(alphaHandling.split('/')[0]) /
        parseFloat(alphaHandling.split('/')[1])) *
      100;

    $('#vi-b-handling').css('width', handlingPercentage + '%');
  } else {
    $('#vi-b').hide(0);
  }
  setTimeout(() => {
    inprocess = false;
  }, 500);

  $('#slider').val(170);
  $('#slider').fadeIn(500);

  $('#vehicle-searchbar-val').val('');

  // resets the color of the primary and secondary color icons
  $('.customize-element').each(function (index, element) {
    $(this).children('div.icon').children('img').css('background', '');
  });
});

$(document).on('click', '#vi-button', function () {
  var price = Vehicle.selected.price;

  Vehicle.buy(price);
  setTimeout(() => {
    inprocess = false;
  }, 500);
});

$(document).on('click', '#vi-test', function () {
  Vehicle.customize.intestdrive = true;
  sendData('vehicle:startTestdrive');
});

Vehicle.buy = (price) => {
  $('#unpark-price').html(price);
  $('#conformation').fadeIn(500);
};

// change heading
function showVal(value) {
  sendData('vehicleshop:setheading', {
    heading: value,
  });
}

function setTheme(theme) {
  document.documentElement.setAttribute('data-theme', theme);
}

function darkmode() {
  document.documentElement.setAttribute('data-theme', 'dark');
}

function checkImage(imageSrc, good, bad) {
  var img = new Image();
  img.onload = good;
  img.onerror = bad;
  img.src = imageSrc;
}

Vehicle.park.show = function () {
  $('.park').fadeIn(500);
};

Vehicle.park.hide = function () {
  $('.park').fadeOut(500);
};

Vehicle.park.load = function (html) {
  $('#park-elements').html('');
  $('#park-elements').html(html);
};

$(document).on('click', '.parkelement', function () {
  if (inprocess == true) return;
  inprocess = true;
  var e = $(this);
  var id = e.data('id');

  sendData('vehicle:sell', {
    id: id,
  });
  inprocess = false;
});

$(document).on('click', '.loadmoreelement', function () {
  if (inprocess == true) return;
  inprocess = true;

  sendData('vehicleshop:park:loadmore');
  inprocess = false;
});

// unpark
$(document).on('click', '#unpark-accept', function () {
  $('#conformation').fadeOut(0);
  $('#payment').fadeIn(500);
});

//
$(document).on('click', '.payment-accept', function () {
  let method = $(this).data('payment');
  $('#payment').fadeOut(500);
  sendData('vehicleshop:buy', {
    id: Vehicle.selected.id,
    method: method,
  });
});

$(document).on('click', '#payment-back', function () {
  $('#payment').fadeOut(500);
});

$(document).on('click', '#unpark-decline', function () {
  $('#conformation').fadeOut(500);
});
// Forms

// Category
$(document).on('click', '.category-element', function () {
  if (inprocess == true) return;
  inprocess = true;

  sendData('vehicleshop:loadVehicles', {
    id: $(this).data('id'),
  });
  setTimeout(function () {
    inprocess = false;
  }, 500);
});

$(document).on('click', '#vehicle-headline', function () {
  if (inprocess == true) return;
  inprocess = true;
  $('.vehicleinformation').fadeOut(500);
  $('#slider').fadeOut(500);
  sendData('vehicleshop:back');
  setTimeout(function () {
    inprocess = false;
  }, 500);
});

Vehicle.loadanimation = function () {
  $('#vehicle-container').css('left', '-100%');
  $('#vehicle-container').animate(
    {
      left: '0%',
    },
    500
  );

  $('#customize-container').css('left', '-100%');
  $('#customize-container').animate(
    {
      left: '0%',
    },
    500
  );
};

// Customize
$(document).on('click', '#customize-button', function () {
  var e = $('#customize');
  $('#vehicleshop').hide(0);
  e.fadeIn(0);
  Vehicle.loadanimation();
});

$(document).on('click', '#customize-back', function () {
  if (inprocess == true) return;
  inprocess = true;
  var e = $('#vehicleshop');
  $('#customize').hide(0);
  e.fadeIn(0);
  Vehicle.loadanimation();
  setTimeout(function () {
    inprocess = false;
  }, 500);
});

$(document).on('click', '.customize-element', function () {
  Vehicle.customize.selected = $(this).data('id');
  var e = $('.customizecontainer');
  $('#customize-colors').hide(0);
  $('#customize-color').hide(0);
  $('#customize-name').hide(0);

  $('#customize-headline-color').hide(0);
  $('#customize-headline-plate').hide(0);

  if (Vehicle.customize.selected == 'primary-color') {
    $('#customize-color').show(0);
    $('#customize-headline-color').show(0);
  } else if (Vehicle.customize.selected == 'secondary-color') {
    $('#customize-color').show(0);
    $('#customize-headline-color').show(0);
  } else if (Vehicle.customize.selected == 'plate') {
    $('#customize-name').show(0);
    $('#customize-headline-plate').show(0);
  }

  $('#customize-price').html(
    Vehicle.customize.data[Vehicle.customize.selected] + Vehicle.currency
  );

  e.fadeIn(500);
});

$(document).on('click', '.color-element', function () {
  var e = $(this);

  $('.color-element').each(function (index, element) {
    let e = $(this);
    if (e.hasClass('selected')) {
      e.removeClass('selected');
      e.html('');
    }
  });

  if (e.hasClass('selected')) {
    e.removeClass('selected');
    e.html('');
  } else {
    e.addClass('selected');
    e.html(' <i class="fa-solid fa-xmark"></i>');
  }
});

$(document).on('click', '#customize-accept', function () {
  var e = $(this);

  var selected = '';
  // $('.color-element').each(function (index, element) {
  //   let e = $(this);
  //   if (e.hasClass('selected')) {
  //     selected = e;
  //   }
  // });
  var input = $('#customize-name-input').val();
  // vehicleshop(input);

  let colorInput = $('#customize-color');
  let colorHex = colorInput.val();
  let r = parseInt(colorHex.substring(1, 3), 16);
  let g = parseInt(colorHex.substring(3, 5), 16);
  let b = parseInt(colorHex.substring(5, 7), 16);

  if (Vehicle.customize.data[Vehicle.customize.selected]) {
    if (
      (Vehicle.customize.selected == 'primary-color' &&
        alreadyadded.primary == false) ||
      (Vehicle.customize.selected == 'secondary-color' &&
        alreadyadded.secondary == false) ||
      (Vehicle.customize.selected == 'plate' && alreadyadded.plate == false)
    ) {
      var stringAmount = Vehicle.selected.price;

      // Remove non-numeric characters (except the decimal point)
      var numericString = stringAmount.replace(/[^0-9.]/g, '');

      // Remove decimal point and convert to an integer
      var amount = parseInt(numericString.replace('.', ''));

      var number =
        amount + parseInt(Vehicle.customize.data[Vehicle.customize.selected]);

      // Convert the number to a string
      var formattedNumber = number.toString();

      // Insert the decimal point and commas at the appropriate positions
      var length = formattedNumber.length;
      var decimalIndex = length - 3;
      while (decimalIndex > 0) {
        formattedNumber =
          formattedNumber.slice(0, decimalIndex) +
          '.' +
          formattedNumber.slice(decimalIndex);
        decimalIndex -= 3;
      }

      // Add the dollar sign
      formattedNumber = formattedNumber + '$';
      Vehicle.selected.price = formattedNumber;
      $('#vi-h-price').html(formattedNumber);
    }
  }

  $('.customize-element').each(function (index, element) {
    if (
      Vehicle.customize.selected == 'primary-color' ||
      Vehicle.customize.selected == 'secondary-color'
    ) {
      if ($(this).data('id') == Vehicle.customize.selected) {
        $(this)
          .children('div.icon')
          .children('img')
          .css('background', colorHex);
      }
    }
  });

  if (Vehicle.customize.selected == 'primary-color') {
    sendData('vehicleshop:setcolor', {
      r: r,
      g: g,
      b: b,
    });
    alreadyadded.primary = true;
  } else if (Vehicle.customize.selected == 'secondary-color') {
    sendData('vehicleshop:setSecondaryColor', {
      r: r,
      g: g,
      b: b,
    });
    alreadyadded.secondary = true;
  } else if (Vehicle.customize.selected == 'plate') {
    sendData('vehicleshop:setPlate', {
      input: input,
    });
    alreadyadded.plate = true;
  }

  e.parent().parent().fadeOut(500);
});

$(document).on('click', '#customize-close', function () {
  var e = $('.customizecontainer');

  e.fadeOut(500);
});

Vehicle.customize.enable = (key, state) => {
  $('.customize-element').each(function (index, element) {
    if ($(this).data('id') == key) {
      if (state == true) {
        $(this).show();
      } else {
        $(this).hide();
      }
    }
  });
};

Vehicle.testdrive.show = () => {
  $('#testdrive').fadeIn(500);
};

Vehicle.testdrive.hide = () => {
  $('#testdrive').fadeOut(500);
};

Vehicle.testdrive.update = (time) => {
  $('#testdrive-remaining').html(time);
};
