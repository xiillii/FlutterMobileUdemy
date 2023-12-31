import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Riverpod Counter Screen',
      subTitle: 'Introducción a riverpod',
      link: '/counter',
      icon: Icons.numbers_rounded),
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicator',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars and Dialogs',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.menu_sharp),
  MenuItem(
      title: 'Animated container',
      subTitle: 'Stateful widget animated',
      link: '/animated',
      icon: Icons.animation_outlined),
  MenuItem(
      title: 'UI Controls',
      subTitle: 'Varios controles',
      link: '/ui-controls',
      icon: Icons.smart_button_sharp),
  MenuItem(
      title: 'Introducción a la aplicación',
      subTitle: 'Una serie de controles de flutter',
      link: '/tutorial',
      icon: Icons.book_online_outlined),
  MenuItem(
      title: 'Infinite Scroll',
      subTitle: 'Un scroll infinito',
      link: '/infinite',
      icon: Icons.image_search_outlined),
  MenuItem(
      title: 'Theme Changer',
      subTitle: 'Cambiar el tema de la aplicacion',
      link: '/theme-changer',
      icon: Icons.format_paint_outlined),
];
