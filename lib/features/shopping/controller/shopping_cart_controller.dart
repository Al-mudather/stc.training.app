import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:stc_training/utils/custom_image_picker_util.dart';

class ShoppingCartController extends GetxController {
  ///////////////////////////////////////
  ///        Selected Image
  ///////////////////////////////////////

  var _img;
  get Img => _img;

  // Empty the image data
  void EMPTY_the_image_data() {
    _img = null;
  }

  // Set the selected image
  void SET_the_selected_image(val) async {
    // File file = File(val.path);
    String imgName = val.name;

    var imgType = imgName.split('.').last;

    var multipartFile = await http.MultipartFile.fromPath(
      'image',
      val.path,
      filename: imgName,
      contentType: MediaType("image", imgType),
    );

    // LOG_THE_DEBUG_DATA(messag: "Certificate type: $multipartFile");

    _img = multipartFile;
  }

  // Get the image selection
  Widget GET_IAMGE_SELECTEION({
    required BuildContext context,
    enable = true,
    networkImg = null,
    label = "",
  }) {
    return CustomImagePickerUtil(
      label: label,
      setSelectedData: SET_the_selected_image,
      enable: enable,
      networkImg: networkImg,
    );
  }
}
