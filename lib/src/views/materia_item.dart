import 'package:flutter/material.dart';

class MateriaItem extends StatelessWidget {
  final String _nombre;
  final String _profesor;
  final String _cuatrimestre;
  final String _horario;

  MateriaItem(this._nombre, this._profesor, this._cuatrimestre, this._horario);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 100.0,
            margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Text('$_nombre' ?? '',
                        style: TextStyle(fontSize: 18.0)),
                  ),
                ),
                Text('Profesor: $_profesor' ?? '',
                    style: TextStyle(fontSize: 15.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Cuatrimestre: $_cuatrimestre' ?? ''),
                    Text('|'),
                    Text('Horario: $_horario' ?? '')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
