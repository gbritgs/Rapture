public with sharing class MathCalc {
    public MathCalc() {
        Calculator.CalculatorSoap calc = new Calculator.CalculatorSoap();
        Integer resultAdd = calc.Add(10, 10);
        system.debug('resultAdd: ' + resultAdd);
        system.assertEquals(resultAdd, 20);

        Integer resultDivide = calc.Divide(10, 5);
        system.debug('resultDivide: ' + resultDivide);
        system.assertEquals(resultDivide, 2);
    }
}