import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class Leerscreen extends StatelessWidget {
  const Leerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leer"),
        
      ),
      body: usuaeio_listV(),
    );
  }
}
Future<List<Map<String, dynamic>>> leer() async {
  // Obtiene la referencia de los datos en Firebase
  DatabaseReference starCountRef = FirebaseDatabase.instance.ref('usuarios/');
  
  // Usamos get() para obtener los datos de una sola vez
  final snapshot = await starCountRef.get();  
  final data = snapshot.value;

  // Verificamos que los datos no sean nulos
  if (data != null) {
    // Realizamos un cast explícito a Map<dynamic, dynamic>
    Map<dynamic, dynamic> mapData = data as Map<dynamic, dynamic>;

    List<Map<String, dynamic>> userList = [];

    // Recorremos el mapa y lo convertimos en una lista de mapas
    mapData.forEach((key, value) {
      userList.add({
        'cedula': key,  // Usamos la clave como id
        'nombre': value['name'],  // Nombre del usuario
        'edad': value['edad'],  // Edad del usuario
        'ciudad': value['ciudad'],  // Género del usuario
      });
    });

    return userList;  // Devolvemos la lista de usuarios
  } else {
    return [];  // Si no hay datos, devolvemos una lista vacía
  }
}
Widget usuaeio_listV() {
  return FutureBuilder(
      future: leer(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          return ListView.builder(itemCount: data.length, itemBuilder: (context, indice) {
            final item = data[indice];
            return ListTile(
              subtitle: Text("Cedula: ${item['cedula']}\nEdad: ${item['edad']}\nCiudad: ${item['ciudad']}"),
            );
          });
        } else {
          return Text("No hay datos");
        }
      });
}