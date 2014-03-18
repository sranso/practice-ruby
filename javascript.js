// https://gist.github.com/robertjwhitney/bc68fa071606ba6fd3b8
// 02_javascript.mdMarkdown
  
// 52) What are undefined and undeclared variables?
//   undeclared -- those that are not declared in the program (doesn't exist at all). trying to read their values gives runtime error.
//   undefined -- those that are not assigned any value but are declared.
  
// 53) What is a closure, and how/why would you use one?
//   functions that refer to independent (free) variables. the function defined in the closure 'remembers' the environment in which it was created in.
  
// 54) What's a typical use case for anonymous functions?
//   if no name is needed. if the function is declared inline. if the code seems more self-contained and readable when handlers are defined inside the code that's calling them.
//   http://stackoverflow.com/questions/10273185/what-are-the-benefits-to-using-anonymous-functions-instead-of-named-functions-fo
  
// 55) Can you explain how inheritance works in JavaScript?
//   inheritance means that a class can inherit characteristics from another class. prototyping allows you to globally add characteristics to a function. 
  
// 56) When would you use document.write()?
//   it writes a string of text to a doc stream opened by document.open(), and it's recommended to call document.close() afterwards.
//   it's bad practice for a few reasons...
//     it's not supported in xhtml docs.
//     if it's executed after the page has finished loading, it will overwrite the page / write a new page / fail
//     it executes where encountered; cannot inject at a given node point
//     easy way to create bugs
  
// 57) Explain AJAX in as much detail as possible
//   ajax is when an event triggered by the client sends a request to the server for new / more information that is then loaded onto the dom without reloading the entire page.
  
// 58) Explain how JSONP works (and how it's not really AJAX)
//   allows for cross-domain requests. ajax requests have to occur in the same domain of the page where the request originates. jsonp - 'json with padding'
  
// 59) Describe event bubbling.
//   event propagation in html dom. the event is first captured and handled by the inner most element and then propagated to outer elements.
//   http://stackoverflow.com/questions/4616694/what-is-event-bubbling-and-capturing
  
// 60) What's the difference between an "attribute" and a "property"?
//   attributes are defined by html. properties are defined by dom.
  
// 61) Difference between document load event and document ready event?
//   load - occurs when all content (including images) is ready
//   ready - handlers passed to this event will be executed after the dom is ready.
  
// 62) What is the difference between == and ===?
//   === - compares for equality without making any type conversions
//   == - compares for equality after doing any necessary type conversions
//   http://stackoverflow.com/questions/359494/does-it-matter-which-equals-operator-vs-i-use-in-javascript-comparisons
  
// 63) Explain how you would get a query string parameter from the browser window's URL.
//   http://stackoverflow.com/questions/901115/how-can-i-get-query-string-values-in-javascript
  
// 64) Explain the same-origin policy with regards to JavaScript.
//   https://developer.mozilla.org/en-US/docs/Web/JavaScript/Same_origin_policy_for_JavaScript
//  restricts how a document or script loaded from one origin can interact w a resource from another origin.
  
// 65) Explain event delegation.
//  allows you to avoid adding event listeners to specific nodes; instead, the event listener is added to one parent. that event listener analyzes bubbled events to find a match on child elements.
//  http://davidwalsh.name/event-delegate