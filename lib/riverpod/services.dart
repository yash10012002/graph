import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/riverpod/model.dart';
import 'package:http/http.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class APiServices {
  String endpoint = 'https://reqres.in/api/users?page=2';
  Future<List<UserModel>> getUsers() async {
    if (await isConnected()) {
      Response response =
          await get(Uri.parse(endpoint)).timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['data'];
        return result.map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } else {
      throw Exception("no internet");
    }
  }

  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}

final userProvider = Provider<APiServices>(
  (ref) => APiServices(),
);
