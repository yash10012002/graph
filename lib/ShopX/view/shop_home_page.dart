import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:graph/ShopX/cotrollers/product_controller.dart';
import 'package:graph/ShopX/view/product_tile.dart';

class ShopHomePage extends StatelessWidget {
  ShopHomePage({super.key});
  final ProductController productcontroller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        elevation: 0,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "ShopX",
                    style: TextStyle(
                        fontFamily: "avenir",
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.view_list_rounded),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.grid_view),
                ),
              ],
            ),
          ),
          Expanded(child: Obx(() {
            if (productcontroller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount: productcontroller.productList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // SizedBox(
                      //   height: index == 1 ? 0 : 0,
                      // ),
                      ProductTile(productcontroller.productList[index])
                    ],
                  );
                },
              );
            }
          })
              // StaggeredGridView.countBuilder(
              //   crossAxisCount: 2,
              //   crossAxisSpacing: 16,
              //   mainAxisSpacing: 16,
              //   itemBuilder: (context, index) {
              // return Container(
              //   height: 200,
              //   width: 1000,
              //   color: Colors.amber,
              // );
              //   },
              //   staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              // ),
              )
        ],
      ),
    );
  }
}
