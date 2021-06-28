class Usuario {
  final String nombre;
  final int edad;
  final List<String> profesiones;

  Usuario({
    required this.nombre,
    required this.edad,
    required this.profesiones,
  });
  Usuario copyWith({
    required String nombre,
    required int edad,
    required List<String> professiones,
  }) =>
      Usuario(nombre: nombre, edad: edad, profesiones: profesiones);
}
