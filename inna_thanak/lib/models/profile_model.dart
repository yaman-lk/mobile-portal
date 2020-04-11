import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:inna_thanak/Utils/network.dart';

class Profile {
  static Future<Profile> getProfile() async {
    var dio = Dio();
    final response = await dio.get("${NetworkDataPaser.url}" + "userProfile",
        options: Options(headers: {
          'authorization': "Bearer" + NetworkDataPaser.accesstoken
        }));

    if (response.statusCode == 200) {
      return Profile.fromJson(json.decode(response.data));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Response response;
  String email;
  String name;
  String profilePicUrl;

  Profile({this.name, this.email, this.profilePicUrl});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      email: json['email'],
      profilePicUrl: json['title'],
    );
  }
}
