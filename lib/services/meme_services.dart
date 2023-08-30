import 'dart:convert';

import 'package:meme_app/models/meme_models.dart';
import 'package:http/http.dart' as http;

class MemeServices {
  Future<MemeModels> getMemesApi() async {
    final response = await http.get(
      Uri.parse("https://api.imgflip.com/get_memes"),
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      return MemeModels.fromJson(data);
    } else {
      return MemeModels.fromJson(data);
    }
  }
}
