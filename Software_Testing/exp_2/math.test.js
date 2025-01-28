
const { add, substract, multiply, divide } = require('./math');


describe('Calculator functions', () => {
    test('adds 300 + 3 to equal 303', () => {
        expect(add(300, 3)).toBe(303);
    });

    test('subtracts 300 - 3 to equal 297', () => {
        expect(substract(300, 3)).toBe(297);
    });

    test('multiplies 4 * 3 to equal 12', () => {
        expect(multiply(4, 3)).toBe(12);
    });

    test('divides 126 / 2 to equal 63', () => {
        expect(divide(126, 2)).toBe(63);
    });

    test('returns error message when dividing by 0', () => {
        expect(divide(8, 0)).toBe("not divisible by 0");
        expect(divide(0, 8)).toBe("not divisible by 0");
    });
});
