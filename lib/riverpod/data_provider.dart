import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/riverpod/model.dart';
import 'package:graph/riverpod/services.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.watch(userProvider).getUsers();
});
