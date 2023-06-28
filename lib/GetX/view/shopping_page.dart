import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graph/ShopX/view/shop_home_page.dart';
import 'package:graph/GetX/controllers/cart_controller.dart';
import 'package:graph/GetX/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text("GetX"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShopHomePage(),
                    ));
              },
              label: const Text(
                "ShopX",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              icon: Icon(
                Icons.arrow_circle_right,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Text("data"),
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.tealAccent.shade100,
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.products[index].productName,
                                        style: const TextStyle(fontSize: 20)),
                                    Text(controller
                                        .products[index].productDescription)
                                  ],
                                ),
                                Text("\$${controller.products[index].price}",
                                    style: const TextStyle(fontSize: 22)),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal.shade700),
                              onPressed: () {
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              child: const Text("Add to Cart"),
                            ),
                            Obx(() {
                              return IconButton(
                                  onPressed: () {
                                    controller.products[index].isFavorite
                                        .toggle();
                                  },
                                  icon: controller
                                          .products[index].isFavorite.value
                                      ? const Icon(Icons.check_box_rounded)
                                      : const Icon(Icons
                                          .check_box_outline_blank_outlined));
                            })
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                "Total Amount:\$ ${cartController.totalPrice}",
                style: const TextStyle(fontSize: 24, color: Colors.white),
              );
            }),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.tealAccent.shade100,
          onPressed: () {},
          icon: const Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.black,
          ),
          label: GetX<CartController>(builder: (controller) {
            return Text(
              controller.count.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 24),
            );
          }),
        ),
      ),
    );
  }
}
