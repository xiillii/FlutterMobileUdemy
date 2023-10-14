import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_app/features/auth/domain/domain.dart';
import 'package:teslo_app/features/auth/infrastructure/infrastructure.dart';

//! 3 - State notifier provider - consume outside

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();

  return AuthNotifier(authRepository: authRepository);
});

//! 2 - Implement of notifiers

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier({required this.authRepository}) : super(AuthState());

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on WrongCredentials {
      logout('Credenciales incorrectas');
    } on ConnectionError {
      logout('Connection Error');
    } on ConnectionTimeout {
      logout('Connection Timeout');
    } catch (e) {
      logout('Error desconocido');
    }
  }

  void registerUser(String fullname, String email, String password) {}

  void chechAuthStatus() async {}

  Future<void> logout([String? errorMessage]) async {
    // TODO: clean token
    state = state.copyWith(
        user: null,
        errorMessage: errorMessage,
        authStatus: AuthStatus.notAuthenticated);
  }

  void _setLoggedUser(User user) {
    // TODO: Save token
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
    );
  }
}

//! 1 - Privider state

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.user,
      this.errorMessage = ''});

  AuthState copyWith(
          {AuthStatus? authStatus, User? user, String? errorMessage}) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          errorMessage: errorMessage ?? this.errorMessage);
}
