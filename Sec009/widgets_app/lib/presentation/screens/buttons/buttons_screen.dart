import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screen')),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated Disabled')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_a_photo_outlined),
                label: const Text('Elevated Icon')),
            ElevatedButton.icon(
                onPressed: null,
                icon: const Icon(Icons.add_a_photo_outlined),
                label: const Text('Elevated Icon Disabled')),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            const FilledButton(onPressed: null, child: Text('Filled Disabled')),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.holiday_village),
                label: const Text('Filled Icon')),
            FilledButton.icon(
                onPressed: null,
                icon: const Icon(Icons.holiday_village),
                label: const Text('Filled Icon Disabled')),
            OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
            const OutlinedButton(
                onPressed: null, child: Text('Outlined Disabled')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.abc),
                label: const Text('Outlined Icon')),
            OutlinedButton.icon(
                onPressed: null,
                icon: const Icon(Icons.abc),
                label: const Text('Outlined Icon Disabled')),
            TextButton(onPressed: () {}, child: const Text('Text')),
            const TextButton(onPressed: null, child: Text('Text Disabled')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.air_outlined),
                label: const Text('Text Icon')),
            TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons.air_outlined),
                label: const Text('Text Icon Disabled')),
            const CustomButton(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.app_settings_alt,
                )),
            const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.app_settings_alt,
                )),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.all_inbox_rounded,
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white)),
            ),
            IconButton(
              onPressed: null,
              icon: const Icon(
                Icons.all_inbox_rounded,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Custom',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
