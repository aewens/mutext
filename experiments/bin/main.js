// Generated by CoffeeScript 1.7.1
(function() {
  require.config({
    urlArgs: "nocache=" + (new Date).getTime()
  });

  require(["dom"], function($) {
    console.log($.create("div").into(document.body));
    return console.log($.find("body"));
  });

}).call(this);