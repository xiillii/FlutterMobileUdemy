import 'package:formz/formz.dart';

// Define input validation errors
enum LoginPasswordError { empty }

// Extend FormzInput and provide the input type and error type.
class LoginPassword extends FormzInput<String, LoginPasswordError> {
  // Call super.pure to represent an unmodified form input.
  const LoginPassword.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const LoginPassword.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == LoginPasswordError.empty) {
      return 'El campo es requerido';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  LoginPasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return LoginPasswordError.empty;

    return null;
  }
}
