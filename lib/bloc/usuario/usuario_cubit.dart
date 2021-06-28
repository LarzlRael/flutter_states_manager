import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:singleton/models/usuario.dart';

part 'usuarios_state.dart';

@immutable
class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(new UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(
        nombre: currentState.usuario.nombre,
        edad: 99,
        professiones: currentState.usuario.profesiones,
      );
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion() {
    final currentState = state;

    if (currentState is UsuarioActivo) {
      final newProfesiones = [
        ...currentState.usuario.profesiones,
        'Profesion ${currentState.usuario.profesiones.length + 1}'
      ];
      final newUser = currentState.usuario.copyWith(
        nombre: currentState.usuario.nombre,
        edad: currentState.usuario.edad,
        professiones: newProfesiones,
      );
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
