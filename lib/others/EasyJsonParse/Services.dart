import 'package:http/http.dart' as http;
import 'User.dart';

class Services {
  static const String url = 'https://inbianam.herokuapp.com/user/get-all';

  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<User> users = userFromJson(response.body);
        return users;
      } else {
        return List<User>();
      }
    } catch (e) {
      return List<User>();
    }
  }

  static Future<User> createUser(String name, String lastname, String document,
      String email, String password) async {
    final String url = "https://inbianam.herokuapp.com/auth/signup";

    final response = await http.post(url, body: {
      "name": name,
      "lastname": lastname,
      "dataBirth": "1999-01-17",
      "gender": "Masculine",
      "typeDocument": "Cédula de Ciudadanía",
      "document": document,
      "direction": "CR2F 12C-44",
      "neighborhood": "ABAS TURBAY",
      "phone": "3133011867",
      "occupation": "Estudiante",
      "tabletNumber": "1",
      "department": 1,
      "email": email,
      "password": password
    });

    if (response.statusCode == 201) {
      final String responseString = response.body;

      return userModelFromJson(responseString);
    } else {
      return null;
    }
  }
}
