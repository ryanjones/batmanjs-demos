// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  WordBump.Word = (function(_super) {

    __extends(Word, _super);

    function Word() {
      return Word.__super__.constructor.apply(this, arguments);
    }

    Word.resourceName = 'word';

    Word.persist(Batman.LocalStorage);

    Word.encode('name', 'rank');

    return Word;

  })(Batman.Model);

}).call(this);