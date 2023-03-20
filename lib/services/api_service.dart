import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_list_task/constants.dart';

import '../models/movie_model.dart';

// make a get request
class ApiService {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is problem with status code ${response.statusCode}');
    }
  }
}

class AllMoviesService {
  Future<List<MovieModel>> getAllMovies() async {
    // List<dynamic> data = await ApiService().get(url: kUrl, token: null);
    dynamic data = await ApiService().get(url: kUrl, token: null);
    List<dynamic> resDynamic = data['results'];
    // List<MovieModel> movieList = resDynamic.cast<MovieModel>();
    List<MovieModel> movieList = [];
    for (int i = 0; i < resDynamic.length; i++) {
      movieList.add(
        MovieModel.fromJson(resDynamic[i]),
      );
    }

    return movieList;
  }
}
