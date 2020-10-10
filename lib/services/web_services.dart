import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sca_mentee/model/photo_model.dart';

class ApiUrl {
  static const String url = 'https://api.pexels.com/v1/curated?per_page=1';
  Future<String> randomPhoto() async {
    String imageLink;
    try {
      final response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader:
            '563492ad6f917000010000014bfede1af4ec4cd1b1e346efd46a7f24',
      });

      final data = response.body;

      final apiResult = PhotosModel.fromJson(jsonDecode(data));
      for (var item in apiResult.photos) {
        imageLink = item.src.original;
      }
    } catch (e) {}
    return imageLink;
  }
}
//okay
