import 'dart:async';

import 'package:singleton/models/usuario.dart';

class _UsuarioService {
  Usuario usuario;

  _UsuarioService({required this.usuario});

  StreamController<Usuario> _usuarioStreamController =
      new StreamController<Usuario>.broadcast();
  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  Usuario get obteberUsuario => this.usuario;
  bool get existeUsuario => this.usuario.show ? true : false;

  void cargarUsuario(Usuario user) {
    this.usuario = user;
    this._usuarioStreamController.add(user);
  }

  void cambiarEdad(int edad) {
    this.usuario.edad = edad;
    this._usuarioStreamController.add(this.usuario);
  }

  void dispose() {
    _usuarioStreamController.close();
  }
}

final usuarioService = new _UsuarioService(
    usuario: Usuario(edad: 18, nombre: 'Larz', show: false, profesiones: []));
