// calculater.test.js
const { add, substract, multiply, divide } = require('./math');


describe('Calculator functions', () => {
    test('adds 1 + 2 to equal 3', () => {
        expect(add(1, 2)).toBe(3);
    });

    test('subtracts 5 - 3 to equal 2', () => {
        expect(substract(5, 3)).toBe(2);
    });

    test('multiplies 4 * 3 to equal 12', () => {
        expect(multiply(4, 3)).toBe(12);
    });

    test('divides 8 / 0 to equal 0', () => {
        expect(divide(8, 2)).toBe(4);
    });

    test('returns error message when dividing by 0', () => {
        expect(divide(8, 0)).toBe("not divisible by 0");
        expect(divide(0, 8)).toBe("not divisible by 0");
    });
});
