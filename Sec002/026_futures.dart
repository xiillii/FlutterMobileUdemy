void main() {
  print('Inicio del programa');
  httpGet('https://josealonso.dev').then((value) {
    print(value);
  }).catchError((err) {
    print('Error: $err');
  });
  print('Fin del programa');
}

Future<String> httpGet(String url) {
  return Future.delayed(const Duration(seconds: 2), () {
    return 'Respuesta de la peticion http';
  });
}
