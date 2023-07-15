abstract class Animal {}

abstract class Mamifero extends Animal {}

abstract class Ave extends Animal {}

abstract class Pez extends Animal {}

abstract mixin class Volador {
  void volar() => print('Estoy volando');
}

abstract mixin class Caminante {
  void caminar() => print('Estoy caminando');
}

abstract mixin class Nadador {
  void nadar() => print('Estoy nadando');
}

class Delfin extends Mamifero with Nadador {}

class Murcielago extends Mamifero with Volador, Caminante {}

class Gato extends Mamifero with Caminante {}

class Paloma extends Ave with Volador, Caminante {}

class Pato extends Ave with Caminante, Nadador, Volador {}

class Tiburon extends Pez with Nadador {}

class PexVolador extends Pez with Nadador, Volador {}

void main() {
  final flipper = Delfin();
  final batman = Murcielago();
  final lucas = Pato();

  flipper.nadar();

  batman.caminar();
  batman.volar();

  lucas.caminar();
  lucas.nadar();
  lucas.volar();
}
