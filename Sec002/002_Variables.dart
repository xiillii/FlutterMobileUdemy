void main() {
  final String pokemon = 'Ditto';
  final int hp = 100;
  final bool isAlive = true;
  final abilities = ['impostor'];
  final List<String> moves = ['run', 'walk'];
  final sprites = <String>['ditto/front.png', 'ditto/back.png'];

  print("""
  $pokemon
  $hp
  $isAlive
  $abilities
  $moves
  $sprites
  """);
}
