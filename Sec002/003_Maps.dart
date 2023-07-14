void main() {
  final Map<String, dynamic> pokemon = {
    'name': 'Ditto',
    'hp': 100,
    'color': 'White',
    'age': 123,
    'alive': true,
    'abilities': ['imposter'],
    'sprites': {
      1: 'ditto/front.png',
      2: 'ditto/back.png',
      3: 'ditto/ungry.png',
      4: 'ditto/smile.png'
    }
  };

  final pokemons = {1: "Ditto", 2: "Bulbasaur"};

  print(pokemon);
  print('Name: ${pokemon['name']}');
  print('Sprites: ${pokemon['sprites']}');
  print('Back: ${pokemon['sprites'][2]}');
  print('Front: ${pokemon['sprites'][1]}');

  print(pokemons);
}
