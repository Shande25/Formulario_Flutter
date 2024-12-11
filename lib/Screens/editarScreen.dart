import 'package:flutter/material.dart'; 
import 'package:firebase_database/firebase_database.dart';

class Editarscreen extends StatelessWidget { 
  const Editarscreen({super.key}); 

  @override 
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( title: Text("EDITAR FIREBASE"),),
        body: Column(
          children: [
            formularioGuardar(),
            Divider(),
            formularioEliminar(),
          ],
        ),
    );
  }
} 

Widget formularioGuardar() { 
  final TextEditingController _cedula = TextEditingController(); 
  final TextEditingController _nombre = TextEditingController(); 
  final TextEditingController _edad = TextEditingController(); 
  final TextEditingController _ciudad = TextEditingController(); 

  return Column( 
    mainAxisAlignment: MainAxisAlignment.center, 
    crossAxisAlignment: CrossAxisAlignment.stretch, 
    children: [ 
      TextField( 
        controller: _cedula, 
        decoration: const InputDecoration( 
          label: Text("Cédula"), 
          border: OutlineInputBorder(), 
        ), 
      ), 
      const SizedBox(height: 16), 
      TextField( 
        controller: _nombre, 
        decoration: const InputDecoration( 
          label: Text("Nombre"), 
          border: OutlineInputBorder(), 
        ), 
      ), 
      const SizedBox(height: 16), 
      TextField( 
        keyboardType: TextInputType.number,
        controller: _edad, 
        decoration: const InputDecoration( 
          label: Text("Edad"), 
          border: OutlineInputBorder(), 
        ), 
      ), 
      const SizedBox(height: 16), 
      TextField( 
        controller: _ciudad, 
        decoration: const InputDecoration( 
          label: Text("Ciudad"), 
          border: OutlineInputBorder(), 
        ), 
      ), 
      const SizedBox(height: 16), 
      ElevatedButton( 
        onPressed: () => editar(_cedula.text, _nombre.text, _edad.text, _ciudad.text), 
        child: const Text("Editar"), 
      ), 
    ], 
  ); 
}

Future<void> editar(cedula, nombre, edad, ciudad) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("usuarios/"+ cedula);

  await ref.update({
    "cedula": cedula,
    "nombre": nombre,
    "edad": edad,
    "ciudad": ciudad
  });
}

//Eliminar
Widget formularioEliminar() {
  TextEditingController _cedula = TextEditingController();
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [TextField(
          controller: _cedula,
          decoration: const InputDecoration(
            labelText: "Cédula",
            fillColor: Colors.white,
            border: OutlineInputBorder(),
          ),
        ),
        IconButton(
          onPressed: () => eliminar(_cedula.text),
          icon: const Icon(Icons.delete),
        ),
      ],
    ),
  );
}

Future<void> eliminar(cedula) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("usuarios/"+ cedula);
  await ref.remove();
}
