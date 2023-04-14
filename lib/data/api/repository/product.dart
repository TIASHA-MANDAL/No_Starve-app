import 'package:get/get.dart';
import 'dart:convert';
import 'package:no_starve/data/api/api_client.dart';
import 'package:no_starve/widgets/app_constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.BASE_URL);
  }
}
