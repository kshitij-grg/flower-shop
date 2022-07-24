import 'package:get/get.dart';
import 'package:nomadic_florist/data/api/flower_api.dart';
import 'package:nomadic_florist/data/models/flower/occasion_response.dart';

class OccasionController extends GetxController {
  final isLoading = false.obs;
  final isError = false.obs;

  String errorMessage = "";
  List<Occasions> occasions = [];

  @override
  void onInit() {
    super.onInit();
    getOccasions();
  }

  Future<void> getOccasions() async {
    isLoading(true);
    isError(false);

    try {
      occasions = await FlowerApi.getOccasions();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      isError(true);

      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = "Failed to load category";
      }
      errorMessage = e.toString();
      print(errorMessage);
    }
  }
}
