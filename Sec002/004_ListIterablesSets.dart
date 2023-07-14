void main() {
  final numbers = [1, 2, 3, 4, 5, 9, 9, 10];

  print('Original list: $numbers');
  print('Length: ${numbers.length}');
  print('Index 0: ${numbers[0]}');
  print('Last: ${numbers.last}');
  print('Reversed: ${numbers.reversed}');

  final reversedNumbers = numbers.reversed;
  print('Iterable: $reversedNumbers');
  print('List: ${reversedNumbers.toList()}');
  print('Set: ${reversedNumbers.toSet()}'); // Print only unique values

  final numberGreaterThan5 = numbers.where((element) {
    return element > 5;
  });

  print('Numbers > 5 Iterable: $numberGreaterThan5');
  print('Numbers > 5 Set: ${numberGreaterThan5.toSet()}');
}
