var number_add = function(num1, num2) {
  return num2 + num1 + 5;
}
;
// include app/assets/javascripts/sort.js

describe('navigation item sorting', function() {
  it("does something", function() {
    expect(number_add(1, 2)).toBe (3)
  });
});
