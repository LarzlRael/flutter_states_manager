import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton/bloc/usuario/usuario_cubit.dart';
import 'package:singleton/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<UsuarioCubit>().borrarUsuario();
            },
          ),
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        print(state);

        // if (state is UsuarioInitial) {
        //   return Center(
        //     child: Text('no hay informacion del usuario'),
        //   );
        // } else if (state is UsuarioActivo) {
        //   // return InformacionUsuario(state.usuario);
        //   return InformacionUsuario(usuario: state.usuario);
        // } else {
        //   return Center(
        //     child: Text('No se ha establecido el estado'),
        //   );
        // }
        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center(
              child: Text('no hay informacion del usuario'),
            );
          case UsuarioActivo:
            return InformacionUsuario(
                usuario: (state as UsuarioActivo).usuario);

          default:
            return Center(
              child: Text('No se ha establecido el estado'),
            );
        }
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ...usuario.profesiones
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList(),
        ],
      ),
    );
  }
}
