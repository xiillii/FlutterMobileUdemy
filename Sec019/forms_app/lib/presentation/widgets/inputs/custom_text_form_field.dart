import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(40));

    return TextFormField(
      onChanged: (value) {
        print('value: ${value}');
      },
      validator: (value) {
        return 'Error en el formuilario';
      },
      decoration: InputDecoration(
          enabledBorder: border,
          focusedBorder:
              border.copyWith(borderSide: BorderSide(color: colors.primary)),
          errorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          focusedErrorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          isDense: true,
          label: Text('The Label'),
          hintText: 'This is the hint text',
          errorText: 'This is the error text',
          focusColor: colors.primary),
    );
  }
}
