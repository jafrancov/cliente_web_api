import 'package:http/http.dart' as http;
import 'dart:convert';


class URLs{
  static const String BASE_URL = "https://mtwdm-multi-android.azurewebsites.net/api/Materias";
}

class ApiMaterias{
  static Future<List<dynamic>> getMaterias() async{
    final response = await http.get('${URLs.BASE_URL}');
    if( response.statusCode == 200 ){
      return json.decode(response.body);
    }else{
      return null;
    }
  }

  static Future<bool> addMateria(body) async{
    final response = await http.post(
      '${URLs.BASE_URL}',
      headers: <String,String>{
        'Content-Type' : 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body)
    );

    if( response.statusCode == 200 || response.statusCode == 201 ){
      return true;
    }else{
      return false;
    }
  }
}