!function (e) {
  function n(o) {
    if (t[o])return t[o].exports;
    var r = t[o] = {exports: {}, id: o, loaded: !1};
    return e[o].call(r.exports, r, r.exports, n), r.loaded = !0, r.exports
  }

  var t = {};
  return n.m = e, n.c = t, n.p = "//cytroncdn.videojj.com/release/6.12.3/", n(0)
}([function (e, n, t) {
  "use strict";
  function o(e, n) {
    if (!(e instanceof n))throw new TypeError("Cannot call a class as a function")
  }

  var r = -1, c = function i(e, n) {
    o(this, i), r++;
    var t = n && n.live, c = t ? "__liveOS_HOLDER__" : "__IVA_HOLDER__";
    window[c] || (window[c] = {}), window[c][r] = {parent: e, config: n, instance: this}, this.destroy = function () {
      delete window[c][r]
    };
    var s = n && n.sourceJs || (t ? "//sdkcdn.videojj.com/liveOS/liveOS.js" : "//cytroncdn.videojj.com/latest/cytron.core.js"), a = document.createElement("script");
    a.charset = "utf-8", a.async = !0, a.src = s;
    var d = document.getElementsByTagName("script")[0];
    d.parentNode.insertBefore(a, d)
  };
  window.Iva = c
}]);