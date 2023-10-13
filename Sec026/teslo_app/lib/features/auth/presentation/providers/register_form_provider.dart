import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teslo_app/features/shared/shared.dart';

//! 3 - State notifier provider - consume outside
final registerFormProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>(
        (ref) {
  return RegisterFormNotifier();
});

//! 2 - Implement of notifiers
class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  RegisterFormNotifier() : super(RegisterFormState());

  onNameChange(String value) {
    final newName = Name.dirty(value);
    state = state.copyWith(
        name: newName,
        isValid: Formz.validate(
            [newName, state.email, state.password, state.repeatPassword]));
  }

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail,
        isValid: Formz.validate(
            [newEmail, state.name, state.password, state.repeatPassword]));
  }

  onPasswordChange(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword,
        isValid: Formz.validate(
            [newPassword, state.name, state.email, state.repeatPassword]));
  }

  onRepeatPasswordChange(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        repeatPassword: newPassword,
        isValid: Formz.validate(
            [newPassword, state.name, state.email, state.password]));
  }

  onFormSubmit() {
    _touchEveryField();

    if (!state.isValid) return;

    print(state);
  }

  _touchEveryField() {
    final name = Name.dirty(state.name.value);
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final repeatPassword = Password.dirty(state.repeatPassword.value);

    state = state.copyWith(
        isFormPosted: true,
        name: name,
        email: email,
        password: password,
        repeatPassword: repeatPassword,
        isValid: Formz.validate([name, email, password, repeatPassword]));
  }
}

//! 1 - Privider state

class RegisterFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Name name;
  final Email email;
  final Password password;
  final Password repeatPassword;

  RegisterFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.repeatPassword = const Password.pure(),
  });

  RegisterFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Name? name,
    Email? email,
    Password? password,
    Password? repeatPassword,
  }) =>
      RegisterFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        password: password ?? this.password,
        repeatPassword: repeatPassword ?? this.repeatPassword,
      );

  @override
  String toString() {
    return '''
      RegisterFormState:
        isPosting : $isPosting
        isFormPosted : $isFormPosted
        isValid : $isValid
        email : $email
        password : $password
        repeatPassword : $repeatPassword
''';
  }
}
