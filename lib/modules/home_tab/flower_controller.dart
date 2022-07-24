import 'package:get/get.dart';
import 'package:nomadic_florist/data/api/flower_api.dart';
import 'package:nomadic_florist/data/models/flower/flower_response.dart';

class FlowerController extends GetxController {
  final isLoading = false.obs;
  final isError = false.obs;

  String errorMessage = "";
  List<Flowers> flowers = [];

  @override
  void onInit() {
    super.onInit();
    getFlowers();
  }

  Future<void> getFlowers() async {
    isLoading(true);
    isError(false);

    try {
      flowers = await FlowerApi.getFlowers();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      isError(true);

      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = "Failed to load food";
      }
      errorMessage = e.toString();
      print(errorMessage);
    }
  }
}
