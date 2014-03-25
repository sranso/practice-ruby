// MEMOIZE, caching something
var slowFunction = function(x, y) {
  return x * y + 15;
};
 
var answers = {};
 
var memoize = function(fn) {
  return function() {
    var args = arguments;
    var keys = Array.prototype.slice.call(args);
 
    if (! answers[keys]) {
        answers[keys] = fn.apply(this, args);
    };
 
    return answers[keys];
  };
};
 
var memoizedSlowFunction = memoize(slowFunction);
 
// this will take a "long time" because the result of 10, 2 is not stored in the answers object yet
memoizedSlowFunction(10, 2);
// this will take less time because the result was stored in the answers object last time
memoizedSlowFunction(10, 2);

// EXTEND, transfer functionality from one method / class to another
var Foo = function(name) {
  this.name = name;
}
 
var Speakable = {
  speak : function() { console.log("hi, i'm " + this.name) },
  highfive : function() { console.log("up top!"); }
}
 
var extend = function(toObj, fromObj) {
  for (prop in fromObj) {
    toObj[prop] = fromObj[prop];
  };
  return toObj;
}
 
var littleFoo = new Foo("little foo");
 
extend(littleFoo, Speakable);
 
littleFoo.speak(); // => hi, i'm little foo
littleFoo.highfive(); // => up top!