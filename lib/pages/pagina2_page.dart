import 'package:flutter/material.dart';
import 'package:singleton/models/usuario.dart';
import 'package:singleton/usuario/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Text('Nombre : ${snapshot.data!.nombre}')
                : Text('pagina 2 ');
          },
        ),
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
                  nombre: 'Larz',
                  edad: 20,
                  profesiones: [],
                  show: true,
                );
                usuarioService.cargarUsuario(newUser);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                usuarioService.cambiarEdad(30);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Añadir profesion',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
