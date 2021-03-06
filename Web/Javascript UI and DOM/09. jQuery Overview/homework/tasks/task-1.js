/* globals $ */

/* 

Create a function that takes a selector and COUNT, then generates inside a UL with COUNT LIs:   
  * The UL must have a class `items-list`
  * Each of the LIs must:
    * have a class `list-item`
    * content "List item #INDEX"
      * The indices are zero-based
  * If the provided selector does not selects anything, do nothing
  * Throws if
    * COUNT is a `Number`, but is less than 1
    * COUNT is **missing**, or **not convertible** to `Number`
      * _Example:_
        * Valid COUNT values:
          * 1, 2, 3, '1', '4', '1123'
        * Invalid COUNT values:
          * '123px' 'John', {}, [] 
*/

function solve() {
  return function (selector, count) {
    var $element = $(selector),
        $ulElement = $('<ul />').addClass('items-list'),
        $liElement = $('<li />').addClass('list-item'),
        $newLi,
        liText = 'List item #';
    
    if (typeof count === 'undefined') {
      throw new Error('Count is missing');
    }
    
    if (typeof count !== 'number') {
      throw new Error('Count is not a number');
    }
    
    if (count <= 0) {
      throw new Error('Count can not be negative or zero.');
    }
    
    if (selector === 'undefined') {
      throw new Error('Selector is undefined');
    }
    
    if (selector === 'null') {
      throw new Error('Selector is null');
    }
    
    if (typeof selector !== 'string') {
      throw new Error('Selector is not a string');
    }
    
    if ($element.length) {
      for (var i = 0; i < count; i += 1) {
        $newLi = $liElement.clone();
        $newLi.html(liText + i);
        $ulElement.append($newLi)
      }
      
      $element.append($ulElement);
    }
  };
};

module.exports = solve;