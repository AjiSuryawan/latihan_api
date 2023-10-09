import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ControllerListProduct.dart';

class ProductListPage extends StatelessWidget {
  final productController = Get.put(ControllerListProduct());
  ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Data API"),
      ),
      body: Center(
        child: Obx(() => productController.isLoading.value
            ? CircularProgressIndicator()
            : ListView.builder(
            itemCount: productController.productResponModelCtr.length,
            itemBuilder: (BuildContext ctx, int idx) {
              // mengambil object per index nya dibuat var product
              final product = productController.productResponModelCtr[idx];
              return Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.name),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
