import 'package:flutter/material.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Pariatur ullamco ad ut voluptate ad non.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rapida',
      'Qui eu magna dolore laboris minim dolore cupidatat reprehenderit excepteur.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Reprehenderit labore cillum non fugiat id duis exercitation cillum ad occaecat.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatelessWidget {
  const AppTutorialScreen({super.key});
  static const name = 'app_tutorial_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: slides
            .map((e) => _Slide(
                title: e.title, caption: e.caption, imageUrl: e.imageUrl))
            .toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  _Slide({required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
