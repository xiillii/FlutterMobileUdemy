import 'package:formz/formz.dart';

// Define input validation errors
enum LoginEmailError { empty }

// Extend FormzInput and provide the input type and error type.
class LoginEmail extends FormzInput<String, LoginEmailError> {
  // Call super.pure to represent an unmodified form input.
  const LoginEmail.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const LoginEmail.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == LoginEmailError.empty) {
      return 'El campo es requerido';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  LoginEmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return LoginEmailError.empty;

    return null;
  }
}
