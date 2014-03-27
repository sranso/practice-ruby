// MEMOIZE, caching something
// generate ids for all the functions
(function() {
  var id = 0;

  function generateId() { return id++; };

  Function.prototype.id = function() {
    var newId = generateId();

    this.id = function() { return newId; };

    return newId;
  }

})();

// two *really* slow functions we want to memoize
var slowFunction = function(x, y) {
  for (var i = 0; i < 10; i++) {
    i;
  };
  return x * y + 15;
};
var anotherSlowFunction = function(x, y) {
  for (var i = 0; i < 5; i++) {
    i;
  };
  return x + y + 5;
};

// as long as the functions have a name
// { slowFunction: { [10, 2]: 200 },
//    anotherSlowFunction: { [11, 2]: 201 } }
// describe the problem, the best solution i could come up with..

var memoize = function(fn) {
  var answers = {};
  // "private var"--no one can reference var answers except for this  return function because of scope in js, methods can only access vars either inside or one level outside
  // closure bc there is a var one level of scope outside of this func
  return function() {
    var keys = Array.prototype.slice.call(arguments);
    // var fnId = fn.id();
    
    // if (! answers[fnId]) {
    //   answers[fnId] = {};
    // };

    // if (! answers[fnId][keys]) {
    //   answers[fnId][keys] = fn.apply(this, arguments);
    // };
 
    // return answers[fnId][keys];

    if (! answers[keys]) {
      answers[keys] = fn.apply(this, arguments);
    };
    console.log(answers);
    return answers[keys];
  };
};

var memoizedSlowFunction = memoize(slowFunction);
var memoizedAnotherSlowFunction = memoize(anotherSlowFunction);
 
// this will take a "long time" because the result of 10, 2 is not stored in the answerss object yet
var beforeFirst = new Date();
memoizedSlowFunction(10, 2);
var afterFirst = new Date();
console.log("time to make first call " + (afterFirst - beforeFirst) );
var beforeSecond = new Date();
memoizedSlowFunction(10, 2);
console.log("time to make second call " + ( (new Date()) - beforeSecond ) );
memoizedAnotherSlowFunction(10, 2);


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