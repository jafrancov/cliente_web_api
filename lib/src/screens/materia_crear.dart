import 'package:cliente_web_api/src/network/api_materias.dart';
import 'package:flutter/material.dart';

import '../app.dart';

class MateriaCreatePage extends StatefulWidget {
  MateriaCreatePage({Key key}) : super(key: key);

  @override
  _MateriaCreatePageState createState() => _MateriaCreatePageState();
}

class _MateriaCreatePageState extends State<MateriaCreatePage> {
  final _nombreController = TextEditingController();
  final _profesorController = TextEditingController();
  final _cuatrimestreController = TextEditingController();
  final _horarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Materia'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(hintText: 'Nombre de la materia'),
              ),
              TextField(
                controller: _profesorController,
                decoration: InputDecoration(hintText: 'Profesor'),
              ),
              TextField(
                controller: _cuatrimestreController,
                decoration: InputDecoration(hintText: 'Cuatrimestre'),
              ),
              TextField(
                controller: _horarioController,
                decoration: InputDecoration(hintText: 'Horario'),
              ),
              MaterialButton(
                  child: Text(
                    'Guardar',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {
                    final body = {
                      "Nombre": _nombreController.text,
                      "Profesor": _profesorController.text,
                      "Cuatrimestre": _cuatrimestreController.text,
                      "Horario": _horarioController.text,
                    };
                    ApiMaterias.addMateria(body).then((success) => {
                          if (success)
                            {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('Materia creada'),
                                        actions: <Widget>[
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                _nombreController.text = '';
                                                _profesorController.text = '';
                                                _cuatrimestreController.text = '';
                                                _horarioController.text = '';
                                                Navigator.pop(context, '/inicio');
//                                                Navigator.popAndPushNamed(context, '/inicio');
                                              },
                                              child: Text('Ok'))
                                        ],
                                      ))
                            }
                          else
                            {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                      'Ocurrió un error al crear la Materia'),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Ok'),
                                    )
                                  ],
                                ),
                              )
                            }
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
