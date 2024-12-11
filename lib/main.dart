import 'package:app_fire/Screens/editarScreen.dart';
import 'package:app_fire/Screens/leerScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:app_fire/Screens/guardarScreen.dart';
import 'package:flutter/material.dart'; 

 
Future<void> main() async { 
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MainApp()); 
} 
 
class MainApp extends StatelessWidget { 
  const MainApp({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return const MaterialApp( 
      home: Cuerpo() 
    ); 
  } 
} 
 
class Cuerpo extends StatelessWidget { 
  const Cuerpo({super.key}); 
 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text("APP_NAME"), 
      ), 
      body: Editarscreen(), 
    ); 
  } 
 
}