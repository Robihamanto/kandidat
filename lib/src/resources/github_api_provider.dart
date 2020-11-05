import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kandidat/src/models/user_model.dart';

class GithubApiProvider {
  Client client = Client();
  final token = "2c3448408fced55050d749406f9c43679fa49c26";

  Future<List<UserModel>> fetchUsers() async {
    final response = await client.get('https://api.github.com/users');

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      final responseJSON = jsonDecode(response.body) as List;
      List<UserModel> users = responseJSON.map((e) => UserModel.fromJSON(e)).toList();
      return users;

    } else {
      throw Exception('Unable to fetch Users');
    }

  }


  Future<UserModel> fetchUser(int id) async {
    final response = await client.get('https://api.github.com/user/$id');

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      final responseJSON = jsonDecode(response.body);
      UserModel user = UserModel.fromJSON(responseJSON);
      return user;

    } else {
      throw Exception('Unable to fetch Users');
    }
  }

}