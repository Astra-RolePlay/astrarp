var swapItem = true;

var forbiddentStashItems = [
    'cash',
];

var bypassItems = [
    'phone',
    'vehiclekey',
    'water_bottle',
    'twerks_candy',
    'snikkel_candy',
    'lighter',
    'walkstick',
    'fishingrod',
    'fishingbait',
    'id_card',
    'driver_license',
    'lawyerpass',
    'pantolon',
    'kupe',
    'sapka',
    'ayakkabi',
    'ustgiyim',
    'bileklik',
    'maske',
    'saat',
    'canta',
    'gozluk',
    'kolye',
    'zirh',
];

var kuponItems = [
    '1kupon',
    '25kupon',
    '50kupon',
    '75kupon',
    '100kupon',
    '200kupon',
    '500kupon',
];

var metaClothing = [
    'pantolon',
    'kupe',
    'sapka',
    'ayakkabi',
    'ustgiyim',
    'bileklik',
    'maske',
    'saat',
    'canta',
    'gozluk',
    'kolye',
    'zirh',
];

var dropItems = [
    'bag',
    'scratchoff',
];

var DonateWeaponWhitelistJob = [
    'police',
    'sheriff',
    'sasp',
    'notillegal',
];

var DonateStashs = {
    "depo":false,
    "bagaj":false,
    "torpido":false,
    "yer":true,
};

var uniqueItems = [
    'depo',
    'torpido',
    'bagaj',
];

var changeSlots = [
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
];

var metaSlots = [
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
];

var couponSlots = [
    112,
    113,
    114,
    115,
    116,
    117,
];

var anahtarSlots = [
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
];

