import 'package:e_commerce_app/controller/input_controller.dart';
import 'package:get/get.dart';

class CountryPickerController extends GetxController {
  final InputController _inputTextFieldController = Get.put(InputController());

  void setSelectedCountry(String country) {
    _inputTextFieldController.addCountyController.text = country;
  }
}
