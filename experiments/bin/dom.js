// Generated by CoffeeScript 1.7.1
(function() {
  define(function() {
    var $;
    return $ = {
      create: function(selector) {
        var obj;
        obj = {
          element: document.createElement(selector),
          into: function(element) {
            element.appendChild(this.element);
            return Object.create(obj);
          },
          add: function(dom) {
            return this.element.appendChild(dom.element);
          }
        };
        return obj;
      },
      find: function(selector) {
        var element;
        element = document.querySelectorAll(selector)[0];
        if (element === void 0) {
          return null;
        }
        if (element.length === 1) {
          return element[0];
        } else {
          return element;
        }
      }
    };
  });

}).call(this);
