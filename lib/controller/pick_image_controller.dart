import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_string.dart';
import '../widgets/error_message.dart';


class PickImageController extends GetxController {
  var pickedImage = Rx<XFile?>(null);


  //picked file form storage here
  Future<void> pickImage(ImageSource source) async {
    // permission check for device form storage
      XFile? image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        if (image.path.length > 500.toInt()) {
          errorToast(text:AppString.text_error.tr,subtext: AppString.text_jpeg_format_not_support.tr, );
      }
        pickedImage.value = image;
    }
  }
}
