import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New User')),
      body: BlocProvider(
        create: (_) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(children: [
            FlutterLogo(
              size: 500,
            ),
            _RegisterForm(),
            SizedBox(
              height: 20,
            )
          ]),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    return Form(
      key: _formKey,
      child: Column(children: [
        CustomTextFormField(
          label: 'Username',
          onChanged: (value) {
            registerCubit.usernameChanged(value ?? '');
            _formKey.currentState?.validate();
          },
          validator: (value) {
            if (value == null || value.isEmpty) return 'Required';
            if (value.trim().isEmpty) return 'Required';
            if (value.length < 6) return 'Must have more than 6 letters';

            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          label: 'Email',
          onChanged: (value) {
            registerCubit.emailChanged(value ?? '');
            _formKey.currentState?.validate();
          },
          validator: (value) {
            if (value == null || value.isEmpty) return 'Required';
            if (value.trim().isEmpty) return 'Required';

            final emailRegExp = RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
            );

            if (!emailRegExp.hasMatch(value)) return 'Must me a valid email';

            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          label: 'Password',
          obscureText: true,
          onChanged: (value) {
            registerCubit.passwordChanged(value ?? '');
            _formKey.currentState?.validate();
          },
          validator: (value) {
            if (value == null || value.isEmpty) return 'Required';
            if (value.trim().isEmpty) return 'Required';
            if (value.length < 6) return 'Must have more than 6 letters';

            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Save')),
      ]),
    );
  }
}
