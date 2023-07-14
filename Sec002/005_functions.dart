void main() {
  print(greetEveryone());
  print(greetPepe());
  print('Suma: ${addTwoNumbers(10, 20)}');
  // print('Suma: ${addTwoNumbers(10, '20')}');

  print('Resta: ${substractTwoNumbers(20, 89)}');

  print('Suma with optional parameter: ${addTwoNumbersOptional(10)}');
}

String greetEveryone() {
  return 'Hello everyone!';
}

String greetPepe() => 'Hello Pp';

int addTwoNumbersWithoutType(a, b) {
  return a + b;
}

int addTwoNumbers(int a, int b) {
  return a + b;
}

int substractTwoNumbers(int a, int b) => a - b;

int addTwoNumbersOptional(int a, [int b = 0]) {
  return a + b;
}
