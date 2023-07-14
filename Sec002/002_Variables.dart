void main() {
  final String pokemon = 'Ditto';
  final int hp = 100;
  final bool isAlive = true;
  final abilities = ['impostor'];
  final List<String> moves = ['run', 'walk'];
  final sprites = <String>['ditto/front.png', 'ditto/back.png'];

  // dynamic == null
  dynamic errorMessage = 'Error Code 232';
  errorMessage = false;
  errorMessage = 1232;
  errorMessage = [1, 2, 3];
  errorMessage = {1, 2, 3, 4};
  errorMessage = null;
  errorMessage = () => 'Function Error';

  print("""
  $pokemon
  $hp
  $isAlive
  $abilities
  $moves
  $sprites
  $errorMessage
  """);
}
