import 'package:get/get.dart';
import 'package:no_starve/controllers/product_controller.dart';
import 'package:no_starve/data/api/api_client.dart';
import 'package:no_starve/data/api/repository/product.dart';
import 'package:no_starve/widgets/app_constants.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.POPULAR_PRODUCT_URI));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
