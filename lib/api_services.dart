import 'dart:convert';
import 'package:apicall_with_model3/api_with_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<ApiWithModel>?> getDataApi() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200) {
        List<ApiWithModel> model = List<ApiWithModel>.from(
            json.decode(response.body).map((x) => ApiWithModel.fromJson(x)));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
