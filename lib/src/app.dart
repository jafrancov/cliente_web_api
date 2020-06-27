import 'package:cliente_web_api/src/screens/materias_list.dart';
import 'package:cliente_web_api/src/screens/materia_crear.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {
        '/inicio': (context) => HomeScreenPage(),
        '/materia' : (context) => MateriaCreatePage()
      },
      home: new HomeScreenPage()
    );
  }
}

class HomeScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cliente WebAPI con Azure'),
      ),
      body: MateriasListPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/materia');
        },
        tooltip: 'Agregar Materia',
        child: Icon(Icons.add),
      )
    );
  }
}