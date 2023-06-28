import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graph/Graph/app_style.dart';
import 'package:graph/riverpod/data_provider.dart';

import 'detail_page.dart';


final numberProvider = Provider<int>((ref) => 0);

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
        backgroundColor: AppStyle.bg_color,
        appBar: AppBar(
          backgroundColor: AppStyle.bg_color,
          title: const Text("Riverpod"),
        ),
        body: _data.when(
          data: (_data) {
            // List<UserModel> userList = _data.map((e) => e).toList();
            return Padding(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: _data.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailPage(data: _data[index]),
                      ));
                    },
                    child: Card(
                      color: Colors.teal.shade900,
                      elevation: 2,
                      child: ListTile(
                        title: Text(
                          "${_data[index].firstName!} ${_data[index].lastName}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(_data[index].avatar!),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
