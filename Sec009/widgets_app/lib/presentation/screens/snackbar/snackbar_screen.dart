import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});
  static const name = 'snackbar_screen';

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text('¿Estás seguro?'),
              content: const Text(
                  'Aliqua enim tempor in amet labore proident id in proident. Incididunt aliquip reprehenderit nostrud minim ex fugiat minim nisi mollit labore ipsum ullamco. Aliquip enim culpa reprehenderit amet dolore reprehenderit proident consequat nostrud culpa ut qui elit laborum. Officia aute consequat excepteur do magna consectetur velit consectetur culpa cillum quis Lorem sit Lorem. Nulla cillum ullamco culpa sint deserunt. Esse adipisicing veniam cillum cupidatat voluptate enim aliquip.'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancelar')),
                FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('Aceptar')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars and Diablogs')),
      //---
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Ullamco fugiat fugiat commodo reprehenderit laborum incididunt ipsum dolore ex eiusmod consectetur esse. Duis reprehenderit cillum do nisi. Esse fugiat quis voluptate proident veniam proident aliqua dolore. Ex esse dolore reprehenderit tempor eu ea ea pariatur aliquip esse elit. Consectetur enim anim ad anim pariatur exercitation ad quis aute non ut aliqua in culpa.')
                ]);
              },
              child: const Text('Licensias usadas')),
          FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Mostrar dialogo'))
        ]),
      ),
      //--
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
