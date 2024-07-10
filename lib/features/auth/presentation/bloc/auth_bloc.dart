// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_client_side/features/auth/domaine/usecases/sign_in.dart';
import 'package:medical_client_side/features/auth/domaine/usecases/sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn signIn = SignIn();
  final SignUp signUp = SignUp();

  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      final result = await signIn(
          SignInParams(identifier: event.identifier, password: event.password));
      result.fold(
        (failure) => emit(AuthFailure(message: failure.message)),
        (success) => emit(const AuthSuccess()),
      );
    });

    on<RegisterEvent>((event, emit) async {
      final result = await signUp(SignUpParams(
        email: event.email,
        password: event.password,
        birthDate: event.birthDate,
        firstName: event.firstName,
        lastName: event.lastName,
      ));
      result.fold(
        (failure) => emit(AuthFailure(message: failure.message)),
        (success) => emit(const AuthSuccess()),
      );
    });

    on<FirstStepRegisterEvent>((event, emit) {
      emit(FirstStepRegister());
    });

    on<SecondStepRegisterEvent>((event, emit) {
      emit(SecondStepRegister());
    });
  }
}
