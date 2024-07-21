import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';


class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.productModel != null) {
          return ListView.builder(
            itemCount: controller.productModel?.products?.length ?? 0,
            itemBuilder: (context, index) {
              var product = controller.productModel!.products![index];
              return ListTile(
                title: Text(product.title ?? ''),
                subtitle: Text(product.brand ?? ''),
                leading: Image.network(product.thumbnail ?? ''),
              );
            },
          );
        } else {
          return Center(child: Text('No products found'));
        }
      }),
    );
  }
}
