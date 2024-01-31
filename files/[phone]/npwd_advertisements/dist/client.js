(() => {
  var __async = (__this, __arguments, generator) => {
    return new Promise((resolve, reject) => {
      var fulfilled = (value) => {
        try {
          step(generator.next(value));
        } catch (e) {
          reject(e);
        }
      };
      var rejected = (value) => {
        try {
          step(generator.throw(value));
        } catch (e) {
          reject(e);
        }
      };
      var step = (x) => x.done ? resolve(x.value) : Promise.resolve(x.value).then(fulfilled, rejected);
      step((generator = generator.apply(__this, __arguments)).next());
    });
  };

  // node_modules/@project-error/pe-utils/lib/client/functions.js
  var RegisterNuiCB = (event, callback) => {
    RegisterNuiCallbackType(event);
    on(`__cfx_nui:${event}`, callback);
  };

  // node_modules/@project-error/pe-utils/lib/common/helpers.js
  function PrefixedUUID(iterator) {
    return `${iterator.toString(36)}-${Math.floor(Math.random() * Number.MAX_SAFE_INTEGER).toString(36)}`;
  }

  // node_modules/@project-error/pe-utils/lib/client/cl_utils.js
  var ClientUtils = class {
    constructor(settings) {
      this.uidCounter = 0;
      this._settings = {
        promiseTimeout: 15e3,
        debugMode: false
      };
      this.setSettings(settings);
    }
    debugLog(...args) {
      if (!this._settings.debugMode)
        return;
      console.log(`^1[ClUtils]^0`, ...args);
    }
    setSettings(settings) {
      this._settings = Object.assign(Object.assign({}, this._settings), settings);
    }
    emitNetPromise(eventName, data) {
      return new Promise((resolve, reject) => {
        let hasTimedOut = false;
        setTimeout(() => {
          hasTimedOut = true;
          reject(`${eventName} has timed out after ${this._settings.promiseTimeout} ms`);
        }, this._settings.promiseTimeout);
        const uniqId = PrefixedUUID(this.uidCounter++);
        const listenEventName = `${eventName}:${uniqId}`;
        emitNet(eventName, listenEventName, data);
        const handleListenEvent = (data2) => {
          removeEventListener(listenEventName, handleListenEvent);
          if (hasTimedOut)
            return;
          resolve(data2);
        };
        onNet(listenEventName, handleListenEvent);
      });
    }
    registerNuiProxy(event) {
      RegisterNuiCallbackType(event);
      on(`__cfx_nui:${event}`, async (data, cb) => {
        this.debugLog(`NUICallback processed: ${event}`);
        this.debugLog(`NUI CB Data:`, data);
        try {
          const res = await this.emitNetPromise(event, data);
          cb(res);
        } catch (e) {
          console.error("Error encountered while listening to resp. Error:", e);
          cb({ err: e });
        }
      });
    }
    registerRPCListener(eventName, cb) {
      onNet(eventName, (listenEventName, data) => {
        this.debugLog(`RPC called: ${eventName}`);
        Promise.resolve(cb(data)).then((retData) => {
          this.debugLog(`RPC Data:`, data);
          emitNet(listenEventName, retData);
        }).catch((e) => {
          console.error(`RPC Error in ${eventName}, ERR: ${e.message}`);
        });
      });
    }
  };

  // client/client.ts
  var ClUtils = new ClientUtils({ promiseTimout: 200 });
  var npwdExports = global.exports["npwd"];
  onNet("npwd-advertisements:updateNUI" /* UpdateNUI */, () => {
    npwdExports.sendUIMessage({ type: "npwd-advertisements:updateNUI" /* UpdateNUI */ });
  });
  RegisterNuiCB("npwd-advertisements:setWaypoint" /* SetWaypointAdvertisement */, (data) => {
    SetNewWaypoint(data.waypoint.x, data.waypoint.y);
  });
  RegisterNuiProxy("npwd-advertisements:getUser" /* GetUser */);
  RegisterNuiProxy("npwd-advertisements:getAdvertisements" /* GetAdvertisements */);
  RegisterNuiProxy("npwd-advertisements:createAdvertisement" /* CreateAdvertisement */);
  RegisterNuiProxy("npwd-advertisements:deleteAdvertisement" /* DeleteAdvertisement */);
  RegisterNuiProxy("npwd-advertisements:reportAdvertisement" /* ReportAdvertisement */);
  RegisterNuiProxy("npwd-advertisements:setWaypoint" /* SetWaypointAdvertisement */);
  function RegisterNuiProxy(event) {
    RegisterNuiCallbackType(event);
    on(`__cfx_nui:${event}`, (data, cb) => __async(this, null, function* () {
      try {
        const res = yield ClUtils.emitNetPromise(event, data);
        cb(res);
      } catch (e) {
        console.error("Error encountered while listening to resp. Error:", e);
        cb({ status: "error" });
      }
    }));
  }
})();
