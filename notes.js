// memoize, caching something
var slowFunction = function(x) {
    return x + 55;
};

var anotherSlowFunction = function(x, y, z) {
    return x + y + z;
};

var fn = function(a,b,c) {return a + b + c; };

var Foo = function(name) {
    this.name = name;
}
Foo.prototype = { 
    speak: function(a,b) { console.log(this.name, a, b); }
};

fn(1,2,3);
fn.apply(null, [1,2,3]);
fn.call(null, 1,2,3);

var foo = new Foo('littlefoo');

foo.speak.call(foo, 'a', 'b'); // 'littlefoo', 'a', 'b'

memoSpeak = memoize(foo.speak).bind(foo);

var memoize = function(fn) {
    var answers = { 10: 11 };
    
    return function() {
        var args = arguments;
        var key = args.toString();
        
        if (! answers[key]) {
            answers[key] = fn.apply(this, args)
        }
        
        return answers[key];
    };
};


slowFunction(10); // really slow :-(


var memoizedSlowFunction = memoize(slowFunction);
var memoizedAnotherSlowFunction = memoize(anotherSlowFunction);

// store mutliple functions, that will have many keys and values.
// slowFunction: { 10: 11, 33: 34 }

memoizedSlowFunction(10);

memoizedAnotherSlowFunction(1, 3, 5);

// result from cache
memoizedSlowFunction(10); 
memoizedSlowFunction(10); 
memoizedSlowFunction(10);


memoizedSlowFunction(33); 
// result from cache
memoizedSlowFunction(33); 
memoizedSlowFunction(33); 