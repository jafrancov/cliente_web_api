import 'package:cliente_web_api/src/network/api_materias.dart';
import 'package:cliente_web_api/src/views/materia_item.dart';
import 'package:flutter/material.dart';

class MateriasListPage extends StatefulWidget {
  MateriasListPage({Key key}) : super(key: key);

  @override
  _MateriasListPageState createState() => _MateriasListPageState();
}

class _MateriasListPageState extends State<MateriasListPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiMaterias.getMaterias(),
        builder: (context, snapshot) {
          final materias = snapshot.data;
//          print('The value of the input is: $materias');
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 2.0,
                    color: Colors.black,
                  );
                },
                itemBuilder: (context, index) {
                  return MateriaItem(
                      materias[index]['nombre'],
                      materias[index]['profesor'],
                      materias[index]['cuatrimestre'],
                      materias[index]['horario']);
                },
                itemCount: materias.length,
              );
            } else {
              return Center(
                child: Text('Ocurrió un error al consultar las materias.'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