var InventoryOption = "102, 102, 113";
var totalWeight = 0x0;
var totalWeightOther = 0x0;
var playerMaxWeight = 0x0;
var otherMaxWeight = 0x0;
var yerDegistirme = 0x0;
var playerHex;
var whitelistTimer = false;
var whitelistTimeout = [];
var otherLabel = '';
var ClickedItemData = {};
var SelectedAttachment = null;
var AttachmentScreenActive = false;
var ControlPressed = false;
var disableRightMouse = false;
var selectedItem = null;
var givingItem = null;
var IsDragging = false;
var elde = false;
var cashMoney = null;
var bankMoney = null;
var Meslek = null;
var inWarZone = false;
$(document).on("keydown", function () {
  switch (event.keyCode) {
    case 0x1b:
      Inventory.Close();
      break;
    case 0x9:
      Inventory.Close();
      break;
    case 0x11:
      ControlPressed = true;
      break;
  }
});
$(document).on('keyup', function () {
  switch (event.keyCode) {
    case 0x11:
      ControlPressed = false;
      break;
  }
});
$(document).on('mouseenter', ".item-slot", function (_0x1dfdf3) {
  _0x1dfdf3.preventDefault();
  $(".ply-iteminfo-container").css("opacity", '0.0');
  if ($(this).data("item") != null) {
    $('.ply-iteminfo-container').css('opacity', "1.0");
    $(".ply-iteminfo-container").css("display", "block");
    FormatItemInfo($(this).data('item'), $(this));
  }
});
$(document).on("mouseleave", ".item-slot", function (_0xf550be) {
  $(".ply-iteminfo-container").css("opacity", "0.0");
});
function GetFirstFreeSlot(_0x36f154, _0x30cea3) {
  var _0x35cdef = null;
  $.each(_0x36f154.find(".item-slot"), function (_0x28a83b, _0x1323ca) {
    if ($(_0x1323ca).data("item") === undefined) {
      if (_0x35cdef === null) {
        _0x35cdef = _0x28a83b + 0x1;
      }
    }
  });
  return _0x35cdef;
}
function CanQuickMove() {
  var _0x4a5ba5 = otherLabel.toLowerCase();
  var _0x3fccb2 = true;
  if (_0x4a5ba5.split('-')[0x0] == "player") {
    _0x3fccb2 = false;
  }
  return _0x3fccb2;
}
$(document).on("mousedown", ".item-slot", function (_0x2619f1) {
  switch (_0x2619f1.which) {
    case 0x3:
      fromSlot = $(this).attr("data-slot");
      fromInventory = $(this).parent();
      if ($(fromInventory).attr('data-inventory') == "player") {
        toInventory = $(".other-inventory");
      } else {
        toInventory = $(".player-inventory");
      }
      toSlot = GetFirstFreeSlot(toInventory, $(this));
      if ($(this).data("item") === undefined) {
        return;
      }
      toAmount = $(this).data('item').amount;
      if (ControlPressed) {
        if (toAmount > 0x1) {
          toAmount = Math.round(toAmount / 0x2);
        }
      }
      if (CanQuickMove()) {
        if (toSlot === null) {
          InventoryError(fromInventory, fromSlot);
          return;
        }
        if (fromSlot == toSlot && fromInventory == toInventory) {
          return;
        }
        if (toAmount >= 0x0) {
          if (updateweights(fromSlot, toSlot, fromInventory, toInventory, toAmount)) {
            swap(fromSlot, toSlot, fromInventory, toInventory, toAmount);
          }
        }
      } else {
        InventoryError(fromInventory, fromSlot);
      }
      break;
  }
});
$(document).on('dblclick', '.item-slot', function(event){
  switch(event.which) {
      case 1:
          fromSlot = $(this).attr("data-slot");
          fromInventory = $(this).parent();
          fromData = fromInventory.find("[data-slot=" + fromSlot + "]").data("item");
         
              ClickMouse = false;
  
              if(fromData.useable) {
                  Inventory.Close();
        
                  $.post("https://qb-inventory/UseItem", JSON.stringify({
                      inventory: (fromInventory.attr("data-inventory")),
                      item: fromData,
                  }));
              }
          break;
    case 0x3:
      fromSlot = $(this).attr("data-slot");
      fromInventory = $(this).parent();
      if ($(fromInventory).attr("data-inventory") == "player") {
        toInventory = $(".other-inventory");
      } else {
        toInventory = $(".player-inventory");
      }
      toSlot = GetFirstFreeSlot(toInventory, $(this));
      if ($(this).data("item") === undefined) {
        return;
      }
      toAmount = $(this).data('item').amount;
      if (ControlPressed) {
        if (toAmount > 0x1) {
          toAmount = Math.round(toAmount / 0x2);
        }
      }
      if (CanQuickMove()) {
        if (toSlot === null) {
          InventoryError(fromInventory, fromSlot);
          return;
        }
        if (fromSlot == toSlot && fromInventory == toInventory) {
          return;
        }
        if (toAmount >= 0x0) {
          if (updateweights(fromSlot, toSlot, fromInventory, toInventory, toAmount)) {
            swap(fromSlot, toSlot, fromInventory, toInventory, toAmount);
          }
        }
      } else {
        InventoryError(fromInventory, fromSlot);
      }
      break;
  }
});
$(document).on("click", ".item-slot", function (_0x2f1ddd) {
  _0x2f1ddd.preventDefault();
  var _0x3be7f1 = $(this).data("item");
  if (_0x3be7f1 !== null && _0x3be7f1 !== undefined) {
    if (_0x3be7f1.name !== undefined) {
      if (_0x3be7f1.name.split('_')[0x0] == "weapon") {
        if (!$('#weapon-attachments').length) {
          $(".inv-options-list").append("<center><div class=\"inv-option-item\" id=\"weapon-attachments\"><p>EKLENTILER</p></div></center>");
          $("#weapon-attachments").hide().fadeIn(0xfa);
          ClickedItemData = _0x3be7f1;
        } else if (ClickedItemData == _0x3be7f1) {
          $("#weapon-attachments").fadeOut(0xfa, function () {
            $("#weapon-attachments").remove();
          });
          ClickedItemData = {};
        } else {
          ClickedItemData = _0x3be7f1;
        }
      } else {
        ClickedItemData = {};
        if ($("#weapon-attachments").length) {
          $("#weapon-attachments").fadeOut(0xfa, function () {
            $("#weapon-attachments").remove();
          });
        }
      }
    } else {
      ClickedItemData = {};
      if ($('#weapon-attachments').length) {
        $('#weapon-attachments').fadeOut(0xfa, function () {
          $("#weapon-attachments").remove();
        });
      }
    }
  } else {
    ClickedItemData = {};
    if ($("#weapon-attachments").length) {
      $("#weapon-attachments").fadeOut(0xfa, function () {
        $("#weapon-attachments").remove();
      });
    }
  }
});
$(document).on("click", '.weapon-attachments-back', function (_0x11adcb) {
  _0x11adcb.preventDefault();
  $("#qbus-inventory").css({
    'display': "block"
  });
  $("#qbus-inventory").animate({
    'left': "0vw"
  }, 0xc8);
  $('.weapon-attachments-container').animate({
    'left': "-100vw"
  }, 0xc8, function () {
    $('.weapon-attachments-container').css({
      'display': "none"
    });
  });
  AttachmentScreenActive = false;
});
function FormatAttachmentInfo(_0x4b820a) {
  $.post("https://qb-inventory/GetWeaponData", JSON.stringify({
    'weapon': _0x4b820a.name,
    'ItemData': ClickedItemData
  }), function (_0xc32e69) {
    var _0x539719 = "9mm";
    var _0x3af2c0 = 0x64;
    if (_0xc32e69.WeaponData.ammotype == "AMMO_RIFLE") {
      _0x539719 = '7.62';
    } else if (_0xc32e69.WeaponData.ammotype == "AMMO_SHOTGUN") {
      _0x539719 = "12 Gauge";
    }
    if (ClickedItemData.info.quality !== undefined) {
      _0x3af2c0 = ClickedItemData.info.quality;
    }
    $('.weapon-attachments-container-title').html(_0xc32e69.WeaponData.label + " | " + _0x539719);
    $(".weapon-attachments-container-description").html(_0xc32e69.WeaponData.description);
    $('.weapon-attachments-container-details').html("<span style=\"font-weight: bold; letter-spacing: .1vh;\">Seri Numarası</span><br> " + ClickedItemData.info.serie + "<br><br><span style=\"font-weight: bold; letter-spacing: .1vh;\">Sağlamlık - " + _0x3af2c0.toFixed() + "% </span> <div class=\"weapon-attachments-container-detail-durability\"><div class=\"weapon-attachments-container-detail-durability-total\"></div></div>");
    $(".weapon-attachments-container-detail-durability-total").css({
      'width': _0x3af2c0 + '%'
    });
    $(".weapon-attachments-container-image").attr("src", "./attachment_images/" + _0xc32e69.WeaponData.name + ".png");
    $('.weapon-attachments').html('');
    if (_0xc32e69.AttachmentData !== null && _0xc32e69.AttachmentData !== undefined) {
      if (_0xc32e69.AttachmentData.length > 0x0) {
        $(".weapon-attachments-title").html("<span style=\"font-weight: bold; letter-spacing: .1vh;\">Eklentiler</span>");
        $.each(_0xc32e69.AttachmentData, function (_0x1cc01d, _0x192d78) {
          var _0x2a5458 = _0xc32e69.WeaponData.ammotype.split('_')[0x1].toLowerCase();
          $(".weapon-attachments").append("<div class=\"weapon-attachment\" id=\"weapon-attachment-" + _0x1cc01d + "\"> <div class=\"weapon-attachment-label\"><p>" + _0x192d78.label + "</p></div> <div class=\"weapon-attachment-img\"><img src=\"./images/" + _0x2a5458 + '_' + _0x192d78.attachment + ".png\"></div> </div>");
          _0x192d78.id = _0x1cc01d;
          $("#weapon-attachment-" + _0x1cc01d).data("AttachmentData", _0x192d78);
        });
      } else {
        $(".weapon-attachments-title").html("<span style=\"font-weight: bold; letter-spacing: .1vh;\">Bu silah eklenti içermiyor</span>");
      }
    } else {
      $(".weapon-attachments-title").html("<span style=\"font-weight: bold; letter-spacing: .1vh;\">Bu silah eklenti içermiyor</span>");
    }
    handleAttachmentDrag();
  });
}
var AttachmentDraggingData = {};
function handleAttachmentDrag() {
  $('.weapon-attachment').draggable({
    'helper': 'clone',
    'appendTo': "body",
    'scroll': true,
    'revertDuration': 0x0,
    'revert': "invalid",
    'start': function (_0xdbb08b, _0x1d0c5d) {
      var _0x1fbf7f = $(this).data("AttachmentData");
      $(this).addClass("weapon-dragging-class");
      AttachmentDraggingData = _0x1fbf7f;
    },
    'stop': function () {
      $(this).removeClass("weapon-dragging-class");
    }
  });
  $(".weapon-attachments-remove").droppable({
    'accept': ".weapon-attachment",
    'hoverClass': "weapon-attachments-remove-hover",
    'drop': function (_0x5f5518, _0x3676f4) {
      $.post("https://qb-inventory/RemoveAttachment", JSON.stringify({
        'AttachmentData': AttachmentDraggingData,
        'WeaponData': ClickedItemData
      }), function (_0x295fa1) {
        if (_0x295fa1.Attachments !== null && _0x295fa1.Attachments !== undefined) {
          if (_0x295fa1.Attachments.length > 0x0) {
            $('#weapon-attachment-' + AttachmentDraggingData.id).fadeOut(0x96, function () {
              $('#weapon-attachment-' + AttachmentDraggingData.id).remove();
              AttachmentDraggingData = null;
            });
          } else {
            $("#weapon-attachment-" + AttachmentDraggingData.id).fadeOut(0x96, function () {
              $('#weapon-attachment-' + AttachmentDraggingData.id).remove();
              AttachmentDraggingData = null;
              $(".weapon-attachments").html('');
            });
            $(".weapon-attachments-title").html("<span style=\"font-weight: bold; letter-spacing: .1vh;\">This gun doesn't contain attachments</span>");
          }
        } else {
          $("#weapon-attachment-" + AttachmentDraggingData.id).fadeOut(0x96, function () {
            $("#weapon-attachment-" + AttachmentDraggingData.id).remove();
            AttachmentDraggingData = null;
            $(".weapon-attachments").html('');
          });
          $(".weapon-attachments-title").html("<span style=\"font-weight: bold; letter-spacing: .1vh;\">This gun doesn't contain attachments</span>");
        }
        Inventory.Close();
      });
    }
  });
}
$(document).on("click", "#weapon-attachments", function (_0x48a908) {
  _0x48a908.preventDefault();
  if (!Inventory.IsWeaponBlocked(ClickedItemData.name)) {
    $(".weapon-attachments-container").css({
      'display': 'block'
    });
    $("#qbus-inventory").animate({
      'left': "100vw"
    }, 0xc8, function () {
      $("#qbus-inventory").css({
        'display': "none"
      });
    });
    $(".weapon-attachments-container").animate({
      'left': "0vw"
    }, 0xc8);
    AttachmentScreenActive = true;
    FormatAttachmentInfo(ClickedItemData);
  } else {
    $.post("https://qb-inventory/Notify", JSON.stringify({
      'message': "Attachments are unavailable for this gun.",
      'type': "error"
    }));
  }
});
function FormatItemInfo(_0x198c18, _0x2786cf) {
  let _0x47f295 = $('.ply-iteminfo-container');
  let _0x117101 = $(_0x2786cf).offset();
  _0x47f295.css("top", _0x117101.top - _0x47f295.height());
  let _0x5320f8 = _0x117101.left + 0x5c;
  if (_0x5320f8 + _0x47f295.width() > $(window).width()) {
    _0x5320f8 = $(window).width() - _0x47f295.width() - 0x14;
  }
  _0x47f295.css("left", _0x5320f8);
  if (_0x198c18 != null && _0x198c18.info != '') {
    if (_0x198c18.info.ammo >= 0xfa) {
      _0x198c18.info.ammo = 0xfa;
    }
    if (typeof _0x198c18.info.uses == "undefined") {
      _0x198c18.info.uses = '∞';
    }
    if (_0x198c18.name == "id_card") {
      var _0x4e7f53 = "Erkek";
      if (_0x198c18.info.gender == 0x1) {
        _0x4e7f53 = "Kadın";
      }
      $(".item-info-title").html('<p>' + _0x198c18.label + "</p>");
      $(".item-info-description").html("<p><strong>CSN: </strong><span>" + _0x198c18.info.citizenid + "</span></p><p><strong>Ad: </strong><span>" + _0x198c18.info.firstname + "</span></p><p><strong>Soyad: </strong><span>" + _0x198c18.info.lastname + "</span></p><p><strong>Doğum Tarihi: </strong><span>" + _0x198c18.info.birthdate + "</span></p><p><strong>Cinsiyet: </strong><span>" + _0x4e7f53 + "</span></p><p><strong>Uyruk: </strong><span>" + _0x198c18.info.nationality + "</span></p>");
    } else {
      if (_0x198c18.name == 'driver_license') {
        $(".item-info-title").html('<p>' + _0x198c18.label + "</p>");
        $('.item-info-description').html("<p><strong>Ad: </strong><span>" + _0x198c18.info.firstname + "</span></p><p><strong>Soyad: </strong><span>" + _0x198c18.info.lastname + "</span></p><p><strong>Doğum Tarihi: </strong><span>" + _0x198c18.info.birthdate + "</span></p><p><strong>Lisanslar: </strong><span>" + _0x198c18.info.type + "</span></p>");
      } else {
        if (_0x198c18.name == "lawyerpass") {
          $('.item-info-title').html("<p>" + _0x198c18.label + "</p>");
          $(".item-info-description").html("<p><strong>Pass-ID: </strong><span>" + _0x198c18.info.id + "</span></p><p><strong>Ad: </strong><span>" + _0x198c18.info.firstname + "</span></p><p><strong>Soyad: </strong><span>" + _0x198c18.info.lastname + "</span></p><p><strong>CSN: </strong><span>" + _0x198c18.info.citizenid + "</span></p>");
        } else {
          if (_0x198c18.name == "pdkimlik") {
            $('.item-info-title').html("<p>" + _0x198c18.label + '</p>');
            $(".item-info-description").html("<p><strong>CSN: </strong><span>" + _0x198c18.info.citizenid + "</span></p><p><strong>Ad: </strong><span>" + _0x198c18.info.firstname + "</span></p><p><strong>Soyad: </strong><span>" + _0x198c18.info.lastname + "</span></p><p><strong>Rütbe: </strong><span>" + _0x198c18.info.rutbe + "</span></p>");
          } else {
            if (_0x198c18.name == 'harness') {
              $('.item-info-title').html("<p>" + _0x198c18.label + '</p>');
              $(".item-info-description").html("<p>" + _0x198c18.info.uses + " kullanım hakkın kaldı. Nano teknoloji araç kemeri.</p>");
            } else {
              if (_0x198c18.name == "lockpick") {
                $(".item-info-title").html("<p>" + _0x198c18.label + "</p>");
                $(".item-info-description").html("<p>" + _0x198c18.info.uses + " kullanım hakkın kaldı. Maymuncuk.</p>");
              } else {
                if (_0x198c18.name == "advancedlockpick") {
                  $(".item-info-title").html("<p>" + _0x198c18.label + "</p>");
                  $(".item-info-description").html("<p>" + _0x198c18.info.uses + " kullanım hakkın kaldı. Gelişmiş maymuncuk.</p>");
                } else {
                  if (_0x198c18.name == "screwdriverset") {
                    $(".item-info-title").html("<p>" + _0x198c18.label + "</p>");
                    $(".item-info-description").html("<p>" + _0x198c18.info.uses + " kullanım hakkın kaldı. Plaka sökmek için kullanılabilir.</p>");
                  } else {
                    if (_0x198c18.type == 'weapon') {
                      $(".item-info-title").html("<p>" + _0x198c18.label + '</p>');
                      if (_0x198c18.info.ammo == undefined) {
                        _0x198c18.info.ammo = 0x0;
                      } else if (_0x198c18.info.ammo != null) {
                        _0x198c18.info.ammo;
                      } else {
                        0x0;
                      }
                      if (_0x198c18.info.attachments != null) {
                        var _0x47276c = '';
                        $.each(_0x198c18.info.attachments, function (_0x58ee92, _0x50375c) {
                          if (_0x58ee92 == _0x198c18.info.attachments.length - 0x1) {
                            _0x47276c += _0x50375c.label;
                          } else {
                            _0x47276c += _0x50375c.label + ", ";
                          }
                        });
                        $(".item-info-description").html("<p><strong>Seri Numarası: </strong><span>" + _0x198c18.info.serie + "</span></p><p><strong>Mermi: </strong><span>" + _0x198c18.info.ammo + "</span></p><p><strong>Eklentiler: </strong><span>" + _0x47276c + "</span></p>");
                      } else {
                        $(".item-info-description").html("<p><strong>Seri Numarası: </strong><span>" + _0x198c18.info.serie + "</span></p><p><strong>Mermi: </strong><span>" + _0x198c18.info.ammo + "</span></p><p>" + _0x198c18.description + "</p>");
                      }
                    } else {
                      if (_0x198c18.name == "filled_evidence_bag") {
                        $(".item-info-title").html("<p>" + _0x198c18.label + "</p>");
                        if (_0x198c18.info.type == "casing") {
                          $(".item-info-description").html("<p><strong>Kanıt malzemesi: </strong><span>" + _0x198c18.info.label + "</span></p><p><strong>Tip numarası: </strong><span>" + _0x198c18.info.ammotype + "</span></p><p><strong>Kalibre: </strong><span>" + _0x198c18.info.ammolabel + "</span></p><p><strong>Seri Numarası: </strong><span>" + _0x198c18.info.serie + "</span></p><p><strong>Olay yeri: </strong><span>" + _0x198c18.info.street + "</span></p><br />");
                        } else {
                          if (_0x198c18.info.type == "blood") {
                            $(".item-info-description").html("<p><strong>Kanıt malzemesi: </strong><span>" + _0x198c18.info.label + "</span></p><p><strong>Kan grubu: </strong><span>" + _0x198c18.info.bloodtype + "</span></p><p><strong>DNA Kodu: </strong><span>" + _0x198c18.info.dnalabel + "</span></p><p><strong>Olay yeri: </strong><span>" + _0x198c18.info.street + "</span></p><br />");
                          } else {
                            if (_0x198c18.info.type == "fingerprint") {
                              $(".item-info-description").html("<p><strong>Kanıt malzemesi: </strong><span>" + _0x198c18.info.label + "</span></p><p><strong>Parmak kalıbı: </strong><span>" + _0x198c18.info.fingerprint + "</span></p><p><strong>Olay yeri: </strong><span>" + _0x198c18.info.street + "</span></p><br />");
                            } else if (_0x198c18.info.type == "dna") {
                              $(".item-info-description").html("<p><strong>Kanıt malzemesi: </strong><span>" + _0x198c18.info.label + "</span></p><p><strong>DNA kodu: </strong><span>" + _0x198c18.info.dnalabel + "</span></p><br />");
                            }
                          }
                        }
                      } else {
                        if (_0x198c18.info.costs != undefined && _0x198c18.info.costs != null) {
                          $(".item-info-title").html('<p>' + _0x198c18.label + "</p>");
                          $('.item-info-description').html("<p>" + _0x198c18.info.costs + "</p>");
                        } else {
                          if (_0x198c18.name == 'stickynote') {
                            $(".item-info-title").html("<p>" + _0x198c18.label + "</p>");
                            $(".item-info-description").html("<p><strong>Tarih-Saat: </strong><span>" + _0x198c18.info.date + "</span></p><p><strong></strong><span>" + _0x198c18.info.label + "</span></p><p><strong>Yazan: </strong><span>" + _0x198c18.info.author + "</span></p>");
                          } else {
                            if (_0x198c18.name == "vehiclekey") {
                              $(".item-info-title").html('<p>' + _0x198c18.label + "</p>");
                              $('.item-info-description').html("<p><strong>Plaka: </strong><span>" + _0x198c18.info.plate + "</span></p><p><strong>Model: </strong><span>" + _0x198c18.info.model + "</span></p>");
                            } else {
                              if (_0x198c18.name == "bs_menu") {
                                $(".item-info-title").html("<p>" + _0x198c18.label + "</p>");
                                $('.item-info-description').html("<p><strong></strong><span>" + _0x198c18.info.label + "</span></p><p><strong>Fiyat: </strong><span>" + _0x198c18.info.price + "$</span></p>");
                              } else {
                                if (_0x198c18.name == "moneybag") {
                                  $('.item-info-title').html("<p>" + _0x198c18.label + "</p>");
                                  $('.item-info-description').html("<p><strong>Nakit miktarı: </strong><span>$" + _0x198c18.info.cash + '</span></p>');
                                } else {
                                  if (_0x198c18.name == "markedbills") {
                                    $(".item-info-title").html("<p>" + _0x198c18.label + "</p>");
                                    $(".item-info-description").html("<p>" + _0x198c18.description + "</p>");
                                  } else {
                                    if (_0x198c18.name == 'labkey') {
                                      $(".item-info-title").html('<p>' + _0x198c18.label + "</p>");
                                      $(".item-info-description").html("<p>Lab: " + _0x198c18.info.lab + "</p>");
                                    } else {
                                      if (_0x198c18.name == "plaka") {
                                        $(".item-info-title").html('<p>' + _0x198c18.label + '</p>');
                                        $(".item-info-description").html("<p>Plaka: " + _0x198c18.info.plaka + "</p>");
                                      } else if (_0x198c18.name == "weaponlicense") {
                                        $(".item-info-title").html("<p>" + _0x198c18.label + "</p>");
                                        $(".item-info-description").html("<p><strong>Ad Soyad: </strong><span>" + _0x198c18.info.label + "</span></p><p><strong>Silah Modeli: </strong><span>" + _0x198c18.info.model + "</span></p><p><strong>Seri Numarası: </strong><span>" + _0x198c18.info.serie + "</span></p>");
                                      } else {
                                        $(".item-info-title").html("<p>" + _0x198c18.label + "</p>");
                                        $(".item-info-description").html("<p>" + _0x198c18.description + "</p>");
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  } else {
    $(".item-info-title").html("<p>" + _0x198c18.label + "</p>");
    $(".item-info-description").html("<p>" + _0x198c18.description + "</p>");
  }
}
function handleDragDrop() {
  $('.item-drag').draggable({
    'helper': "clone",
    'appendTo': "body",
    'scroll': true,
    'revertDuration': 0x0,
    'revert': 'invalid',
    'cancel': '.item-nodrag',
    'start': function (_0x5dfa77, _0x3f7589) {
      IsDragging = true;
      $(this).find('img').css("filter", "brightness(50%)");
      var _0x526ba8 = $(this).data("item");
      var _0x17a36f = $('#item-amount').val();
      if (!_0x526ba8.useable) {
        $('#item-use').css("background", "rgba(35,35,35, 0.5");
      }
      if (_0x17a36f == 0x0) {
        if (_0x526ba8.price != null) {
          $(this).find(".item-slot-amount p").html(_0x526ba8.amount);
          $(".ui-draggable-dragging").find(".item-slot-amount p").html(_0x526ba8.amount);
          $(".ui-draggable-dragging").find(".item-slot-key").remove();
          if ($(this).parent().attr("data-inventory") == 'hotbar') {}
        } else {
          $(this).find(".item-slot-amount p").html(_0x526ba8.amount);
          $('.ui-draggable-dragging').find(".item-slot-amount p").html(_0x526ba8.amount);
          $(".ui-draggable-dragging").find('.item-slot-key').remove();
          if ($(this).parent().attr("data-inventory") == 'hotbar') {}
        }
      } else {
        if (_0x17a36f > _0x526ba8.amount) {
          if (_0x526ba8.price != null) {
            $(this).find(".item-slot-amount p").html(_0x526ba8.amount);
            if ($(this).parent().attr('data-inventory') == 'hotbar') {}
          } else {
            $(this).find(".item-slot-amount p").html(_0x526ba8.amount);
            if ($(this).parent().attr("data-inventory") == "hotbar") {}
          }
          InventoryError($(this).parent(), $(this).attr("data-slot"));
        } else {
          if (_0x17a36f > 0x0) {
            if (_0x526ba8.price != null) {
              $(this).find(".item-slot-amount p").html(_0x526ba8.amount);
              $(".ui-draggable-dragging").find(".item-slot-amount p").html(_0x526ba8.amount);
              $(".ui-draggable-dragging").find('.item-slot-key').remove();
              if ($(this).parent().attr("data-inventory") == "hotbar") {}
            } else {
              $(this).find(".item-slot-amount p").html(_0x526ba8.amount - _0x17a36f);
              $(".ui-draggable-dragging").find(".item-slot-amount p").html(_0x17a36f);
              $(".ui-draggable-dragging").find(".item-slot-key").remove();
              if ($(this).parent().attr("data-inventory") == "hotbar") {}
            }
          } else {
            if ($(this).parent().attr("data-inventory") == 'hotbar') {}
            $(".ui-draggable-dragging").find(".item-slot-key").remove();
            $(this).find(".item-slot-amount p").html(_0x526ba8.amount);
            InventoryError($(this).parent(), $(this).attr("data-slot"));
          }
        }
      }
    },
    'stop': function () {
      setTimeout(function () {
        IsDragging = false;
      }, 0x12c);
      $(this).find("img").css("filter", 'brightness(100%)');
    }
  });
  $('.item-slot').droppable({
    'hoverClass': 'item-slot-hoverClass',
    'drop': function (_0x37dc58, _0x86008e) {
      setTimeout(function () {
        IsDragging = false;
      }, 0x12c);
      fromSlot = _0x86008e.draggable.attr("data-slot");
      fromInventory = _0x86008e.draggable.parent();
      toSlot = $(this).attr("data-slot");
      toInventory = $(this).parent();
      toAmount = $("#item-amount").val();
      if (fromSlot == toSlot && fromInventory == toInventory) {
        return;
      }
      if (toAmount >= 0x0) {
        if (updateweights(fromSlot, toSlot, fromInventory, toInventory, toAmount)) {
          swap(fromSlot, toSlot, fromInventory, toInventory, toAmount);
          $.post("https://qb-inventory/updateData");
        }
      }
    }
  });
  $("#item-use").droppable({
    'hoverClass': 'button-hover',
    'drop': function (_0x52b099, _0x35e1d3) {
      setTimeout(function () {
        IsDragging = false;
      }, 0x12c);
      fromData = _0x35e1d3.draggable.data("item");
      fromInventory = _0x35e1d3.draggable.parent().attr("data-inventory");
      if (fromData.useable) {
        Inventory.Close();
        $.post("https://qb-inventory/UseItem", JSON.stringify({
          'inventory': fromInventory,
          'item': fromData
        }));
      }
    }
  });
  $('#item-drop').droppable({
    'hoverClass': 'item-slot-hoverClass',
    'drop': function (_0x2457aa, _0x8f1157) {
      setTimeout(function () {
        IsDragging = false;
      }, 0x12c);
      fromData = _0x8f1157.draggable.data("item");
      fromInventory = _0x8f1157.draggable.parent().attr("data-inventory");
      amount = $("#item-amount").val();
      if (amount == 0x0) {
        amount = fromData.amount;
      }
      $(this).css("background", "rgba(35,35,35, 0.7");
      $.post("https://qb-inventory/DropItem", JSON.stringify({
        'inventory': fromInventory,
        'item': fromData,
        'amount': parseInt(amount)
      }));
    }
  });
}
function updateweights(_0x1dc7b2, _0x4650ae, _0x5ab3b5, _0x404414, _0x252248) {
  var _0x48d045 = otherLabel.toLowerCase();
  if (_0x48d045.split('-')[0x0] == "dropped") {
    toData = _0x404414.find("[data-slot=" + _0x4650ae + ']').data("item");
    if (toData !== null && toData !== undefined) {
      InventoryError(_0x5ab3b5, _0x1dc7b2);
      return false;
    }
  }
  if (_0x5ab3b5.attr("data-inventory") == "hotbar" && _0x404414.attr("data-inventory") == "player" || _0x5ab3b5.attr("data-inventory") == "player" && _0x404414.attr("data-inventory") == "hotbar" || _0x5ab3b5.attr("data-inventory") == "player" && _0x404414.attr("data-inventory") == 'player' || _0x5ab3b5.attr("data-inventory") == "hotbar" && _0x404414.attr("data-inventory") == "hotbar") {
    return true;
  }
  if (_0x5ab3b5.attr('data-inventory').split('-')[0x0] == "itemshop" && _0x404414.attr("data-inventory").split('-')[0x0] == 'itemshop' || _0x5ab3b5.attr("data-inventory") == "crafting" && _0x404414.attr("data-inventory") == 'crafting') {
    itemData = _0x5ab3b5.find("[data-slot=" + _0x1dc7b2 + ']').data("item");
    if (_0x5ab3b5.attr('data-inventory').split('-')[0x0] == "itemshop") {
      _0x5ab3b5.find("[data-slot=" + _0x1dc7b2 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + itemData.image + "\" alt=\"" + itemData.name + "\" /></div><div class=\"item-slot-amount\"><p> " + itemData.amount + "</div><div class=\"item-slot-name\"><p>" + " $" + itemData.price + "</p></div><div class=\"item-slot-label\"><p>" + itemData.label + "</p></div>");
    } else {
      _0x5ab3b5.find('[data-slot=' + _0x1dc7b2 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + itemData.image + "\" alt=\"" + itemData.name + "\" /></div><div class=\"item-slot-amount\"><p>" + itemData.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (itemData.weight * itemData.amount / 0x3e8).toFixed(0x1) + "</p></div><div class=\"item-slot-label\"><p>" + itemData.label + "</p></div>");
    }
    InventoryError(_0x5ab3b5, _0x1dc7b2);
    return false;
  }
  if (_0x252248 == 0x0 && (_0x5ab3b5.attr("data-inventory").split('-')[0x0] == 'itemshop' || _0x5ab3b5.attr('data-inventory') == "crafting")) {
    itemData = _0x5ab3b5.find("[data-slot=" + _0x1dc7b2 + ']').data("item");
    if (_0x5ab3b5.attr('data-inventory').split('-')[0x0] == 'itemshop') {
      _0x5ab3b5.find('[data-slot=' + _0x1dc7b2 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + itemData.image + "\" alt=\"" + itemData.name + "\" /></div><div class=\"item-slot-amount\"><p> " + itemData.amount + "</div><div class=\"item-slot-name\"><p>" + " $" + itemData.price + "</p></div><div class=\"item-slot-label\"><p>" + itemData.label + "</p></div>");
    } else {
      _0x5ab3b5.find('[data-slot=' + _0x1dc7b2 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + itemData.image + "\" alt=\"" + itemData.name + "\" /></div><div class=\"item-slot-amount\"><p>" + itemData.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (itemData.weight * itemData.amount / 0x3e8).toFixed(0x1) + "</p></div><div class=\"item-slot-label\"><p>" + itemData.label + "</p></div>");
    }
    InventoryError(_0x5ab3b5, _0x1dc7b2);
    return false;
  }
  if (_0x404414.attr("data-inventory").split('-')[0x0] == "itemshop" || _0x404414.attr("data-inventory") == "crafting") {
    itemData = _0x404414.find("[data-slot=" + _0x4650ae + ']').data("item");
    if (_0x404414.attr("data-inventory").split('-')[0x0] == 'itemshop') {
      _0x404414.find('[data-slot=' + _0x4650ae + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + itemData.image + "\" alt=\"" + itemData.name + "\" /></div><div class=\"item-slot-amount\"><p> " + itemData.amount + "</div><div class=\"item-slot-name\"><p>" + " $" + itemData.price + "</p></div><div class=\"item-slot-label\"><p>" + itemData.label + '</p></div>');
    } else {
      _0x404414.find('[data-slot=' + _0x4650ae + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + itemData.image + "\" alt=\"" + itemData.name + "\" /></div><div class=\"item-slot-amount\"><p>" + itemData.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (itemData.weight * itemData.amount / 0x3e8).toFixed(0x1) + "</p></div><div class=\"item-slot-label\"><p>" + itemData.label + '</p></div>');
    }
    InventoryError(_0x5ab3b5, _0x1dc7b2);
    return false;
  }
  if (_0x5ab3b5.attr("data-inventory") != _0x404414.attr("data-inventory")) {
    fromData = _0x5ab3b5.find('[data-slot=' + _0x1dc7b2 + ']').data("item");
    toData = _0x404414.find('[data-slot=' + _0x4650ae + ']').data("item");
    if (_0x252248 == 0x0) {
      _0x252248 = fromData.amount;
    }
    if (toData == null || fromData.name == toData.name) {
      if (_0x5ab3b5.attr("data-inventory") == 'player' || _0x5ab3b5.attr('data-inventory') == 'hotbar') {
        totalWeight = totalWeight - fromData.weight * _0x252248;
        totalWeightOther = totalWeightOther + fromData.weight * _0x252248;
      } else {
        totalWeight = totalWeight + fromData.weight * _0x252248;
        totalWeightOther = totalWeightOther - fromData.weight * _0x252248;
      }
    } else if (_0x5ab3b5.attr("data-inventory") == "player" || _0x5ab3b5.attr("data-inventory") == "hotbar") {
      totalWeight = totalWeight - fromData.weight * _0x252248;
      totalWeight = totalWeight + toData.weight * toData.amount;
      totalWeightOther = totalWeightOther + fromData.weight * _0x252248;
      totalWeightOther = totalWeightOther - toData.weight * toData.amount;
    } else {
      totalWeight = totalWeight + fromData.weight * _0x252248;
      totalWeight = totalWeight - toData.weight * toData.amount;
      totalWeightOther = totalWeightOther - fromData.weight * _0x252248;
      totalWeightOther = totalWeightOther + toData.weight * toData.amount;
    }
  }
  if (totalWeight > playerMaxWeight || totalWeightOther > otherMaxWeight && _0x5ab3b5.attr("data-inventory").split('-')[0x0] != "itemshop" && _0x5ab3b5.attr("data-inventory") != 'crafting') {
    InventoryError(_0x5ab3b5, _0x1dc7b2);
    return false;
  }
  var _0x47509c = totalWeight / 0x3e8 / (playerMaxWeight / 0x186a0);
  $('.pro').css('width', _0x47509c + '%');
  $('#player-inv-weight').html((parseInt(totalWeight) / 0x3e8).toFixed(0x2) + " / " + (playerMaxWeight / 0x3e8).toFixed(0x2));
  if (_0x5ab3b5.attr('data-inventory').split('-')[0x0] != "itemshop" && _0x404414.attr("data-inventory").split('-')[0x0] != 'itemshop' && _0x5ab3b5.attr("data-inventory") != 'crafting' && _0x404414.attr("data-inventory") != 'crafting') {
    $("#other-inv-label").html(otherLabel);
    $("#other-inv-weight").html((parseInt(totalWeightOther) / 0x3e8).toFixed(0x2) + " / " + (otherMaxWeight / 0x3e8).toFixed(0x2));
    var _0x1a3848 = totalWeightOther / 0x3e8 / (otherMaxWeight / 0x186a0);
    $(".pro1").css("width", _0x1a3848 + '%');
  }
  return true;
}
var combineslotData = null;
$(document).on("click", ".CombineItem", function (_0x24ff97) {
  _0x24ff97.preventDefault();
  if (combineslotData.toData.combinable.anim != null) {
    $.post("https://qb-inventory/combineWithAnim", JSON.stringify({
      'combineData': combineslotData.toData.combinable,
      'usedItem': combineslotData.toData.name,
      'requiredItem': combineslotData.fromData.name
    }));
  } else {
    $.post("https://qb-inventory/combineItem", JSON.stringify({
      'reward': combineslotData.toData.combinable.reward,
      'toItem': combineslotData.toData.name,
      'fromItem': combineslotData.fromData.name
    }));
  }
  Inventory.Close();
});
$(document).on("click", '.SwitchItem', function (_0x4a2692) {
  _0x4a2692.preventDefault();
  $(".combine-option-container").hide();
  optionSwitch(combineslotData.fromSlot, combineslotData.toSlot, combineslotData.fromInv, combineslotData.toInv, combineslotData.toAmount, combineslotData.toData, combineslotData.fromData);
});
function optionSwitch(_0x9fb5ba, _0x2c310c, _0x542e53, _0x696841, _0x22936f, _0x150467, _0x2b1e61) {
  _0x2b1e61.slot = parseInt(_0x2c310c);
  _0x696841.find("[data-slot=" + _0x2c310c + ']').data("item", _0x2b1e61);
  _0x696841.find('[data-slot=' + _0x2c310c + ']').addClass("item-drag");
  _0x696841.find('[data-slot=' + _0x2c310c + ']').removeClass("item-nodrag");
  if (_0x2c310c < 0x6) {
    _0x696841.find('[data-slot=' + _0x2c310c + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x2b1e61.image + "\" alt=\"" + _0x2b1e61.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x2b1e61.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x2b1e61.weight * _0x2b1e61.amount / 0x3e8).toFixed(0x1) + " </p></div><div class=\"item-slot-label\"><p>" + _0x2b1e61.label + "</p></div>");
  } else {
    _0x696841.find("[data-slot=" + _0x2c310c + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x2b1e61.image + "\" alt=\"" + _0x2b1e61.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x2b1e61.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x2b1e61.weight * _0x2b1e61.amount / 0x3e8).toFixed(0x1) + " </p></div><div class=\"item-slot-label\"><p>" + _0x2b1e61.label + '</p></div>');
  }
  _0x150467.slot = parseInt(_0x9fb5ba);
  _0x542e53.find("[data-slot=" + _0x9fb5ba + ']').addClass("item-drag");
  _0x542e53.find("[data-slot=" + _0x9fb5ba + ']').removeClass("item-nodrag");
  _0x542e53.find("[data-slot=" + _0x9fb5ba + ']').data("item", _0x150467);
  if (_0x9fb5ba < 0x6) {
    _0x542e53.find("[data-slot=" + _0x9fb5ba + ']').html("<div class=\"item-slot-key\"><p>" + _0x9fb5ba + "</p></div><div class=\"item-slot-img\"><img src=\"images/" + _0x150467.image + "\" alt=\"" + _0x150467.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x150467.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x150467.weight * _0x150467.amount / 0x3e8).toFixed(0x1) + " </p></div><div class=\"item-slot-label\"><p>" + _0x150467.label + "</p></div>");
  } else {
    _0x542e53.find("[data-slot=" + _0x9fb5ba + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x150467.image + "\" alt=\"" + _0x150467.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x150467.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x150467.weight * _0x150467.amount / 0x3e8).toFixed(0x1) + " </p></div><div class=\"item-slot-label\"><p>" + _0x150467.label + "</p></div>");
  }
  $.post("https://qb-inventory/SetInventoryData", JSON.stringify({
    'fromInventory': _0x542e53.attr("data-inventory"),
    'toInventory': _0x696841.attr("data-inventory"),
    'fromSlot': _0x9fb5ba,
    'toSlot': _0x2c310c,
    'fromAmount': _0x22936f,
    'toAmount': _0x150467.amount
  }));
}
function metaClothes(_0x102220, _0x27a94c) {
  fromClothing = false;
  $.each(metaClothing, function (_0x2e2f35, _0x2719be) {
    if (_0x27a94c == undefined) {
      if (_0x2719be == _0x102220.name) {
        fromClothing = true;
      }
    } else if (_0x2719be == _0x102220.name && _0x27a94c.name == _0x2719be) {
      fromClothing = true;
    }
  });
  return fromClothing;
}
function ByPassItem(_0x4f0bed) {
  var _0x27588a = false;
  $.each(bypassItems, function (_0x5f44bd, _0x316633) {
    if (_0x316633 == _0x4f0bed) {
      _0x27588a = true;
    }
  });
  return _0x27588a;
}
function KuponsItem(_0x44f53) {
  var _0x1b65b9 = false;
  $.each(kuponItems, function (_0x1e2417, _0x342c62) {
    if (_0x342c62 == _0x44f53) {
      _0x1b65b9 = true;
    }
  });
  return _0x1b65b9;
}
function getMetaSlot(_0x592e08) {
  var _0x21d6af = false;
  $.each(metaSlots, function (_0xed3d01, _0x54d049) {
    if (_0x54d049 == _0x592e08) {
      _0x21d6af = true;
    }
  });
  return _0x21d6af;
}
function getCouponSlot(_0x496bb6) {
  var _0x57d041 = false;
  $.each(couponSlots, function (_0x562a17, _0x9905ed) {
    if (_0x9905ed == _0x496bb6) {
      _0x57d041 = true;
    }
  });
  return _0x57d041;
}
function getKeySlots(_0x42de0d) {
  var _0x22d1d0 = false;
  $.each(anahtarSlots, function (_0x2a0dd3, _0x294eef) {
    if (_0x294eef == _0x42de0d) {
      _0x22d1d0 = true;
    }
  });
  return _0x22d1d0;
}
function getChangeSlots(_0x478c4c) {
  var _0xd81fad = false;
  $.each(changeSlots, function (_0xb11542, _0x549ae6) {
    if (_0x549ae6 == _0x478c4c) {
      _0xd81fad = true;
    }
  });
  return _0xd81fad;
}
function DropForbiddenItems(_0x2a940b) {
  var _0x5e4761 = false;
  $.each(dropItems, function (_0x42b46c, _0x3ae645) {
    if (_0x3ae645 == _0x2a940b) {
      _0x5e4761 = true;
    }
  });
  return _0x5e4761;
}
function DonateWeapon(_0x121193) {
  var _0x343856 = false;
  var _0x51fb48 = false;
  var _0xa186ae = _0x121193.split('-')[0x0];
  $.each(DonateWeaponWhitelistJob, function (_0x442e23, _0x25f364) {
    if (_0x25f364 == Meslek) {
      _0x343856 = true;
    }
  });
  if (!_0x343856) {
    if (_0xa186ae == "DNT") {
      _0x51fb48 = true;
    }
  }
  return _0x51fb48;
}
function UniqueForbidden(_0x3f0c0d) {
  var _0x70080e = false;
  $.each(uniqueItems, function (_0x3e9acd, _0x283bcf) {
    if (_0x283bcf == _0x3f0c0d) {
      _0x70080e = true;
    }
  });
  return _0x70080e;
}
function ForbStashItems(_0x17a99c) {
  var _0x3c8cad = false;
  $.each(forbiddentStashItems, function (_0x521a17, _0x3a8806) {
    if (_0x3a8806 == _0x17a99c) {
      _0x3c8cad = true;
    }
  });
  return _0x3c8cad;
}
function swap(_0x286332, _0x475f81, _0x5b9852, _0x200ab8, _0x1b1e04) {
  fromData = _0x5b9852.find('[data-slot=' + _0x286332 + ']').data("item");
  toData = _0x200ab8.find("[data-slot=" + _0x475f81 + ']').data("item");
  kek = _0x5b9852.find("[data-slot=" + _0x475f81 + ']').data('item');
  pasa = _0x200ab8.find('[data-slot=' + _0x286332 + ']').data("item");
  fromInvLabel = _0x5b9852.attr("data-inventory");
  toInvLabel = _0x200ab8.attr("data-inventory");
  miktar = $("#item-amount").val();
  var _0x2a6d95 = otherLabel.toLowerCase();
  var _0x4b085e = _0x2a6d95.split('-');
  var _0x21bc79 = fromInvLabel.split('-');
  if (_0x4b085e[0x0] == "oyuncu") {
    if (ForbStashItems(fromData.name)) {
      return InventoryError(_0x5b9852, _0x286332);
    }
  }
  if (toInvLabel !== "player") {
    if (ForbStashItems(fromData.name)) {
      return InventoryError(_0x5b9852, _0x286332);
    }
  }
  if (_0x4b085e[0x1] != undefined) {
    if (_0x4b085e[0x1].split('_')[0x0] == "bag") {
      if (fromData.name == "bag") {
        return InventoryError(_0x5b9852, _0x286332);
      }
    }
  }
  if (swapItem) {
    if (toData != undefined) {
      if (fromData.name !== toData.name) {
        return InventoryError(_0x5b9852, _0x286332);
      }
    }
  }
  if (toInvLabel !== "player") {
    if (_0x4b085e[0x0] == 'yer') {
      if (inWarZone) {
        $.post('https://qb-inventory/Notify', JSON.stringify({
          'message': "Warzone içerisinde yere eşya atamazsın!",
          'type': "error"
        }));
        return InventoryError(_0x5b9852, _0x286332);
      }
    }
  }
  if (toInvLabel !== 'player') {
    if (_0x4b085e[0x0] == "depo" || _0x4b085e[0x0] == "torpido" || _0x4b085e[0x0] == "bagaj") {
      if (toData != undefined) {
        if (toData.unique) {
          $.post("https://qb-inventory/Notify", JSON.stringify({
            'message': "Bu eşyanın üzerine birşey koyamazsın!",
            'type': "error"
          }));
          return InventoryError(_0x5b9852, _0x286332);
        }
      }
    }
  } else {
    if (toInvLabel == "player" && UniqueForbidden(_0x4b085e[0x0])) {
      if (toData != undefined) {
        if (toData.unique) {
          $.post("https://qb-inventory/Notify", JSON.stringify({
            'message': "Bu eşyanın üzerine birşey koyamazsın!",
            'type': "error"
          }));
          return InventoryError(_0x5b9852, _0x286332);
        }
      }
    }
  }
  if (toInvLabel !== "player") {
    if (DonateStashs[_0x4b085e[0x0]]) {
      if (fromData.name.split('_')[0x0] == "weapon") {
        if (DonateWeapon(fromData.info.serie)) {
          return InventoryError(_0x5b9852, _0x286332);
        }
      }
    }
  } else {
    if (_0x21bc79[0x0] == "otherplayer") {
      if (fromData.name.split('_')[0x0] == "weapon") {
        if (DonateWeapon(fromData.info.serie)) {
          return InventoryError(_0x5b9852, _0x286332);
        }
      }
    }
  }
  if (toInvLabel !== "player") {
    if (_0x4b085e[0x0] !== 'depo' && _0x4b085e[0x0] !== "torpido" && _0x4b085e[0x0] !== 'bagaj') {
      if (DropForbiddenItems(fromData.name)) {
        return InventoryError(_0x5b9852, _0x286332);
      }
    }
  }
  if (_0x2a6d95 != undefined && _0x4b085e[0x1] != undefined) {
    if (_0x4b085e[0x1] == "kullanımda") {
      return InventoryError(_0x5b9852, _0x286332);
    }
  }
  if (_0x4b085e[0x0] == "oyuncu") {
    if (KuponsItem(fromData.name)) {
      return InventoryError(_0x5b9852, _0x286332);
    }
  }
  if (toInvLabel !== "player") {
    if (KuponsItem(fromData.name)) {
      return InventoryError(_0x5b9852, _0x286332);
    }
  }
  if (toInvLabel == "player") {
    if (_0x286332 <= 0x63 && getCouponSlot(_0x475f81) || _0x475f81 <= 0x63 && getCouponSlot(_0x286332)) {
      if (!KuponsItem(fromData.name) || toData != undefined && !KuponsItem(toData.name)) {
        return InventoryError(_0x5b9852, _0x286332);
      }
    }
  }
  if (toInvLabel == "player") {
    if (_0x286332 <= 0x63 && getKeySlots(_0x475f81) || _0x475f81 <= 0x63 && getKeySlots(_0x286332)) {
      if (fromData.name !== "vehiclekey" || toData != undefined && toData.name !== "vehiclekey") {
        return InventoryError(_0x5b9852, _0x286332);
      }
    }
  }
  if (_0x2a6d95 !== 'yer') {
    if (!getChangeSlots(_0x286332) && !getChangeSlots(_0x475f81)) {
      if (fromInvLabel == "player" && toInvLabel == 'player' || toData != undefined && fromData.name != toData.name) {
        if (fromData.name != undefined) {
          InventoryError(_0x5b9852, _0x286332);
          return;
        }
      }
    }
  }
  $.each(whitelistTimeout, function (_0x2a650e, _0x511217) {
    if (playerHex == _0x511217) {
      whitelistTimer = true;
    }
  });
  if (!whitelistTimer && !ByPassItem(fromData.name)) {
    if (yerDegistirme == 0x0) {
      yerDegistirme = 0x1;
      setTimeout(function () {
        yerDegistirme = 0x0;
      }, 0x9c4);
    } else {
      $.post('https://qb-inventory/Notify', JSON.stringify({
        'message': "Envanterde bu kadar hızlı yer degistiremezsin!",
        'type': 'error'
      }));
      InventoryError(_0x5b9852, _0x286332);
      return;
    }
  }
  if (toData != undefined) {
    if (fromData.name == "markedbills" && toData.name == "markedbills") {} else {
      if (toData != undefined) {
        if (fromData.name == 'markedbills' || toData.name == "markedbills") {
          if (fromData.name == 'markedbills' || toData.name == "markedbills" || kek.name == "markedbills" || pasa.name == 'markedbills') {
            InventoryError(_0x5b9852, _0x286332);
            return;
          }
        }
      }
    }
  }
  if (toData != undefined) {
    if (fromData.name == "cash" && toData.name == 'cash') {} else {
      if (toData != undefined) {
        if (fromData.name == "cash" || toData.name == "cash") {
          if (fromData.name == "cash" || toData.name == "cash" || kek.name == "cash" || pasa.name == 'cash') {
            InventoryError(_0x5b9852, _0x286332);
            return;
          }
        }
      }
    }
  }
  if (fromSlot <= 0x63 && getMetaSlot(_0x475f81) || _0x475f81 <= 0x63 && getMetaSlot(_0x286332)) {
    for (i = 0x64; i <= 0x6f; i++) {
      MetaEnv = _0x200ab8.find('[data-slot=' + i + ']').data("item");
      if (MetaEnv != undefined) {
        if (MetaEnv.name == fromData.name) {
          InventoryError(_0x5b9852, _0x286332);
          return;
        }
      }
    }
  }
  if (_0x4b085e[0x0] == "oyuncu") {
    if (_0x286332 <= 0x63 && getMetaSlot(_0x475f81)) {
      if (metaClothes(fromData, toData)) {
        $.post('https://qb-inventory/bz:MetaKiyafet:Giy', JSON.stringify({
          'itemNo': _0x286332,
          'hangisi': "otherplayer"
        }));
      } else {
        InventoryError(_0x5b9852, _0x286332);
        return;
      }
    }
  } else {
    if (_0x286332 <= 0x63 && getMetaSlot(_0x475f81)) {
      if (metaClothes(fromData, toData)) {
        $.post("https://qb-inventory/bz:MetaKiyafet:Giy", JSON.stringify({
          'itemNo': _0x286332,
          'hangisi': 'player'
        }));
      } else {
        InventoryError(_0x5b9852, _0x286332);
        return;
      }
    }
  }
  if (_0x4b085e[0x0] == "oyuncu") {
    if (_0x475f81 <= 0x63 && getMetaSlot(_0x286332)) {
      if (metaClothes(fromData, toData)) {
        $.post('https://qb-inventory/bz:MetaKiyafet:Cikart', JSON.stringify({
          'itemNo': _0x286332,
          'hangisi': "otherplayer"
        }));
      } else {
        InventoryError(_0x5b9852, _0x286332);
        return;
      }
    }
  } else {
    if (_0x475f81 <= 0x63 && getMetaSlot(_0x286332)) {
      if (metaClothes(fromData, toData)) {
        $.post("https://qb-inventory/bz:MetaKiyafet:Cikart", JSON.stringify({
          'itemNo': _0x286332,
          'hangisi': "player"
        }));
      } else {
        InventoryError(_0x5b9852, _0x286332);
        return;
      }
    }
  }
  if (fromInvLabel.split('-')[0x0] == "player" || fromInvLabel.split('-')[0x0] == "stash") {} else {
    if (_0x4b085e[0x0] == "yer") {
      if (toData !== null && toData !== undefined) {
        InventoryError(_0x5b9852, _0x286332);
        return;
      }
    }
  }
  if (_0x200ab8.attr("data-inventory").split('-')[0x0] == 'stash') {
    if (_0x4b085e[0x1] == "burgershotkasa1" || _0x4b085e[0x1] == "burgershotkasa2") {
      if (Meslek != "burgershot") {
        InventoryError(_0x5b9852, _0x286332);
        return;
      }
      if (fromData.name != "bs_menu") {
        InventoryError(_0x5b9852, _0x286332);
        return;
      }
    }
  }
  if (_0x5b9852.attr('data-inventory').split('-')[0x0] == "stash") {
    if (_0x4b085e[0x1] == "burgershotkasa1" || _0x4b085e[0x1] == "burgershotkasa2") {
      if (miktar == 0x0) {
        InventoryError(_0x5b9852, _0x286332);
        return;
      } else {
        if (cashMoney >= fromData.info.price || bankMoney >= fromData.info.price) {
          $.post("https://qb-inventory/BurgerShot", JSON.stringify({
            'name': fromData.name,
            'amount': miktar,
            'fiyat': fromData.info.price
          }));
        } else {
          InventoryError(_0x5b9852, _0x286332);
          return;
        }
      }
    }
  }
  if (fromData !== undefined && fromData.amount >= _0x1b1e04) {
    if ((_0x5b9852.attr('data-inventory') == "player" || _0x5b9852.attr('data-inventory') == "hotbar") && _0x200ab8.attr("data-inventory").split('-')[0x0] == "itemshop" && _0x200ab8.attr('data-inventory') == "crafting") {
      InventoryError(_0x5b9852, _0x286332);
      return;
    }
    if (_0x1b1e04 == 0x0 && _0x5b9852.attr("data-inventory").split('-')[0x0] == "itemshop" && _0x5b9852.attr('data-inventory') == "crafting") {
      InventoryError(_0x5b9852, _0x286332);
      return;
    } else if (_0x1b1e04 == 0x0) {
      _0x1b1e04 = fromData.amount;
    }
    if ((toData != undefined || toData != null) && toData.name == fromData.name && !fromData.unique) {
      var _0x307c25 = [];
      _0x307c25.name = toData.name;
      _0x307c25.label = toData.label;
      _0x307c25.amount = parseInt(_0x1b1e04) + parseInt(toData.amount);
      _0x307c25.type = toData.type;
      _0x307c25.description = toData.description;
      _0x307c25.image = toData.image;
      _0x307c25.weight = toData.weight;
      _0x307c25.info = toData.info;
      _0x307c25.useable = toData.useable;
      _0x307c25.unique = toData.unique;
      _0x307c25.slot = parseInt(_0x475f81);
      if (fromData.amount == _0x1b1e04) {
        _0x200ab8.find('[data-slot=' + _0x475f81 + ']').data("item", _0x307c25);
        _0x200ab8.find("[data-slot=" + _0x475f81 + ']').addClass("item-drag");
        _0x200ab8.find("[data-slot=" + _0x475f81 + ']').removeClass('item-nodrag');
        var _0xdfdc24 = "<div class=\"item-slot-label\"><p>" + _0x307c25.label + "</p></div>";
        if (_0x307c25.name.split('_')[0x0] == "weapon") {
          if (!Inventory.IsWeaponBlocked(_0x307c25.name)) {
            _0xdfdc24 = "<div class=\"item-slot-quality\"><div class=\"item-slot-quality-bar\"><p>100</p></div></div><div class=\"item-slot-label\"><p>" + _0x307c25.label + "</p></div>";
          }
        }
        if (_0x475f81 < 0x6 && _0x200ab8.attr("data-inventory") == 'player') {
          _0x200ab8.find("[data-slot=" + _0x475f81 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x307c25.image + "\" alt=\"" + _0x307c25.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x307c25.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x307c25.weight * _0x307c25.amount / 0x3e8).toFixed(0x1) + " </p></div>" + _0xdfdc24);
        } else if (_0x475f81 == 0x5b && _0x200ab8.attr("data-inventory") == 'player') {
          _0x200ab8.find("[data-slot=" + _0x475f81 + ']').html("<div class=\"item-slot-key\"><p>6 <i class=\"fas fa-lock\"></i></p></div><div class=\"item-slot-img\"><img src=\"images/" + _0x307c25.image + "\" alt=\"" + _0x307c25.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x307c25.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x307c25.weight * _0x307c25.amount / 0x3e8).toFixed(0x1) + " </p></div>" + _0xdfdc24);
        } else {
          _0x200ab8.find("[data-slot=" + _0x475f81 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x307c25.image + "\" alt=\"" + _0x307c25.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x307c25.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x307c25.weight * _0x307c25.amount / 0x3e8).toFixed(0x1) + " </p></div>" + _0xdfdc24);
        }
        if (_0x307c25.name.split('_')[0x0] == "weapon") {
          if (!Inventory.IsWeaponBlocked(_0x307c25.name)) {
            if (_0x307c25.info.quality == undefined) {
              _0x307c25.info.quality = 0x64;
            }
            var _0x1b04b6 = "rgb(39, 174, 96)";
            if (_0x307c25.info.quality < 0x19) {
              _0x1b04b6 = "rgb(192, 57, 43)";
            } else {
              if (_0x307c25.info.quality > 0x19 && _0x307c25.info.quality < 0x32) {
                _0x1b04b6 = "rgb(230, 126, 34)";
              } else if (_0x307c25.info.quality >= 0x32) {
                _0x1b04b6 = "rgb(39, 174, 96)";
              }
            }
            if (_0x307c25.info.quality !== undefined) {
              qualityLabel = _0x307c25.info.quality.toFixed();
            } else {
              qualityLabel = _0x307c25.info.quality;
            }
            if (_0x307c25.info.quality == 0x0) {
              qualityLabel = "BROKEN";
            }
            _0x200ab8.find("[data-slot=" + _0x475f81 + ']').find(".item-slot-quality-bar").css({
              'width': qualityLabel + '%',
              'background-color': _0x1b04b6
            }).find('p').html(qualityLabel);
          }
        }
        _0x5b9852.find('[data-slot=' + _0x286332 + ']').removeClass("item-drag");
        _0x5b9852.find("[data-slot=" + _0x286332 + ']').addClass("item-nodrag");
        _0x5b9852.find("[data-slot=" + _0x286332 + ']').removeData("item");
        _0x5b9852.find("[data-slot=" + _0x286332 + ']').html("<div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div>");
      } else {
        if (fromData.amount > _0x1b1e04) {
          var _0x3fccb5 = [];
          _0x3fccb5.name = fromData.name;
          _0x3fccb5.label = fromData.label;
          _0x3fccb5.amount = parseInt(fromData.amount - _0x1b1e04);
          _0x3fccb5.type = fromData.type;
          _0x3fccb5.description = fromData.description;
          _0x3fccb5.image = fromData.image;
          _0x3fccb5.weight = fromData.weight;
          _0x3fccb5.price = fromData.price;
          _0x3fccb5.info = fromData.info;
          _0x3fccb5.useable = fromData.useable;
          _0x3fccb5.unique = fromData.unique;
          _0x3fccb5.slot = parseInt(_0x286332);
          _0x200ab8.find("[data-slot=" + _0x475f81 + ']').data("item", _0x307c25);
          _0x200ab8.find("[data-slot=" + _0x475f81 + ']').addClass("item-drag");
          _0x200ab8.find("[data-slot=" + _0x475f81 + ']').removeClass("item-nodrag");
          var _0xdfdc24 = "<div class=\"item-slot-label\"><p>" + _0x307c25.label + "</p></div>";
          if (_0x307c25.name.split('_')[0x0] == "weapon") {
            if (!Inventory.IsWeaponBlocked(_0x307c25.name)) {
              _0xdfdc24 = "<div class=\"item-slot-quality\"><div class=\"item-slot-quality-bar\"><p>100</p></div></div><div class=\"item-slot-label\"><p>" + _0x307c25.label + '</p></div>';
            }
          }
          if (_0x475f81 < 0x6 && _0x200ab8.attr("data-inventory") == 'player') {
            _0x200ab8.find('[data-slot=' + _0x475f81 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x307c25.image + "\" alt=\"" + _0x307c25.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x307c25.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x307c25.weight * _0x307c25.amount / 0x3e8).toFixed(0x1) + " </p></div>" + _0xdfdc24);
          } else if (_0x475f81 == 0x5b && _0x200ab8.attr("data-inventory") == "player") {
            _0x200ab8.find('[data-slot=' + _0x475f81 + ']').html("<div class=\"item-slot-key\"><p>6 <i class=\"fas fa-lock\"></i></p></div><div class=\"item-slot-img\"><img src=\"images/" + _0x307c25.image + "\" alt=\"" + _0x307c25.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x307c25.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x307c25.weight * _0x307c25.amount / 0x3e8).toFixed(0x1) + " </p></div>" + _0xdfdc24);
          } else {
            _0x200ab8.find('[data-slot=' + _0x475f81 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x307c25.image + "\" alt=\"" + _0x307c25.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x307c25.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x307c25.weight * _0x307c25.amount / 0x3e8).toFixed(0x1) + " </p></div>" + _0xdfdc24);
          }
          if (_0x307c25.name.split('_')[0x0] == "weapon") {
            if (!Inventory.IsWeaponBlocked(_0x307c25.name)) {
              if (_0x307c25.info.quality == undefined) {
                _0x307c25.info.quality = 0x64;
              }
              var _0x1b04b6 = "rgb(39, 174, 96)";
              if (_0x307c25.info.quality < 0x19) {
                _0x1b04b6 = "rgb(192, 57, 43)";
              } else {
                if (_0x307c25.info.quality > 0x19 && _0x307c25.info.quality < 0x32) {
                  _0x1b04b6 = "rgb(230, 126, 34)";
                } else if (_0x307c25.info.quality >= 0x32) {
                  _0x1b04b6 = "rgb(39, 174, 96)";
                }
              }
              if (_0x307c25.info.quality !== undefined) {
                qualityLabel = _0x307c25.info.quality.toFixed();
              } else {
                qualityLabel = _0x307c25.info.quality;
              }
              if (_0x307c25.info.quality == 0x0) {
                qualityLabel = "BROKEN";
              }
              _0x200ab8.find("[data-slot=" + _0x475f81 + ']').find('.item-slot-quality-bar').css({
                'width': qualityLabel + '%',
                'background-color': _0x1b04b6
              }).find('p').html(qualityLabel);
            }
          }
          _0x5b9852.find("[data-slot=" + _0x286332 + ']').data("item", _0x3fccb5);
          _0x5b9852.find('[data-slot=' + _0x286332 + ']').addClass("item-drag");
          _0x5b9852.find("[data-slot=" + _0x286332 + ']').removeClass("item-nodrag");
          if (_0x5b9852.attr("data-inventory").split('-')[0x0] == "itemshop") {
            _0x5b9852.find('[data-slot=' + _0x286332 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x3fccb5.image + "\" alt=\"" + _0x3fccb5.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x3fccb5.amount + "</div><div class=\"item-slot-name\"><p>" + " $" + _0x3fccb5.price + "</p></div><div class=\"item-slot-label\"><p>" + _0x3fccb5.label + "</p></div>");
          } else {
            var _0xdfdc24 = "<div class=\"item-slot-label\"><p>" + _0x3fccb5.label + "</p></div>";
            if (_0x3fccb5.name.split('_')[0x0] == "weapon") {
              if (!Inventory.IsWeaponBlocked(_0x3fccb5.name)) {
                _0xdfdc24 = "<div class=\"item-slot-quality\"><div class=\"item-slot-quality-bar\"><p>100</p></div></div><div class=\"item-slot-label\"><p>" + _0x3fccb5.label + "</p></div>";
              }
            }
            if (_0x286332 < 0x6 && _0x5b9852.attr("data-inventory") == "player") {
              _0x5b9852.find('[data-slot=' + _0x286332 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x3fccb5.image + "\" alt=\"" + _0x3fccb5.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x3fccb5.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x3fccb5.weight * _0x3fccb5.amount / 0x3e8).toFixed(0x1) + " </p></div>" + _0xdfdc24);
            } else if (_0x286332 == 0x5b && _0x5b9852.attr('data-inventory') == "player") {
              _0x5b9852.find('[data-slot=' + _0x286332 + ']').html("<div class=\"item-slot-key\"><p>6 <i class=\"fas fa-lock\"></i></p></div><div class=\"item-slot-img\"><img src=\"images/" + _0x3fccb5.image + "\" alt=\"" + _0x3fccb5.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x3fccb5.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x3fccb5.weight * _0x3fccb5.amount / 0x3e8).toFixed(0x1) + '</p></div>' + _0xdfdc24);
            } else {
              _0x5b9852.find("[data-slot=" + _0x286332 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x3fccb5.image + "\" alt=\"" + _0x3fccb5.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x3fccb5.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x3fccb5.weight * _0x3fccb5.amount / 0x3e8).toFixed(0x1) + '</p></div>' + _0xdfdc24);
            }
            if (_0x3fccb5.name.split('_')[0x0] == "weapon") {
              if (!Inventory.IsWeaponBlocked(_0x3fccb5.name)) {
                if (_0x3fccb5.info.quality == undefined) {
                  _0x3fccb5.info.quality = 0x64;
                }
                var _0x1b04b6 = "rgb(39, 174, 96)";
                if (_0x3fccb5.info.quality < 0x19) {
                  _0x1b04b6 = "rgb(192, 57, 43)";
                } else {
                  if (_0x3fccb5.info.quality > 0x19 && _0x3fccb5.info.quality < 0x32) {
                    _0x1b04b6 = "rgb(230, 126, 34)";
                  } else if (_0x3fccb5.info.quality >= 0x32) {
                    _0x1b04b6 = "rgb(39, 174, 96)";
                  }
                }
                if (_0x3fccb5.info.quality !== undefined) {
                  qualityLabel = _0x3fccb5.info.quality.toFixed();
                } else {
                  qualityLabel = _0x3fccb5.info.quality;
                }
                if (_0x3fccb5.info.quality == 0x0) {
                  qualityLabel = 'BROKEN';
                }
                _0x5b9852.find("[data-slot=" + _0x286332 + ']').find(".item-slot-quality-bar").css({
                  'width': qualityLabel + '%',
                  'background-color': _0x1b04b6
                }).find('p').html(qualityLabel);
              }
            }
          }
        }
      }
      $.post("https://qb-inventory/PlayDropSound", JSON.stringify({}));
      $.post("https://qb-inventory/SetInventoryData", JSON.stringify({
        'fromInventory': _0x5b9852.attr("data-inventory"),
        'toInventory': _0x200ab8.attr("data-inventory"),
        'fromSlot': _0x286332,
        'toSlot': _0x475f81,
        'fromAmount': _0x1b1e04
      }));
    } else {
      if (fromData.amount == _0x1b1e04) {
        if (toData != undefined && toData.combinable != null && isItemAllowed(fromData.name, toData.combinable.accept)) {
          $.post("https://qb-inventory/getCombineItem", JSON.stringify({
            'item': toData.combinable.reward
          }), function (_0x35a2e2) {
            $('.combine-option-text').html("<p>If you combine these items you get: <b>" + _0x35a2e2.label + '</b></p>');
          });
          $(".combine-option-container").fadeIn(0x64);
          combineslotData = [];
          combineslotData.fromData = fromData;
          combineslotData.toData = toData;
          combineslotData.fromSlot = _0x286332;
          combineslotData.toSlot = _0x475f81;
          combineslotData.fromInv = _0x5b9852;
          combineslotData.toInv = _0x200ab8;
          combineslotData.toAmount = _0x1b1e04;
          return;
        }
        fromData.slot = parseInt(_0x475f81);
        _0x200ab8.find('[data-slot=' + _0x475f81 + ']').data("item", fromData);
        _0x200ab8.find("[data-slot=" + _0x475f81 + ']').addClass('item-drag');
        _0x200ab8.find("[data-slot=" + _0x475f81 + ']').removeClass("item-nodrag");
        var _0xdfdc24 = "<div class=\"item-slot-label\"><p>" + fromData.label + "</p></div>";
        if (fromData.name.split('_')[0x0] == "weapon") {
          if (!Inventory.IsWeaponBlocked(fromData.name)) {
            _0xdfdc24 = "<div class=\"item-slot-quality\"><div class=\"item-slot-quality-bar\"><p>100</p></div></div><div class=\"item-slot-label\"><p>" + fromData.label + "</p></div>";
          }
        }
        if (_0x475f81 < 0x6 && _0x200ab8.attr('data-inventory') == "player") {
          _0x200ab8.find('[data-slot=' + _0x475f81 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + fromData.image + "\" alt=\"" + fromData.name + "\" /></div><div class=\"item-slot-amount\"><p>" + fromData.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (fromData.weight * fromData.amount / 0x3e8).toFixed(0x1) + " </p></div>" + _0xdfdc24);
        } else if (_0x475f81 == 0x5b && _0x200ab8.attr("data-inventory") == "player") {
          _0x200ab8.find('[data-slot=' + _0x475f81 + ']').html("<div class=\"item-slot-key\"><p>6 <i class=\"fas fa-lock\"></i></p></div><div class=\"item-slot-img\"><img src=\"images/" + fromData.image + "\" alt=\"" + fromData.name + "\" /></div><div class=\"item-slot-amount\"><p>" + fromData.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (fromData.weight * fromData.amount / 0x3e8).toFixed(0x1) + " </p></div>" + _0xdfdc24);
        } else {
          _0x200ab8.find('[data-slot=' + _0x475f81 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + fromData.image + "\" alt=\"" + fromData.name + "\" /></div><div class=\"item-slot-amount\"><p>" + fromData.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (fromData.weight * fromData.amount / 0x3e8).toFixed(0x1) + " </p></div>" + _0xdfdc24);
        }
        if (fromData.name.split('_')[0x0] == 'weapon') {
          if (!Inventory.IsWeaponBlocked(fromData.name)) {
            if (fromData.info.quality == undefined) {
              fromData.info.quality = 0x64;
            }
            var _0x1b04b6 = "rgb(39, 174, 96)";
            if (fromData.info.quality < 0x19) {
              _0x1b04b6 = "rgb(192, 57, 43)";
            } else {
              if (fromData.info.quality > 0x19 && fromData.info.quality < 0x32) {
                _0x1b04b6 = "rgb(230, 126, 34)";
              } else if (fromData.info.quality >= 0x32) {
                _0x1b04b6 = "rgb(39, 174, 96)";
              }
            }
            if (fromData.info.quality !== undefined) {
              qualityLabel = fromData.info.quality.toFixed();
            } else {
              qualityLabel = fromData.info.quality;
            }
            if (fromData.info.quality == 0x0) {
              qualityLabel = "KIRIK";
            }
            _0x200ab8.find("[data-slot=" + _0x475f81 + ']').find('.item-slot-quality-bar').css({
              'width': qualityLabel + '%',
              'background-color': _0x1b04b6
            }).find('p').html(qualityLabel);
          }
        }
        if (toData != undefined) {
          toData.slot = parseInt(_0x286332);
          _0x5b9852.find("[data-slot=" + _0x286332 + ']').addClass("item-drag");
          _0x5b9852.find("[data-slot=" + _0x286332 + ']').removeClass("item-nodrag");
          _0x5b9852.find("[data-slot=" + _0x286332 + ']').data("item", toData);
          if (_0x5b9852.attr("data-inventory").split('-')[0x0] == 'stash') {
            if (_0x4b085e[0x1] == "burgershotkasa1" || _0x4b085e[0x1] == "burgershotkasa2") {
              if (Meslek != "burgershot") {
                InventoryError(_0x5b9852, _0x286332);
                return;
              }
            }
          }
          var _0xdfdc24 = "<div class=\"item-slot-label\"><p>" + toData.label + "</p></div>";
          if (toData.name.split('_')[0x0] == "weapon") {
            if (!Inventory.IsWeaponBlocked(toData.name)) {
              _0xdfdc24 = "<div class=\"item-slot-quality\"><div class=\"item-slot-quality-bar\"><p>100</p></div></div><div class=\"item-slot-label\"><p>" + toData.label + "</p></div>";
            }
          }
          if (_0x286332 < 0x6 && _0x5b9852.attr("data-inventory") == 'player') {
            _0x5b9852.find("[data-slot=" + _0x286332 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + toData.image + "\" alt=\"" + toData.name + "\" /></div><div class=\"item-slot-amount\"><p>" + toData.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (toData.weight * toData.amount / 0x3e8).toFixed(0x1) + " </p></div>" + _0xdfdc24);
          } else if (_0x286332 == 0x5b && _0x5b9852.attr("data-inventory") == "player") {
            _0x5b9852.find("[data-slot=" + _0x286332 + ']').html("<div class=\"item-slot-key\"><p>6 <i class=\"fas fa-lock\"></i></p></div><div class=\"item-slot-img\"><img src=\"images/" + toData.image + "\" alt=\"" + toData.name + "\" /></div><div class=\"item-slot-amount\"><p>" + toData.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (toData.weight * toData.amount / 0x3e8).toFixed(0x1) + " </p></div>" + _0xdfdc24);
          } else {
            _0x5b9852.find('[data-slot=' + _0x286332 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + toData.image + "\" alt=\"" + toData.name + "\" /></div><div class=\"item-slot-amount\"><p>" + toData.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (toData.weight * toData.amount / 0x3e8).toFixed(0x1) + " </p></div>" + _0xdfdc24);
          }
          if (toData.name.split('_')[0x0] == "weapon") {
            if (!Inventory.IsWeaponBlocked(toData.name)) {
              if (toData.info.quality == undefined) {
                toData.info.quality = 0x64;
              }
              var _0x1b04b6 = "rgb(39, 174, 96)";
              if (toData.info.quality < 0x19) {
                _0x1b04b6 = "rgb(192, 57, 43)";
              } else {
                if (toData.info.quality > 0x19 && toData.info.quality < 0x32) {
                  _0x1b04b6 = "rgb(230, 126, 34)";
                } else if (toData.info.quality >= 0x32) {
                  _0x1b04b6 = "rgb(39, 174, 96)";
                }
              }
              if (toData.info.quality !== undefined) {
                qualityLabel = toData.info.quality.toFixed();
              } else {
                qualityLabel = toData.info.quality;
              }
              if (toData.info.quality == 0x0) {
                qualityLabel = "BROKEN";
              }
              _0x5b9852.find("[data-slot=" + _0x286332 + ']').find(".item-slot-quality-bar").css({
                'width': qualityLabel + '%',
                'background-color': _0x1b04b6
              }).find('p').html(qualityLabel);
            }
          }
          $.post('https://qb-inventory/SetInventoryData', JSON.stringify({
            'fromInventory': _0x5b9852.attr('data-inventory'),
            'toInventory': _0x200ab8.attr('data-inventory'),
            'fromSlot': _0x286332,
            'toSlot': _0x475f81,
            'fromAmount': _0x1b1e04,
            'toAmount': toData.amount
          }));
        } else {
          _0x5b9852.find("[data-slot=" + _0x286332 + ']').removeClass("item-drag");
          _0x5b9852.find('[data-slot=' + _0x286332 + ']').addClass("item-nodrag");
          _0x5b9852.find("[data-slot=" + _0x286332 + ']').removeData("item");
          if (_0x286332 < 0x6 && _0x5b9852.attr("data-inventory") == "player") {
            _0x5b9852.find('[data-slot=' + _0x286332 + ']').html("<div class=\"item-slot-key\"><p>" + _0x286332 + "</p></div><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div>");
          } else if (_0x286332 == 0x5b && _0x5b9852.attr("data-inventory") == "player") {
            _0x5b9852.find("[data-slot=" + _0x286332 + ']').html("<div class=\"item-slot-key\"><p>6 <i class=\"fas fa-lock\"></i></p></div><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div>");
          } else {
            _0x5b9852.find("[data-slot=" + _0x286332 + ']').html("<div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div>");
          }
          $.post("https://qb-inventory/SetInventoryData", JSON.stringify({
            'fromInventory': _0x5b9852.attr('data-inventory'),
            'toInventory': _0x200ab8.attr("data-inventory"),
            'fromSlot': _0x286332,
            'toSlot': _0x475f81,
            'fromAmount': _0x1b1e04
          }));
        }
        $.post("https://qb-inventory/PlayDropSound", JSON.stringify({}));
      } else {
        if (fromData.amount > _0x1b1e04 && (toData == undefined || toData == null)) {
          var _0x36f51f = [];
          _0x36f51f.name = fromData.name;
          _0x36f51f.label = fromData.label;
          _0x36f51f.amount = parseInt(_0x1b1e04);
          _0x36f51f.type = fromData.type;
          _0x36f51f.description = fromData.description;
          _0x36f51f.image = fromData.image;
          _0x36f51f.weight = fromData.weight;
          _0x36f51f.info = fromData.info;
          _0x36f51f.useable = fromData.useable;
          _0x36f51f.unique = fromData.unique;
          _0x36f51f.slot = parseInt(_0x475f81);
          _0x200ab8.find('[data-slot=' + _0x475f81 + ']').data("item", _0x36f51f);
          _0x200ab8.find("[data-slot=" + _0x475f81 + ']').addClass("item-drag");
          _0x200ab8.find('[data-slot=' + _0x475f81 + ']').removeClass("item-nodrag");
          var _0xdfdc24 = "<div class=\"item-slot-label\"><p>" + _0x36f51f.label + "</p></div>";
          if (_0x36f51f.name.split('_')[0x0] == "weapon") {
            if (!Inventory.IsWeaponBlocked(_0x36f51f.name)) {
              _0xdfdc24 = "<div class=\"item-slot-quality\"><div class=\"item-slot-quality-bar\"><p>100</p></div></div><div class=\"item-slot-label\"><p>" + _0x36f51f.label + "</p></div>";
            }
          }
          if (_0x475f81 < 0x6 && _0x200ab8.attr('data-inventory') == "player") {
            _0x200ab8.find("[data-slot=" + _0x475f81 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x36f51f.image + "\" alt=\"" + _0x36f51f.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x36f51f.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x36f51f.weight * _0x36f51f.amount / 0x3e8).toFixed(0x1) + "</p></div>" + _0xdfdc24);
          } else if (_0x475f81 == 0x5b && _0x200ab8.attr('data-inventory') == "player") {
            _0x200ab8.find('[data-slot=' + _0x475f81 + ']').html("<div class=\"item-slot-key\"><p>6 <i class=\"fas fa-lock\"></i></p></div><div class=\"item-slot-img\"><img src=\"images/" + _0x36f51f.image + "\" alt=\"" + _0x36f51f.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x36f51f.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x36f51f.weight * _0x36f51f.amount / 0x3e8).toFixed(0x1) + '</p></div>' + _0xdfdc24);
          } else {
            _0x200ab8.find("[data-slot=" + _0x475f81 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x36f51f.image + "\" alt=\"" + _0x36f51f.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x36f51f.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x36f51f.weight * _0x36f51f.amount / 0x3e8).toFixed(0x1) + "</p></div>" + _0xdfdc24);
          }
          if (_0x36f51f.name.split('_')[0x0] == "weapon") {
            if (!Inventory.IsWeaponBlocked(_0x36f51f.name)) {
              if (_0x36f51f.info.quality == undefined) {
                _0x36f51f.info.quality = 0x64;
              }
              var _0x1b04b6 = "rgb(39, 174, 96)";
              if (_0x36f51f.info.quality < 0x19) {
                _0x1b04b6 = "rgb(192, 57, 43)";
              } else {
                if (_0x36f51f.info.quality > 0x19 && _0x36f51f.info.quality < 0x32) {
                  _0x1b04b6 = "rgb(230, 126, 34)";
                } else if (_0x36f51f.info.quality >= 0x32) {
                  _0x1b04b6 = "rgb(39, 174, 96)";
                }
              }
              if (_0x36f51f.info.quality !== undefined) {
                qualityLabel = _0x36f51f.info.quality.toFixed();
              } else {
                qualityLabel = _0x36f51f.info.quality;
              }
              if (_0x36f51f.info.quality == 0x0) {
                qualityLabel = "KIRIK";
              }
              _0x200ab8.find('[data-slot=' + _0x475f81 + ']').find('.item-slot-quality-bar').css({
                'width': qualityLabel + '%',
                'background-color': _0x1b04b6
              }).find('p').html(qualityLabel);
            }
          }
          var _0x3fccb5 = [];
          _0x3fccb5.name = fromData.name;
          _0x3fccb5.label = fromData.label;
          _0x3fccb5.amount = parseInt(fromData.amount - _0x1b1e04);
          _0x3fccb5.type = fromData.type;
          _0x3fccb5.description = fromData.description;
          _0x3fccb5.image = fromData.image;
          _0x3fccb5.weight = fromData.weight;
          _0x3fccb5.price = fromData.price;
          _0x3fccb5.info = fromData.info;
          _0x3fccb5.useable = fromData.useable;
          _0x3fccb5.unique = fromData.unique;
          _0x3fccb5.slot = parseInt(_0x286332);
          _0x5b9852.find("[data-slot=" + _0x286332 + ']').data("item", _0x3fccb5);
          _0x5b9852.find("[data-slot=" + _0x286332 + ']').addClass('item-drag');
          _0x5b9852.find("[data-slot=" + _0x286332 + ']').removeClass("item-nodrag");
          if (_0x5b9852.attr('data-inventory').split('-')[0x0] == "itemshop") {
            _0x5b9852.find('[data-slot=' + _0x286332 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x3fccb5.image + "\" alt=\"" + _0x3fccb5.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x3fccb5.amount + "</div><div class=\"item-slot-name\"><p>" + " $" + _0x3fccb5.price + "</p></div><div class=\"item-slot-label\"><p>" + _0x3fccb5.label + "</p></div>");
          } else {
            var _0xdfdc24 = "<div class=\"item-slot-label\"><p>" + _0x3fccb5.label + "</p></div>";
            if (_0x3fccb5.name.split('_')[0x0] == "weapon") {
              if (!Inventory.IsWeaponBlocked(_0x3fccb5.name)) {
                _0xdfdc24 = "<div class=\"item-slot-quality\"><div class=\"item-slot-quality-bar\"><p>100</p></div></div><div class=\"item-slot-label\"><p>" + _0x3fccb5.label + "</p></div>";
              }
            }
            if (_0x286332 < 0x6 && _0x5b9852.attr('data-inventory') == 'player') {
              _0x5b9852.find("[data-slot=" + _0x286332 + ']').html("<div class=\"item-slot-key\"><p>" + _0x286332 + "</p></div><div class=\"item-slot-img\"><img src=\"images/" + _0x3fccb5.image + "\" alt=\"" + _0x3fccb5.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x3fccb5.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x3fccb5.weight * _0x3fccb5.amount / 0x3e8).toFixed(0x1) + "</p></div>" + _0xdfdc24);
            } else if (_0x286332 == 0x5b && _0x5b9852.attr("data-inventory") == "player") {
              _0x5b9852.find('[data-slot=' + _0x286332 + ']').html("<div class=\"item-slot-key\"><p>6 <i class=\"fas fa-lock\"></i></p></div><div class=\"item-slot-img\"><img src=\"images/" + _0x3fccb5.image + "\" alt=\"" + _0x3fccb5.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x3fccb5.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x3fccb5.weight * _0x3fccb5.amount / 0x3e8).toFixed(0x1) + '</p></div>' + _0xdfdc24);
            } else {
              _0x5b9852.find("[data-slot=" + _0x286332 + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x3fccb5.image + "\" alt=\"" + _0x3fccb5.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x3fccb5.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x3fccb5.weight * _0x3fccb5.amount / 0x3e8).toFixed(0x1) + "</p></div>" + _0xdfdc24);
            }
            if (_0x3fccb5.name.split('_')[0x0] == 'weapon') {
              if (!Inventory.IsWeaponBlocked(_0x3fccb5.name)) {
                if (_0x3fccb5.info.quality == undefined) {
                  _0x3fccb5.info.quality = 0x64;
                }
                var _0x1b04b6 = "rgb(39, 174, 96)";
                if (_0x3fccb5.info.quality < 0x19) {
                  _0x1b04b6 = "rgb(192, 57, 43)";
                } else {
                  if (_0x3fccb5.info.quality > 0x19 && _0x3fccb5.info.quality < 0x32) {
                    _0x1b04b6 = "rgb(230, 126, 34)";
                  } else if (_0x3fccb5.info.quality >= 0x32) {
                    _0x1b04b6 = "rgb(39, 174, 96)";
                  }
                }
                if (_0x3fccb5.info.quality !== undefined) {
                  qualityLabel = _0x3fccb5.info.quality.toFixed();
                } else {
                  qualityLabel = _0x3fccb5.info.quality;
                }
                if (_0x3fccb5.info.quality == 0x0) {
                  qualityLabel = "KIRIK";
                }
                _0x5b9852.find("[data-slot=" + _0x286332 + ']').find(".item-slot-quality-bar").css({
                  'width': qualityLabel + '%',
                  'background-color': _0x1b04b6
                }).find('p').html(qualityLabel);
              }
            }
          }
          $.post("https://qb-inventory/PlayDropSound", JSON.stringify({}));
          $.post("https://qb-inventory/SetInventoryData", JSON.stringify({
            'fromInventory': _0x5b9852.attr("data-inventory"),
            'toInventory': _0x200ab8.attr("data-inventory"),
            'fromSlot': _0x286332,
            'toSlot': _0x475f81,
            'fromAmount': _0x1b1e04
          }));
        } else {
          InventoryError(_0x5b9852, _0x286332);
        }
      }
    }
  } else {}
  handleDragDrop();
}
function isItemAllowed(_0x4c389b, _0x4e3fb5) {
  var _0x260e1c = false;
  $.each(_0x4e3fb5, function (_0x127bdb, _0x4328f6) {
    if (_0x4328f6 == _0x4c389b) {
      _0x260e1c = true;
    }
  });
  return _0x260e1c;
}
function InventoryError(_0x4cce14, _0x4ed263) {
  _0x4cce14.find("[data-slot=" + _0x4ed263 + ']').css('background', "rgba(156, 20, 20, 0.3)").css('transition', "background 500ms");
  setTimeout(function () {
    _0x4cce14.find('[data-slot=' + _0x4ed263 + ']').css("background", "rgba(102, 102, 113, 0.3)");
  }, 0x1f4);
  $.post("https://qb-inventory/PlayDropFail", JSON.stringify({}));
}
var requiredItemOpen = false;
(() => {
  Inventory = {};
  Inventory.slots = 0x28;
  Inventory.dropslots = 0x1e;
  Inventory.droplabel = "Yer";
  Inventory.dropmaxweight = 0x186a0;
  Inventory.Error = function () {
    $.post('https://qb-inventory/PlayDropFail', JSON.stringify({}));
  };
  Inventory.IsWeaponBlocked = function (_0x2c90fd) {
    var _0x38babe = ["weapon_unarmed"];
    var _0x3da54e = false;
    $.each(_0x38babe, function (_0x57440a, _0x3a8423) {
      if (_0x3a8423 == _0x2c90fd) {
        _0x3da54e = true;
      }
    });
    return _0x3da54e;
  };
  Inventory.QualityCheck = function (_0x8f0e51, _0x16991a, _0x12190a) {
    if (!Inventory.IsWeaponBlocked(_0x8f0e51.name)) {
      if (_0x8f0e51.name.split('_')[0x0] == "weapon") {
        if (_0x8f0e51.info.quality == undefined) {
          _0x8f0e51.info.quality = 0x64;
        }
        var _0x378efb = "rgb(39, 174, 96)";
        if (_0x8f0e51.info.quality < 0x19) {
          _0x378efb = "rgb(192, 57, 43)";
        } else {
          if (_0x8f0e51.info.quality > 0x19 && _0x8f0e51.info.quality < 0x32) {
            _0x378efb = "rgb(230, 126, 34)";
          } else if (_0x8f0e51.info.quality >= 0x32) {
            _0x378efb = "rgb(39, 174, 96)";
          }
        }
        if (_0x8f0e51.info.quality !== undefined) {
          qualityLabel = _0x8f0e51.info.quality.toFixed();
        } else {
          qualityLabel = _0x8f0e51.info.quality;
        }
        if (_0x8f0e51.info.quality == 0x0) {
          qualityLabel = "KIRIK";
          if (!_0x12190a) {
            if (!_0x16991a) {
              $(".player-inventory").find("[data-slot=" + _0x8f0e51.slot + ']').find('.item-slot-quality-bar').css({
                'width': "100%",
                'background-color': _0x378efb
              }).find('p').html(qualityLabel);
            } else {
              $(".z-hotbar-inventory").find('[data-zhotbarslot=' + _0x8f0e51.slot + ']').find(".item-slot-quality-bar").css({
                'width': "100%",
                'background-color': _0x378efb
              }).find('p').html(qualityLabel);
            }
          } else {
            $(".other-inventory").find("[data-slot=" + _0x8f0e51.slot + ']').find(".item-slot-quality-bar").css({
              'width': "100%",
              'background-color': _0x378efb
            }).find('p').html(qualityLabel);
          }
        } else if (!_0x12190a) {
          if (!_0x16991a) {
            $('.player-inventory').find("[data-slot=" + _0x8f0e51.slot + ']').find('.item-slot-quality-bar').css({
              'width': qualityLabel + '%',
              'background-color': _0x378efb
            }).find('p').html(qualityLabel);
          } else {
            $(".z-hotbar-inventory").find("[data-zhotbarslot=" + _0x8f0e51.slot + ']').find('.item-slot-quality-bar').css({
              'width': qualityLabel + '%',
              'background-color': _0x378efb
            }).find('p').html(qualityLabel);
          }
        } else {
          $(".other-inventory").find("[data-slot=" + _0x8f0e51.slot + ']').find(".item-slot-quality-bar").css({
            'width': qualityLabel + '%',
            'background-color': _0x378efb
          }).find('p').html(qualityLabel);
        }
      }
    }
  };
  Inventory.Open = function (_0x54465b) {
    totalWeight = 0x0;
    totalWeightOther = 0x0;
    cashMoney = _0x54465b.cash;
    bankMoney = _0x54465b.bank;
    Meslek = _0x54465b.job;
    playerHex = _0x54465b.playerhex;
    whitelistTimeout = _0x54465b.wltimeout;
    inWarZone = _0x54465b.inWarZone;
    $(".inv-options").css({
      'display': "block"
    });
    $(".player-clothes").css({
      'display': "none"
    });
    $('.player-kupon').css({
      'display': "none"
    });
    $(".player-anahtar").css({
      'display': "none"
    });
    $("#clothes").css("display", 'block');
    $("#other-clothes").css("display", "none");
    $(".player-inventory").find('.item-slot').remove();
    $(".player-clothes").find('.item-slot').remove();
    $(".player-kupon").find(".item-slot").remove();
    $(".player-anahtar").find(".item-slot").remove();
    $('.ply-hotbar-inventory').find(".item-slot").remove();
    if (requiredItemOpen) {
      $(".requiredItem-container").hide();
      requiredItemOpen = false;
    }
    $("#qbus-inventory").fadeIn(0x12c);
    if (_0x54465b.other != null && _0x54465b.other != '') {
      $(".other-inventory").attr('data-inventory', _0x54465b.other.name);
      $('.other-player-clothes').attr("data-inventory", _0x54465b.other.name);
    } else {
      $(".other-inventory").attr('data-inventory', 0x0);
      $('.other-player-clothes').attr("data-inventory", 0x0);
    }
    for (i = 0x1; i < 0x6; i++) {
      $(".player-inventory").append("<div class=\"item-slot\" data-slot=\"" + i + "\"><div class=\"item-slot-key\"><p>" + i + "</p></div><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    }
    for (i = 0x6; i < _0x54465b.slots + 0x1; i++) {
      if (i == 0x5b) {
        $(".player-inventory").append("<div class=\"item-slot\" data-slot=\"" + i + "\"><div class=\"item-slot-key\"><p>6 <i class=\"fas fa-lock\"></i></p></div><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
      } else {
        $(".player-inventory").append("<div class=\"item-slot\" data-slot=\"" + i + "\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
      }
    }
    $(".player-clothes").append("<div class=\"item-slot\" data-slot=\"100\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-clothes").append("<div class=\"item-slot\" data-slot=\"101\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $('.player-clothes').append("<div class=\"item-slot\" data-slot=\"102\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-clothes").append("<div class=\"item-slot\" data-slot=\"103\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-clothes").append("<div class=\"item-slot\" data-slot=\"104\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $('.player-clothes').append("<div class=\"item-slot\" data-slot=\"105\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-clothes").append("<div class=\"item-slot\" data-slot=\"106\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $('.player-clothes').append("<div class=\"item-slot\" data-slot=\"107\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-clothes").append("<div class=\"item-slot\" data-slot=\"108\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-clothes").append("<div class=\"item-slot\" data-slot=\"109\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-clothes").append("<div class=\"item-slot\" data-slot=\"110\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $('.player-clothes').append("<div class=\"item-slot\" data-slot=\"111\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-kupon").append("<div class=\"item-slot\" data-slot=\"112\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-kupon").append("<div class=\"item-slot\" data-slot=\"113\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-kupon").append("<div class=\"item-slot\" data-slot=\"114\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-kupon").append("<div class=\"item-slot\" data-slot=\"115\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-kupon").append("<div class=\"item-slot\" data-slot=\"116\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-kupon").append("<div class=\"item-slot\" data-slot=\"117\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-anahtar").append("<div class=\"item-slot\" data-slot=\"125\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-anahtar").append("<div class=\"item-slot\" data-slot=\"126\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-anahtar").append("<div class=\"item-slot\" data-slot=\"127\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-anahtar").append("<div class=\"item-slot\" data-slot=\"128\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $('.player-anahtar').append("<div class=\"item-slot\" data-slot=\"129\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $('.player-anahtar').append("<div class=\"item-slot\" data-slot=\"130\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-anahtar").append("<div class=\"item-slot\" data-slot=\"131\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $('.player-anahtar').append("<div class=\"item-slot\" data-slot=\"132\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-anahtar").append("<div class=\"item-slot\" data-slot=\"133\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-anahtar").append("<div class=\"item-slot\" data-slot=\"134\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $('.player-anahtar').append("<div class=\"item-slot\" data-slot=\"135\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    $(".player-anahtar").append("<div class=\"item-slot\" data-slot=\"136\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
    if (_0x54465b.other != null && _0x54465b.other != '') {
      for (i = 0x1; i < _0x54465b.other.slots + 0x1; i++) {
        $(".other-inventory").append("<div class=\"item-slot\" data-slot=\"" + i + "\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
      }
      for (i = 0x64; i <= 0x6f; i++) {
        $('.other-player-clothes').append("<div class=\"item-slot\" data-slot=\"" + i + "\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
      }
    } else {
      for (i = 0x1; i < Inventory.dropslots + 0x1; i++) {
        $(".other-inventory").append("<div class=\"item-slot\" data-slot=\"" + i + "\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
      }
      $(".other-inventory .item-slot").css({
        'background-color': "rgba(102 102 113 / 30%)"
      });
    }
    if (_0x54465b.inventory !== null) {
      $.each(_0x54465b.inventory, function (_0x2be2db, _0x101b02) {
        if (_0x101b02 != null) {
          totalWeight += _0x101b02.weight * _0x101b02.amount;
          var _0x9ff1a3 = "<div class=\"item-slot-label\"><p>" + _0x101b02.label + '</p></div>';
          if (_0x101b02.name.split('_')[0x0] == "weapon") {
            if (!Inventory.IsWeaponBlocked(_0x101b02.name)) {
              _0x9ff1a3 = "<div class=\"item-slot-quality\"><div class=\"item-slot-quality-bar\"><p>100</p></div></div><div class=\"item-slot-label\"><p>" + _0x101b02.label + "</p></div>";
            }
          }
          if (_0x101b02.slot < 0x6) {
            $('.player-inventory').find("[data-slot=" + _0x101b02.slot + ']').addClass('item-drag');
            $(".player-inventory").find('[data-slot=' + _0x101b02.slot + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x101b02.image + "\" alt=\"" + _0x101b02.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x101b02.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x101b02.weight * _0x101b02.amount / 0x3e8).toFixed(0x1) + "</p></div>" + _0x9ff1a3);
            $(".player-inventory").find("[data-slot=" + _0x101b02.slot + ']').data('item', _0x101b02);
          } else if (_0x101b02.slot == 0x5b) {
            $('.player-inventory').find("[data-slot=" + _0x101b02.slot + ']').addClass("item-drag");
            $(".player-inventory").find("[data-slot=" + _0x101b02.slot + ']').html("<div class=\"item-slot-key\"><p>6 <i class=\"fas fa-lock\"></i></p></div><div class=\"item-slot-img\"><img src=\"images/" + _0x101b02.image + "\" alt=\"" + _0x101b02.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x101b02.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x101b02.weight * _0x101b02.amount / 0x3e8).toFixed(0x1) + "</p></div>" + _0x9ff1a3);
            $('.player-inventory').find("[data-slot=" + _0x101b02.slot + ']').data("item", _0x101b02);
          } else {
            $('.player-inventory').find("[data-slot=" + _0x101b02.slot + ']').addClass("item-drag");
            $(".player-inventory").find('[data-slot=' + _0x101b02.slot + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x101b02.image + "\" alt=\"" + _0x101b02.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x101b02.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x101b02.weight * _0x101b02.amount / 0x3e8).toFixed(0x1) + "</p></div>" + _0x9ff1a3);
            $(".player-inventory").find("[data-slot=" + _0x101b02.slot + ']').data('item', _0x101b02);
            $(".player-clothes").find("[data-slot=" + _0x101b02.slot + ']').addClass('item-drag');
            $('.player-clothes').find('[data-slot=' + _0x101b02.slot + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x101b02.image + "\" alt=\"" + _0x101b02.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x101b02.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x101b02.weight * _0x101b02.amount / 0x3e8).toFixed(0x1) + "</p></div>" + _0x9ff1a3);
            $(".player-clothes").find('[data-slot=' + _0x101b02.slot + ']').data('item', _0x101b02);
            $(".player-kupon").find("[data-slot=" + _0x101b02.slot + ']').addClass("item-drag");
            $(".player-kupon").find("[data-slot=" + _0x101b02.slot + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x101b02.image + "\" alt=\"" + _0x101b02.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x101b02.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x101b02.weight * _0x101b02.amount / 0x3e8).toFixed(0x1) + "</p></div>" + _0x9ff1a3);
            $(".player-kupon").find("[data-slot=" + _0x101b02.slot + ']').data("item", _0x101b02);
            $(".player-anahtar").find('[data-slot=' + _0x101b02.slot + ']').addClass('item-drag');
            $('.player-anahtar').find("[data-slot=" + _0x101b02.slot + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x101b02.image + "\" alt=\"" + _0x101b02.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x101b02.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x101b02.weight * _0x101b02.amount / 0x3e8).toFixed(0x1) + '</p></div>' + _0x9ff1a3);
            $(".player-anahtar").find("[data-slot=" + _0x101b02.slot + ']').data("item", _0x101b02);
          }
          Inventory.QualityCheck(_0x101b02, false, false);
        }
      });
    }
    if (_0x54465b.other != null && _0x54465b.other != '' && _0x54465b.other.inventory != null) {
      $.each(_0x54465b.other.inventory, function (_0x1858c5, _0x18b143) {
        if (_0x18b143 != null) {
          totalWeightOther += _0x18b143.weight * _0x18b143.amount;
          var _0x34ef09 = "<div class=\"item-slot-label\"><p>" + _0x18b143.label + "</p></div>";
          if (_0x18b143.name.split('_')[0x0] == 'weapon') {
            if (!Inventory.IsWeaponBlocked(_0x18b143.name)) {
              _0x34ef09 = "<div class=\"item-slot-quality\"><div class=\"item-slot-quality-bar\"><p>100</p></div></div><div class=\"item-slot-label\"><p>" + _0x18b143.label + "</p></div>";
            }
          }
          $('.other-inventory').find("[data-slot=" + _0x18b143.slot + ']').addClass("item-drag");
          $('.other-player-clothes').find("[data-slot=" + _0x18b143.slot + ']').addClass("item-drag");
          if (_0x18b143.price != null) {
            $(".other-inventory").find('[data-slot=' + _0x18b143.slot + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x18b143.image + "\" alt=\"" + _0x18b143.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x18b143.amount + "</div><div class=\"item-slot-name\"><p>" + " $" + _0x18b143.price + "</p></div>" + _0x34ef09);
            $(".other-player-clothes").find("[data-slot=" + _0x18b143.slot + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x18b143.image + "\" alt=\"" + _0x18b143.name + "\" /></div><div class=\"item-slot-amount\"><p>(" + _0x18b143.amount + ") $" + _0x18b143.price + "</p></div>" + _0x34ef09);
          } else {
            $(".other-inventory").find('[data-slot=' + _0x18b143.slot + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x18b143.image + "\" alt=\"" + _0x18b143.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x18b143.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x18b143.weight * _0x18b143.amount / 0x3e8).toFixed(0x1) + '</p></div>' + _0x34ef09);
            $(".other-player-clothes").find("[data-slot=" + _0x18b143.slot + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x18b143.image + "\" alt=\"" + _0x18b143.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x18b143.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x18b143.weight * _0x18b143.amount / 0x3e8).toFixed(0x1) + '</p></div>' + _0x34ef09);
          }
          $('.other-inventory').find("[data-slot=" + _0x18b143.slot + ']').data('item', _0x18b143);
          $(".other-player-clothes").find("[data-slot=" + _0x18b143.slot + ']').data("item", _0x18b143);
          Inventory.QualityCheck(_0x18b143, false, true);
        }
      });
    }
    var _0x318798 = totalWeight / 0x3e8 / (_0x54465b.maxweight / 0x186a0);
    $('.pro').css("width", _0x318798 + '%');
    $('#player-inv-weight').html((totalWeight / 0x3e8).toFixed(0x2));
    playerMaxWeight = _0x54465b.maxweight;
    if (_0x54465b.other != null) {
      var _0x593e2d = _0x54465b.other.name.toString();
      if (_0x593e2d != null && (_0x593e2d.split('-')[0x0] == "itemshop" || _0x593e2d == "crafting")) {
        $('#other-inv-label').html(_0x54465b.other.label);
      } else {
        if (_0x593e2d.split('-')[0x0] == "otherplayer") {
          $("#clothes").css('display', "none");
          $("#other-clothes").css("display", "block");
        }
        $("#other-inv-label").html(_0x54465b.other.label);
        $('#other-inv-weight').html((totalWeightOther / 0x3e8).toFixed(0x2));
        var _0xabd5da = totalWeightOther / 0x3e8 / (_0x54465b.other.maxweight / 0x186a0);
        $(".pro1").css("width", _0xabd5da + '%');
      }
      otherMaxWeight = _0x54465b.other.maxweight;
      otherLabel = _0x54465b.other.label;
    } else {
      $("#other-inv-label").html(Inventory.droplabel);
      $("#other-inv-weight").html((totalWeightOther / 0x3e8).toFixed(0x2));
      otherMaxWeight = Inventory.dropmaxweight;
      otherLabel = Inventory.droplabel;
    }
    $.each(_0x54465b.maxammo, function (_0x38248b, _0x509cba) {
      $('#' + _0x38248b + "_ammo").find(".ammo-box-amount").css({
        'height': '0%'
      });
    });
    if (_0x54465b.Ammo !== null) {
      $.each(_0x54465b.Ammo, function (_0x32612b, _0x478ad7) {
        var _0x418568 = _0x32612b.split('_');
        var _0x295e3a = _0x418568[0x1].toLowerCase();
        if (_0x478ad7 > _0x54465b.maxammo[_0x295e3a]) {
          _0x478ad7 = _0x54465b.maxammo[_0x295e3a];
        }
        var _0x575c78 = _0x478ad7 / _0x54465b.maxammo[_0x295e3a] * 0x64;
        $('#' + _0x295e3a + "_ammo").find('.ammo-box-amount').css({
          'height': _0x575c78 + '%'
        });
        $('#' + _0x295e3a + "_ammo").find("span").html(_0x478ad7 + 'x');
      });
    }
    $.post('https://qb-inventory/updateData');
    handleDragDrop();
  };
  Inventory.Close = function () {
    $(".item-slot").css("border", "1px solid rgba(255, 255, 255, 0.1)");
    $(".ply-hotbar-inventory").css("display", "block");
    $(".ply-iteminfo-container").css("opacity", '0.0');
    $("#qbus-inventory").fadeOut(0x12c);
    $(".combine-option-container").hide();
    $(".item-slot").remove();
    $(".player-inventory").find(".item-slot").remove();
    $(".ply-hotbar-inventory").find(".item-slot").remove();
    $(".other-inventory").find(".item-slot").remove();
    $(".player-clothes").find('.item-slot').remove();
    $(".player-kupon").find(".item-slot").remove();
    $(".player-anahtar").find('.item-slot').remove();
    $(".other-player-clothes").find(".item-slot").remove();
    $(".other-player-clothes").css("display", "none");
    $('.near-players-wrapper').fadeOut();
    $(".near-players-wrapper").css({
      'display': "none"
    });
    $(this).find(".popup-body").html('');
    if ($("#rob-money").length) {
      $("#rob-money").remove();
    }
    $.post("https://qb-inventory/CloseInventory", JSON.stringify({}));
    if (AttachmentScreenActive) {
      $("#qbus-inventory").css({
        'left': '0vw'
      });
      $(".weapon-attachments-container").css({
        'left': "-100vw"
      });
      AttachmentScreenActive = false;
    }
    if (ClickedItemData !== null) {
      $("#weapon-attachments").fadeOut(0xfa, function () {
        $("#weapon-attachments").remove();
        ClickedItemData = {};
      });
    }
  };
  Inventory.Update = function (_0x236273) {
    totalWeight = 0x0;
    totalWeightOther = 0x0;
    $('.player-inventory').find(".item-slot").remove();
    $(".ply-hotbar-inventory").find('.item-slot').remove();
    if (_0x236273.error) {
      Inventory.Error();
    }
    for (i = 0x1; i < _0x236273.slots + 0x1; i++) {
      if (i == 0x5b) {
        $(".player-inventory").append("<div class=\"item-slot\" data-slot=\"" + i + "\"><div class=\"item-slot-key\"><p>6 <i class=\"fas fa-lock\"></i></p></div><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
      } else {
        $(".player-inventory").append("<div class=\"item-slot\" data-slot=\"" + i + "\"><div class=\"item-slot-img\"></div><div class=\"item-slot-label\"><p>&nbsp;</p></div></div>");
      }
    }
    $.each(_0x236273.inventory, function (_0x306cdb, _0x48fd8f) {
      if (_0x48fd8f != null) {
        totalWeight += _0x48fd8f.weight * _0x48fd8f.amount;
        if (_0x48fd8f.slot < 0x6) {
          $(".player-inventory").find("[data-slot=" + _0x48fd8f.slot + ']').addClass("item-drag");
          $(".player-inventory").find("[data-slot=" + _0x48fd8f.slot + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x48fd8f.image + "\" alt=\"" + _0x48fd8f.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x48fd8f.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x48fd8f.weight * _0x48fd8f.amount / 0x3e8).toFixed(0x1) + '</p></div>' + ItemLabel);
          $('.player-inventory').find("[data-slot=" + _0x48fd8f.slot + ']').data("item", _0x48fd8f);
        } else if (_0x48fd8f.slot == 0x5b) {
          $(".player-inventory").find('[data-slot=' + _0x48fd8f.slot + ']').addClass("item-drag");
          $(".player-inventory").find("[data-slot=" + _0x48fd8f.slot + ']').html("<div class=\"item-slot-key\"><p>6 <i class=\"fas fa-lock\"></i></p></div><div class=\"item-slot-img\"><img src=\"images/" + _0x48fd8f.image + "\" alt=\"" + _0x48fd8f.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x48fd8f.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x48fd8f.weight * _0x48fd8f.amount / 0x3e8).toFixed(0x1) + "</p></div><div class=\"item-slot-label\"><p>" + _0x48fd8f.label + "</p></div>");
          $('.player-inventory').find('[data-slot=' + _0x48fd8f.slot + ']').data("item", _0x48fd8f);
        } else {
          $(".player-inventory").find("[data-slot=" + _0x48fd8f.slot + ']').addClass("item-drag");
          $(".player-inventory").find("[data-slot=" + _0x48fd8f.slot + ']').html("<div class=\"item-slot-img\"><img src=\"images/" + _0x48fd8f.image + "\" alt=\"" + _0x48fd8f.name + "\" /></div><div class=\"item-slot-amount\"><p>" + _0x48fd8f.amount + "</div><div class=\"item-slot-name\"><p>" + " " + (_0x48fd8f.weight * _0x48fd8f.amount / 0x3e8).toFixed(0x1) + "</p></div><div class=\"item-slot-label\"><p>" + _0x48fd8f.label + "</p></div>");
          $(".player-inventory").find("[data-slot=" + _0x48fd8f.slot + ']').data("item", _0x48fd8f);
        }
      }
    });
    $("#player-inv-weight").html((totalWeight / 0x3e8).toFixed(0x2) + " / " + (_0x236273.maxweight / 0x3e8).toFixed(0x2));
    handleDragDrop();
  };
  Inventory.ToggleHotbar = function (_0x5c2ed0) {
    if (_0x5c2ed0.open) {
      $(".z-hotbar-inventory").html('');
      for (i = 0x1; i < 0x6; i++) {
        var _0x5cc2dd = "<div class=\"z-hotbar-item-slot\" data-zhotbarslot=\"" + i + "\"> <div class=\"z-hotbar-item-slot-key\"><p>" + i + "</p></div><div class=\"z-hotbar-item-slot-img\"></div><div class=\"z-hotbar-item-slot-label\"><p>&nbsp;</p></div></div>";
        $('.z-hotbar-inventory').append(_0x5cc2dd);
      }
      $.each(_0x5c2ed0.items, function (_0x2effa5, _0x2fc7c9) {
        if (_0x2fc7c9 != null) {
          var _0x450f92 = "<div class=\"item-slot-label\"><p>" + _0x2fc7c9.label + "</p></div>";
          if (_0x2fc7c9.name.split('_')[0x0] == "weapon") {
            if (!Inventory.IsWeaponBlocked(_0x2fc7c9.name)) {
              _0x450f92 = "<div class=\"item-slot-quality\"><div class=\"item-slot-quality-bar\"><p>100</p></div></div><div class=\"item-slot-label\"><p>" + _0x2fc7c9.label + "</p></div>";
            }
          }
          $(".z-hotbar-inventory").find('[data-zhotbarslot=' + _0x2fc7c9.slot + ']').html("<div class=\"z-hotbar-item-slot-img\"><img src=\"images/" + _0x2fc7c9.image + "\" alt=\"" + _0x2fc7c9.name + "\" /></div><div class=\"z-hotbar-item-slot-amount\"><p>" + _0x2fc7c9.amount + "</div><div class=\"z-hotbar-item-slot-amount-name\"><p>" + " " + (_0x2fc7c9.weight * _0x2fc7c9.amount / 0x3e8).toFixed(0x1) + "</p></div>" + _0x450f92);
          Inventory.QualityCheck(_0x2fc7c9, true, false);
        }
      });
      $(".z-hotbar-inventory").fadeIn(0x96);
    } else {
      $('.z-hotbar-inventory').fadeOut(0x96, function () {
        $(".z-hotbar-inventory").html('');
      });
    }
  };
  Inventory.UseItem = function (_0x3673d8) {
    $(".itembox-container").hide();
    $('.itembox-container').fadeIn(0xfa);
    $("#itembox-action").html('<p>Gebruikt</p>');
    $("#itembox-label").html("<p>" + _0x3673d8.item.label + "</p>");
    $("#itembox-image").html("<div class=\"item-slot-img\"><img src=\"images/" + _0x3673d8.item.image + "\" alt=\"" + _0x3673d8.item.name + "\" /></div>");
    setTimeout(function () {
      $('.itembox-container').fadeOut(0xfa);
    }, 0x7d0);
  };
  Inventory.Elde = function (_0x4193dd) {
    elde = false;
  };
  var _0x7ad6da = null;
  Inventory.itemBox = function (_0x35ea04) {
    var _0x639a50 = "Kullanıldı";
    if (_0x35ea04.type == "add") {
      _0x639a50 = "Eklendi";
    } else if (_0x35ea04.type == "remove") {
      _0x639a50 = 'Silindi';
    }
    if (_0x639a50 == "Kullanıldı") {
      if (_0x35ea04.item.name.split('_')[0x0] == 'weapon') {
        if (elde == false) {
          if (_0x35ea04.police == false) {
            _0x639a50 = "Kullanıldı";
            elde = true;
          } else {
            _0x639a50 = 'Kullanıldı';
            elde = true;
          }
        } else if (_0x35ea04.police == false) {
          _0x639a50 = 'Kullanıldı';
          elde = false;
          $.post('https://qb-inventory/gunAimOff');
        } else {
          _0x639a50 = "Kullanıldı";
          elde = false;
          $.post('https://qb-inventory/gunAimOff');
        }
      }
    }
    var _0x1678aa = $('.itembox-container.template').clone();
    _0x1678aa.removeClass("template");
    _0x1678aa.html("<div id=\"itembox-action\"><p>" + _0x639a50 + "</p></div><div id=\"itembox-label\"><p>" + _0x35ea04.item.label + "</p></div><div class=\"item-slot-img\"><img src=\"images/" + _0x35ea04.item.image + "\" alt=\"" + _0x35ea04.item.name + "\" /></div>");
    $('.itemboxes-container').prepend(_0x1678aa);
    _0x1678aa.fadeIn(0xfa);
    setTimeout(function () {
      $.when(_0x1678aa.fadeOut(0x12c)).done(function () {
        _0x1678aa.remove();
      });
    }, 0xbb8);
  };
  Inventory.RequiredItem = function (_0x2c274a) {
    if (_0x7ad6da !== null) {
      clearTimeout(_0x7ad6da);
    }
    if (_0x2c274a.toggle) {
      if (!requiredItemOpen) {
        $(".requiredItem-container").html('');
        $.each(_0x2c274a.items, function (_0x54c476, _0x698fb3) {
          var _0x4ca1d5 = "<div class=\"requiredItem-box\"><div id=\"requiredItem-action\">Gerekli</div><div id=\"requiredItem-label\"><p>" + _0x698fb3.label + "</p></div><div id=\"requiredItem-image\"><div class=\"item-slot-img\"><img src=\"images/" + _0x698fb3.image + "\" alt=\"" + _0x698fb3.name + "\" /></div></div></div>";
          $(".requiredItem-container").hide();
          $(".requiredItem-container").append(_0x4ca1d5);
          $(".requiredItem-container").fadeIn(0x64);
        });
        requiredItemOpen = true;
      }
    } else {
      $(".requiredItem-container").fadeOut(0x64);
      _0x7ad6da = setTimeout(function () {
        $('.requiredItem-container').html('');
        requiredItemOpen = false;
      }, 0x64);
    }
  };
  window.onload = function (_0x102709) {
    window.addEventListener("message", function (_0x1221d4) {
      if (_0x1221d4.data.action == 'nearPlayersGive') {
        givingItem = _0x1221d4.data.ItemId;
        $(".near-players-wrapper").find(".popup-body").html('');
        $.each(_0x1221d4.data.players, function (_0x38d47e, _0x3f8707) {
          $(".near-players-list .popup-body").append("<div class=\"player\" data-id=\"" + _0x3f8707.id + "\" data-action=\"" + _0x1221d4.data.action + "\">" + _0x3f8707.name + "</div>");
        });
        $(".near-players-wrapper").fadeIn();
      }
      switch (_0x1221d4.data.action) {
        case "open":
          Inventory.Open(_0x1221d4.data);
          break;
        case "close":
          Inventory.Close();
          break;
        case "slotfix":
          SlotFix();
          break;
        case "update":
          Inventory.Update(_0x1221d4.data);
          break;
        case "itemBox":
          Inventory.itemBox(_0x1221d4.data);
          break;
        case "requiredItem":
          Inventory.RequiredItem(_0x1221d4.data);
          break;
        case 'toggleHotbar':
          Inventory.ToggleHotbar(_0x1221d4.data);
          break;
        case "RobMoney":
          $('.inv-options-list').append("<div class=\"inv-option-item\" id=\"rob-money\"><p>NEEM GELD</p></div>");
          $("#rob-money").data("TargetId", _0x1221d4.data.TargetId);
          break;
        case "Elde":
          Inventory.Elde(_0x1221d4.data);
          break;
      }
    });
  };
})();
$(".exit-popup").on("click", function () {
  givingItem = null;
  $('.near-players-wrapper').fadeOut("normal").promise().then(function () {
    $(this).find('.popup-body').html('');
  });
  $(".near-players-wrapper").css({
    'display': 'none'
  });
});
$("#clothes").on("click", function () {
  $(".inv-options").css({
    'display': "none"
  });
  $(".player-clothes").css({
    'display': 'block'
  });
});
$("#kuponlarim").on("click", function () {
  $(".inv-options").css({
    'display': 'none'
  });
  $(".player-kupon").css({
    'display': 'block'
  });
});
$(document).on("click", "#vehiclekey-stash", function (_0x229b81) {
  _0x229b81.preventDefault();
  $(".inv-options").css({
    'display': "none"
  });
  $(".player-anahtar").css({
    'display': "block"
  });
});
$("#item-give").droppable({
	hoverClass: 'item-slot-hoverClass',
	drop: function(event, ui) {
		setTimeout(function(){
			IsDragging = false;
		}, 300)
		fromData = ui.draggable.data("item");
        fromSlot = ui.draggable.attr("data-slot");
        errorInventory = ui.draggable.parent();
		fromInventory = ui.draggable.parent().attr("data-inventory");
		amount = $("#item-amount").val();

        if (fromInventory !== 'player') {
            InventoryError(errorInventory, fromSlot);
            return;
        }

		if (amount == 0) {amount=fromData.amount}
		$.post("https://qb-inventory/GetNearPlayers", JSON.stringify({
			ItemId: fromData
		}));
  }
});
$('.popup-body').on('click', '.player', function () {

  let target = $(this).data('id');
  let action = $(this).data('action');
let amount = parseInt($("#item-amount").val());

  if (action === "nearPlayersGive") {

      if (givingItem != null) {
    
          if (amount === 0) {
              amount = 1
          }
    
          $.post("https://qb-inventory/GiveItem", JSON.stringify({
      targetX: target,
              inventory: fromInventory,
              item: givingItem,
              amount: amount
          }));
                  $('.near-players-wrapper').fadeOut();
        $(".near-players-wrapper").css({"display":"none"});
        $(this).find('.popup-body').html('');
      }
  }
});
$(document).on("click", "#rob-money", function (_0x38b71a) {
  _0x38b71a.preventDefault();
  var _0x154c86 = $(this).data("TargetId");
  $.post("https://qb-inventory/RobMoney", JSON.stringify({
    'TargetId': _0x154c86
  }));
  $("#rob-money").remove();
});
$(document).on('click', '.clothes-close', function (_0x267435) {
  _0x267435.preventDefault();
  $('.inv-options').css({
    'display': "block"
  });
  $('.player-clothes').css({
    'display': "none"
  });
  $(".other-player-clothes").css({
    'display': "none"
  });
});
$(document).on('click', ".kupon-close", function (_0x27c249) {
  _0x27c249.preventDefault();
  $(".inv-options").css({
    'display': "block"
  });
  $('.player-clothes').css({
    'display': "none"
  });
  $(".player-kupon").css({
    'display': "none"
  });
  $('.player-anahtar').css({
    'display': "none"
  });
  $(".other-player-clothes").css({
    'display': 'none'
  });
});
$(document).on('click', ".anahtar-close", function (_0x5adea3) {
  _0x5adea3.preventDefault();
  $(".inv-options").css({
    'display': 'block'
  });
  $('.player-clothes').css({
    'display': "none"
  });
  $('.player-kupon').css({
    'display': 'none'
  });
  $(".player-anahtar").css({
    'display': "none"
  });
  $(".other-player-clothes").css({
    'display': 'none'
  });
});
$(document).on("click", "#other-clothes", function (_0x457db8) {
  _0x457db8.preventDefault();
  $(".other-player-clothes").css({
    'display': "block"
  });
  $(".inv-options").css({
    'display': 'none'
  });
});
function SlotFix() {
  $(".item-slot").remove();
  $(".player-inventory").find(".item-slot").remove();
  $(".ply-hotbar-inventory").find(".item-slot").remove();
  $(".other-inventory").find(".item-slot").remove();
  $(".player-clothes").find(".item-slot").remove();
  $(".player-kupon").find(".item-slot").remove();
  $(".player-anahtar").find(".item-slot").remove();
  $(".other-player-clothes").find('.item-slot').remove();
}