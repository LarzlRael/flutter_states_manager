import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton/bloc/usuario/usuario_cubit.dart';
import 'package:singleton/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                final newUser = Usuario(
                    nombre: 'larz',
                    edad: 34,
                    profesiones: ['fullstack', 'videjugador']);

                usuarioCubit.seleccionarUsuario(newUser);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                usuarioCubit.cambiarEdad(30);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Añadir profesion',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                usuarioCubit.agregarProfesion();
              },
            ),
          ],
        ),
      ),
    );
  }
}
