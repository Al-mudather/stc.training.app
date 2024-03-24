import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stc_training/features/course/models/course_unit_content_model.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/helper/directory_path.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';
import 'package:path/path.dart' as Path;
import 'package:dio/dio.dart';

import 'package:open_file/open_file.dart';

class ClassFileItemContentComp extends StatefulWidget {
  const ClassFileItemContentComp({super.key, required this.content});

  final CourseUnitContentModel? content;

  @override
  State<ClassFileItemContentComp> createState() =>
      _ClassFileItemContentCompState();
}

class _ClassFileItemContentCompState extends State<ClassFileItemContentComp> {
  bool downloading = false;
  bool fileExists = false;
  double progress = 0;
  String fileName = "";
  String netWorkFilePath = "";
  late String filePath;
  late String fileUrl;
  late CancelToken cancelToken;
  var getPathFile = DirectoryPath();

  cancelDownloading() async {
    cancelToken.cancel();
    setState(() {
      downloading = false;
    });
  }

  startDownload() async {
    cancelToken = CancelToken();
    var storagePath = await DirectoryPath().getTemporaryPath();
    filePath = '$storagePath/$fileName ';
    try {
      setState(() {
        downloading = true;
      });
      await Dio().download(
        fileUrl,
        filePath,
        onReceiveProgress: (count, total) {
          setState(() {
            progress = (count / total);
          });
        },
        cancelToken: cancelToken,
      );
      setState(() {
        downloading = false;
        fileExists = true;
      });
    } catch (e) {
      setState(() {
        downloading = false;
      });
      LOG_THE_DEBUG_DATA(messag: e, type: 'e');
    }
  }

  checkFileExist() async {
    var storagePath = await DirectoryPath().getTemporaryPath();
    filePath = '$storagePath/$fileName ';
    //Todo: Check to see if the file exists
    bool fileExistCheck = await File(filePath).exists();
    setState(() {
      fileExists = fileExistCheck;
    });
  }

  openFile() async {
    try {
      var storagePath = await DirectoryPath().getTemporaryPath();
      filePath = '$storagePath/$fileName ';
      OpenFile.open(filePath);
    } catch (e) {
      LOG_THE_DEBUG_DATA(messag: e, type: 'e');
    }
  }

  @override
  void initState() {
    super.initState();
    var contentData = jsonDecode('${widget.content!.modelValue}');
    setState(() {
      netWorkFilePath = contentData['attachment'];
      fileUrl = "${AppConstants.DownloadUrl}$netWorkFilePath";
      fileName = Path.basename(fileUrl);
      // LOG_THE_DEBUG_DATA(messag: 'fileName: $fileName');
    });
    //Todo: Check if the file exists
    checkFileExist();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Download the file to the user
        // Extract_the_video_data(content: content);
        // LOG_THE_DEBUG_DATA(messag: content);
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top:
                BorderSide(color: AppColors.brown.withOpacity(0.5), width: 0.5),
          ),
        ),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.file_copy,
                color: AppColors.secondary,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: CustomTextUtil(
                  text1: "${fileName}",
                  fontSize1: 14,
                  fontWeight1: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              CustomBtnUtil(
                btnTitle: "",
                btnType: BtnTypes.filledIcon,
                // isLoading: isLoading,
                onClicked: () async {
                  //Todo: Start download
                  fileExists && downloading == false
                      ? openFile()
                      : startDownload();

                  // var storagPath = await DirectoryPath().getTemporaryPath();
                  // var filePath = '${storagPath / fileName}';
                  //Todo: Check to see if the file exists
                  // bool fileExistCheck = await File(filePath).exists();

                  // LOG_THE_DEBUG_DATA(messag: 'path: $path');
                  //You can download a single file

                  // getExternalStorageDirectory: /storage/emulated/0/Android/data/com.training.stc.stc_training/files
                  // getTemporaryDirectory: /data/user/0/com.training.stc.stc_training/cache

                  // /storage/emulated/0/Download/Nucleic_Acid_Structure_and_Organization-1.pptx

                  // FileDownloader.downloadFile(
                  //   url: url,
                  //   name: "$fileName", //(optional)
                  //   onProgress: (fileName, progress) {
                  //     print('FILE fileName HAS PROGRESS $progress');
                  //   },
                  //   onDownloadCompleted: (String path) {
                  //     print('FILE DOWNLOADED TO PATH: $path');
                  //   },
                  //   onDownloadError: (String error) {
                  //     print('DOWNLOAD ERROR: $error');
                  //   },
                  // );

                  // String fileName = '$netWorkFilePath'.split('/').last;
                  // String path = (await getTemporaryDirectory()).path;
                  // String filePath = '$path/$fileName';

                  // bool fileExists = await File(filePath).exists();
                  // // // 1 ) Get the pdf from the server
                  // if (fileExists) {
                  //   Get.toNamed(
                  //     Routehelper.goToPdfScreenPage(
                  //       path: filePath,
                  //     ),
                  //   );
                  // } else {
                  //   // Start the loader
                  //   setState(() => isLoading = true);
                  //   // Get the file from the server
                  //   File file = await _fetchPDF(
                  //     url: '${AppConstants.FileUrl}$netWorkFilePath',
                  //     fileName: fileName,
                  //   );
                  //   LOG_THE_DEBUG_DATA(messag: file);
                  //   // Stop the loader
                  //   setState(() => isLoading = false);
                  //   // Go to pdf screen
                  //   Get.toNamed(
                  //     Routehelper.goToPdfScreenPage(
                  //       path: file.path,
                  //     ),
                  //   );
                  // }
                },
                icon: fileExists
                    ? Icon(
                        Icons.save,
                        color: AppColors.successDark,
                      )
                    : downloading
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              CircularProgressIndicator(
                                value: progress,
                                strokeWidth: 3,
                                backgroundColor: Colors.grey,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    AppColors.brown),
                              ),
                              Text(
                                "${(progress * 100).toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        : Icon(
                            Icons.file_download,
                            color: AppColors.primary,
                          ),
                // icon: fileExists && downloading == false
                //     ? Icon(
                //         Icons.save,
                //         color: AppColors.successDark,
                //       )
                //     : Icon(
                //         Icons.file_download,
                //         color: AppColors.primary,
                //       ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
