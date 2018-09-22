import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:game_lister/models/game_result.dart';

class GiantBombApi {
  static const String API_KEY = "68f97f4da88e018095aee2b3cceb386e5d0f21b6";
  static const BASE_URL = "giantbomb.com/api";

  final _httpClient = new HttpClient();

  Future<GameResult> pagedList({
    String query: "Final Fantasy",
  }) async {
    var uri = Uri.https(BASE_URL, "games", <String, String>{
      "api_key": API_KEY,
      "filter": "name=$query",
      "field_list": "id,platforms,name,image,deck",
      "image_tags": "Box Art"
    });

    var response = await _getRequest(uri);

    GameResult list = GameResult.fromJson(json.decode(response));

    return list;
  }

  Future<String> _getRequest(Uri uri) async {
    var request = await _httpClient.getUrl(uri);
    var response = await request.close();

    return response.transform(utf8.decoder).join();
  }
}

GiantBombApi api = GiantBombApi();
