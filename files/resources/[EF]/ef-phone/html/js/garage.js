QB.Phone.Functions.Close = function () {
  if (QB.Phone.Data.currentApplication == "whatsapp") {
    setTimeout(function () {
      QB.Phone.Animations.TopSlideUp(".phone-application-container", 400, -160);
      QB.Phone.Animations.TopSlideUp(
        "." + QB.Phone.Data.currentApplication + "-app",
        400,
        -160
      );
      $(".whatsapp-app").css({ display: "none" });
      QB.Phone.Functions.HeaderTextColor("white", 300);

      if (OpenedChatData.number !== null) {
        setTimeout(function () {
          $(".whatsapp-chats").css({ display: "block" });
          $(".whatsapp-chats").animate(
            {
              left: 0 + "vh",
            },
            1
          );
          $(".whatsapp-openedchat").animate(
            {
              left: 0 + "vh",
            },
            1,
            function () {
              $(".whatsapp-openedchat").css({ display: "none" });
            }
          );
          OpenedChatData.number = null;
        }, 450);
      }
      OpenedChatPicture = null;
      QB.Phone.Data.currentApplication = null;
    }, 500);
  } else if (QB.Phone.Data.currentApplication == "meos") {
    $(".meos-alert-new").remove();
    $(".meos-recent-alert").removeClass("noodknop");
    $(".meos-recent-alert").css({ "background-color": "#004682" });
  }

  $(".publicphonebase").css("display", "none");
  $(".lock-screen").css("display", "block");
  $(".phone-footer").css("display", "none");
  QB.Phone.Animations.BottomSlideDown(".container", 300, -70);
  $.post("https://ef-phone/Close");
  QB.Phone.Data.IsOpen = false;
};

let veh;

$(document).on("click", ".garage-vehicle", function (e) {
  e.preventDefault();

  $(".garage-homescreen").animate(
    {
      left: 30 + "vh",
    },
    200
  );
  $(".garage-detailscreen").animate(
    {
      left: 0 + "vh",
    },
    200
  );

  var Id = $(this).attr("id");
  var VehData = $("#" + Id).data("VehicleData");
  veh = VehData;
  SetupDetails(VehData);
});

$(document).on("click", "#track-vehicle", function (e) {
  e.preventDefault();
  $.post(
    "https://ef-phone/track-vehicle",
    JSON.stringify({
      veh: veh,
    })
  );
});

$(document).on("click", "#valet-vehicle", function (e) {
  e.preventDefault();
  $("#return-button").click();
  $("#return-button").click();
  $("#return-button").click();
  $("#return-button").click();
  $("#return-button").click();
  $("#return-button").click();
  $(".phone-home-container").click();
  $(".phone-home-container").click();
  $(".phone-home-container").click();
  $(".phone-home-container").click();
  $(".phone-home-container").click();
  $(".phone-home-container").click();
  $(".phone-home-container").click();
  $(".phone-home-container").click();
  $.post(
    "https://ef-phone/valet-vehicle",
    JSON.stringify({
      veh: veh,
    })
  );
});

$(document).on("click", "#return-button", function (e) {
  e.preventDefault();

  $(".garage-homescreen").animate(
    {
      left: 00 + "vh",
    },
    200
  );
  $(".garage-detailscreen").animate(
    {
      left: -30 + "vh",
    },
    200
  );
});

SetupGarageVehicles = function (Vehicles) {
  $(".garage-vehicles").html("");
  if (Vehicles != null) {
    $.each(Vehicles, function (i, vehicle) {
      var Element =
        '<div class="garage-vehicle" id="vehicle-' +
        i +
        '"><span class="garage-vehicle-firstletter">' +
        vehicle.brand.charAt(0) +
        '</span> <span class="garage-vehicle-name">' +
        vehicle.fullname +
        "</span> </div>";

      $(".garage-vehicles").append(Element);
      $("#vehicle-" + i).data("VehicleData", vehicle);
    });
  }
};

SetupDetails = function (data) {
  $(".vehicle-brand").find(".vehicle-answer").html(data.brand);
  $(".vehicle-model").find(".vehicle-answer").html(data.model);
  $(".vehicle-plate").find(".vehicle-answer").html(data.plate);
  $(".vehicle-garage").find(".vehicle-answer").html(data.garage);
  $(".vehicle-status").find(".vehicle-answer").html(data.state);
  $(".vehicle-fuel")
    .find(".vehicle-answer")
    .html(Math.ceil(data.fuel) + "%");
  $(".vehicle-engine")
    .find(".vehicle-answer")
    .html(Math.ceil(data.engine / 10) + "%");
  $(".vehicle-body")
    .find(".vehicle-answer")
    .html(Math.ceil(data.body / 10) + "%");
};
