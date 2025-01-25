// calculater.js
function add(a, b) {
    return a + b;
}

function substract(a, b) {
    return a - b;
}

function multiply(a, b) {
    return a * b;
}

function divide(a, b) {
    if (a !== 0 && b !== 0) {
        return a / b;
    } else {
        return "not divisible by 0";
    }
}

module.exports = { add, substract, multiply, divide };
