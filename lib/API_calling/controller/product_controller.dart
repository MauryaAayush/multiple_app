
import 'package:get/get.dart';

import '../model/data_model.dart';
import 'Sevices/api calling.dart';



class ProductController extends GetxController {
  var finaldata = {}.obs;
  var isLoading = false.obs;
  ProductModel? productModel;

  @override
  void onInit() {
    super.onInit();
    getValue();
  }

  Future<void> getValue() async {
    isLoading.value = true;

    print('Controller called');
    finaldata.value = await ProductApi.productApi.apiCalling();

    productModel = ProductModel.fromJson(finaldata.value);

    isLoading.value = false;
  }
}
