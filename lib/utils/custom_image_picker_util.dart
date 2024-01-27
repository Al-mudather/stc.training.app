import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomImagePickerUtil extends StatefulWidget {
  final String label;
  String? networkImg;
  final bool hasLabel;
  final bool enable;
  Function setSelectedData;

  CustomImagePickerUtil({
    super.key,
    required this.label,
    this.hasLabel = true,
    this.enable = true,
    this.networkImg,
    required this.setSelectedData,
  });

  @override
  State<CustomImagePickerUtil> createState() => _CustomImagePickerUtilState();
}

class _CustomImagePickerUtilState extends State<CustomImagePickerUtil> {
  var filePicked;

  void pickAFile() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles();
    if (resultFile != null) {
      PlatformFile file = resultFile.files.first;
      setState(() {
        filePicked = file;
        // fileName = file.name;
        widget.setSelectedData(file);
      });
    }
  }

  void selectImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? result = await picker.pickImage(source: ImageSource.gallery);
    var img = await result!.readAsBytes();
    // LOG_THE_DEBUG_DATA(messag: result!.path);
    setState(() {
      filePicked = result;
      // Send the image back to the parent
      widget.setSelectedData(result);
    });
  }

  // void selectFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();

  //   if (result != null) {
  //     File file = File(result.files.single.path);
  //   } else {
  //     // User canceled the picker
  //   }
  // }

  Widget displayImage() {
    if (filePicked != null) {
      File file = File(filePicked.path);
      return Expanded(
        child: Image.file(
          file,
          // height: 100,
          // width: 100,
          fit: BoxFit.cover,
        ),
      );
      // return CircleAvatar(radius: 64, backgroundImage: MemoryImage(_image!));
    } else {
      return Container(
        width: 1,
        height: 1,
      );
    }
  }

  Widget displayNetworkImage() {
    // LOG_THE_DEBUG_DATA(messag: '${widget.networkImg}', type: 'e');
    if (widget.networkImg == null || widget.networkImg!.isEmpty) {
      return Container();
    } else {
      // return NetworkImage(widget?.networkImg);
      return Image.network(
        '${AppConstants.fileUrl}${widget.networkImg}',
        width: 150,
        height: 150,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.hasLabel
              ? CustomTextUtil(
                  text1: widget.label,
                  hasAnotherText: false,
                  fontWeight1: FontWeight.w700,
                  textAlign: TextAlign.left,
                )
              : Container(),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomBtnUtil(
                btnTitle: "Pick Image",
                btnColor: AppColors.primary,
                // radius: ,
                // onClicked: widget.enable ? pickAFile : null,
                onClicked: widget.enable ? selectImage : null,
              ),
              const SizedBox(
                width: 20,
              ),
              displayImage(),
            ],
          )
        ],
      ),
    );
  }
}
