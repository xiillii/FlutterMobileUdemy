void main() async {
  print('Inicio del programa');
  await httpGet('https://josealonso.dev').then((value) {
    print(value);
  }).catchError((err) {
    print('Error: $err');
  });
  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 2));

  throw 'Error en la petición';
  return 'Respuesta de la peticion http';
}
