import 'package:get/get.dart';
import 'ProductResponseModel.dart';
import 'package:http/http.dart' as http;

class ControllerListProduct extends GetxController {
  RxList<ProductResponseModel> productResponModelCtr =
      <ProductResponseModel>[].obs;

  RxBool isLoading = true.obs;

  @override
  void onInit(){
    super.onInit();
    loadData();
  }

  void loadData() async {
    try{
      final response = await http.get(Uri.parse(
          "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));

      if (response.statusCode == 200) {
        // mengisi data productResponModelCtr dengan hasil json dari model
        productResponModelCtr.value = productResponseModelFromJson(response.body);
      } else {
        print("status code : " + response.statusCode.toString());
      }

      isLoading.value = false;

    }catch(e){
      print("error : "+e.toString());
    }
  }
}
