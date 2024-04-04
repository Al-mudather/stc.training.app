import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/course/models/course_unit_content_model.dart';
import 'package:stc_training/features/video_player/popUpVideoPlayerPage.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/helper/directory_path.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/routes/route_helper.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';
import 'package:path/path.dart' as Path;
import 'package:dio/dio.dart';

import 'package:open_file/open_file.dart';

import 'package:flutter_download_manager/flutter_download_manager.dart';

import 'package:flutter_downloader/flutter_downloader.dart';

class ClassChapterItemContentComp extends StatefulWidget {
  const ClassChapterItemContentComp({super.key, required this.content});

  final CourseUnitContentModel? content;

  @override
  State<ClassChapterItemContentComp> createState() =>
      _ClassChapterItemContentCompState();
}

class _ClassChapterItemContentCompState
    extends State<ClassChapterItemContentComp> {
  bool downloading = false;
  bool fileExists = false;
  double progress = 0;
  String fileName = "";
  String netWorkFilePath = "";
  late String filePath;
  late String fileUrl;
  late CancelToken cancelToken;

  late String videoUuid;
  var getPathFile = DirectoryPath();

  @override
  void initState() {
    super.initState();
    var contentData = jsonDecode('${widget.content?.modelValue}');
    var metaData = contentData['video_metadata'];
    // LOG_THE_DEBUG_DATA(messag: contentData);
    setState(() {
      videoUuid = metaData['videoData']['videoUuid'];
      // netWorkFilePath = contentData['attachment'];
      fileUrl =
          "https://video.cdn1.stc.training/stream/hls/${videoUuid}/playlist.m3u8";
      // fileName = Path.basename(fileUrl);
      fileName = videoUuid;
      // LOG_THE_DEBUG_DATA(messag: 'fileName: $fileName');
    });
    //Todo: Check if the file exists
    checkFileExist();
  }

  cancelDownloading() async {
    cancelToken.cancel();
    setState(() {
      downloading = false;
    });
  }

  CREATE_video_file_directory() async {
    //Todo: Get the dircetory path
    String appDocPath =
        await DirectoryPath().getApplicationDocumentsStoragePath();
    //Todo: Create the directory name
    String dirPath = "$appDocPath/video/$videoUuid";

    //Todo: Ckeck to see if the directory exists
    final directory = Directory(dirPath);
    bool directoryExists = await directory.exists();
    if (!directoryExists) {
      //Todo: If the directory does not exists, create a new one
      await Directory(dirPath).create(recursive: true);
      // LOG_THE_DEBUG_DATA(messag: myDir.path, type: 'i');
    }
  }

  CREATE_video_key_file_directory() async {
    //Todo: Get the dircetory path
    String appDocPath =
        await DirectoryPath().getApplicationDocumentsStoragePath();
    //Todo: Create the directory name
    String dirPath = "$appDocPath/keys/$videoUuid";

    //Todo: Ckeck to see if the directory exists
    final directory = Directory(dirPath);
    bool directoryExists = await directory.exists();
    if (!directoryExists) {
      //Todo: If the directory does not exists, create a new one
      await Directory(dirPath).create(recursive: true);
      // LOG_THE_DEBUG_DATA(messag: myDir.path, type: 'i');
    }
  }

  WRITE_the_video_file_to_the_directory() async {
    //Todo: Get the dircetory path
    String appDocPath =
        await DirectoryPath().getApplicationDocumentsStoragePath();
    //Todo: Create the directory name
    String dirPath = "$appDocPath/video/$videoUuid/playlist.m3u8";

    //Todo: If the directory does not exists, create a new one
    File file = await File(dirPath);
    String data = """#EXTM3U
#EXT-X-VERSION:3
#EXT-X-STREAM-INF:BANDWIDTH=614552,RESOLUTION=854x480,NAME="480"
playlist_480p.m3u8
""";
    await file.writeAsString(data);
  }

  DOWNLOAD_the_video_file() async {
    //Todo: Get the dircetory path
    String appDocPath =
        await DirectoryPath().getApplicationDocumentsStoragePath();
    //Todo: Create the directory name
    // String dirPath = "$appDocPath/video/$videoUuid/playlist_720p.m3u8";
    String dirPath = "$appDocPath/video/$videoUuid/playlist_480p.m3u8";
    //Todo: Get the cancle token
    cancelToken = CancelToken();

    try {
      setState(() {
        downloading = true;
      });
      await Dio().download(
        // 'https://video.cdn1.stc.training/stream/hls/${videoUuid}/playlist_720p.m3u8',
        'https://video.cdn1.stc.training/stream/hls/${videoUuid}/playlist_480p.m3u8',
        dirPath,
        onReceiveProgress: (count, total) {
          // setState(() {
          //   progress = (count / total);
          // });
        },
        // cancelToken: cancelToken,
      );
      // setState(() {
      //   downloading = false;
      //   fileExists = true;
      // });
    } catch (e) {
      setState(() {
        downloading = false;
      });
      LOG_THE_DEBUG_DATA(messag: e, type: 'e');
    }
  }

  READ_the_video_file() async {
    //Todo: Get the dircetory path
    String appDocPath =
        await DirectoryPath().getApplicationDocumentsStoragePath();
    //Todo: Create the directory name
    // LOG_THE_DEBUG_DATA(messag: 'appDocPath: $appDocPath');
    // String dirPath = "$appDocPath/video/$videoUuid/playlist_720p.m3u8";
    String dirPath = "$appDocPath/video/$videoUuid/playlist_480p.m3u8";
    File file = await File(dirPath);
    var file_720p = await file.readAsString();
    return file_720p;
  }

  DOWNLOAD_the_video_segments({required List<String> segmentsUrl}) async {
    //Todo: Get the dircetory path
    String appDocPath =
        await DirectoryPath().getApplicationDocumentsStoragePath();
    String dirPath = "$appDocPath/video/$videoUuid/";

    // DownloadManager manager = DownloadManager();
    // // manager.getAllDownloads();

    // manager.addBatchDownloads(segmentsUrl, dirPath);

    // ValueNotifier<double> downloadProgress =
    //     manager.getBatchDownloadProgress(segmentsUrl);

    setState(() {
      downloading = true;
      fileExists = false;
    });

    int count = 0;
    for (var url in segmentsUrl) {
      String fileName = Path.basename(url);

      await Dio().download(
        url,
        dirPath + fileName,
        onReceiveProgress: (count, total) {},
        cancelToken: cancelToken,
      );
      count += 1;
      setState(() {
        progress = (count / segmentsUrl.length);
      });

      // final taskId = await FlutterDownloader.enqueue(
      //   url: url,
      //   savedDir: dirPath,
      //   showNotification: true,
      //   openFileFromNotification: true,
      // );
      // FlutterDownloader.registerCallback((id, status, progress) {
      //   // Use this callback to update the UI or state with the download progress
      //   LOG_THE_DEBUG_DATA(
      //       messag:
      //           'Download task ($id) is in status ($status) and progress ($progress)',
      //       type: 'e');
      // });
    }

    setState(() {
      downloading = false;
      fileExists = true;
    });
  }

  DELETE_video_files_folder() async {
    //Todo: Get the dircetory path
    String appDocPath =
        await DirectoryPath().getApplicationDocumentsStoragePath();
    String dirPath = "$appDocPath/video/$videoUuid/";
    final dir = Directory(dirPath);
    if (dir.existsSync()) {
      try {
        dir.deleteSync(recursive: true);
        setState(() {
          fileExists = false;
        });
      } catch (e) {
        LOG_THE_DEBUG_DATA(messag: e, type: 'e');
      }
    }
  }

  startDownload() async {
    //TODO: 1) make a directory with video id
    await CREATE_video_file_directory();
    //TODO: 2) make a directory with key id
    await CREATE_video_key_file_directory();
    //TODO: 3) Save the video file
    await WRITE_the_video_file_to_the_directory();
    //TODO: 4) Download the video file
    await DOWNLOAD_the_video_file();
    //TODO: 5) Read the video file
    var file_720p = await READ_the_video_file();
    RegExp regExp = RegExp(r'\w*\d*.ts');
    // var segments = file_720p.match(//g);
    // Use RegExp to find matches
    Iterable<RegExpMatch> matches = regExp.allMatches(file_720p);

    List<String> segments = matches.map((match) => match.group(0)!).toList();

    List<String> segmentsUrls = segments
        .map((name) =>
            'https://video.cdn1.stc.training/stream/hls/${videoUuid}/${name}')
        .toList();

    //Todo: Download all the video fiels
    DOWNLOAD_the_video_segments(segmentsUrl: segmentsUrls);
  }

  Future<bool> IS_the_video_offline_exists() async {
    //Todo: Get the dircetory path
    String appDocPath =
        await DirectoryPath().getApplicationDocumentsStoragePath();
    //Todo: Create the directory name
    String dirPath = "$appDocPath/keys/$videoUuid";

    //Todo: Ckeck to see if the directory exists
    final directory = Directory(dirPath);
    bool directoryExists = await directory.exists();
    return directoryExists;
  }

  checkFileExist() async {
    //Todo: Get the dircetory path
    String appDocPath =
        await DirectoryPath().getApplicationDocumentsStoragePath();
    //Todo: Create the directory name
    String dirPath = "$appDocPath/video/$videoUuid/";

    //Todo: Ckeck to see if the directory exists
    final directory = Directory(dirPath);
    bool directoryExists = await directory.exists();

    //ToDo: Check also if all files are been downloaded

    setState(() {
      fileExists = directoryExists;
    });
  }

  PLAY_the_offline_video() async {
    try {
      String appDocPath =
          await DirectoryPath().getApplicationDocumentsStoragePath();
      String dirPath = "$appDocPath/video/$videoUuid/playlist.m3u8";

      Get.toNamed(
          Routehelper.GoToOfflineVideoPlayerPage(localVideoPath: dirPath));
    } catch (e) {
      LOG_THE_DEBUG_DATA(messag: e, type: 'e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Extract the video data and send it to the video player
        fileExists ? PLAY_the_offline_video() : Extract_the_video_data();
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
              SvgPicture.asset('assets/svgs/opened_lock.svg'),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: CustomTextUtil(
                  text1: "${widget.content?.title ?? ''}",
                  fontSize1: 14,
                  fontWeight1: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              CustomBtnUtil(
                btnTitle: "",
                btnType: BtnTypes.filledIcon,
                onClicked: () async {
                  fileExists ? PLAY_the_offline_video() : startDownload();
                },
                icon: fileExists
                    ? Icon(
                        Icons.play_arrow,
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
                                  AppColors.primary,
                                ),
                              ),
                              Text(
                                "${(progress * 100).toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          )
                        : Icon(
                            Icons.file_download,
                            color: AppColors.primary,
                          ),
              ),
              fileExists
                  ? CustomBtnUtil(
                      btnTitle: '',
                      btnType: BtnTypes.filledIcon,
                      icon: Icon(
                        Icons.delete_forever,
                        color: AppColors.errorDark,
                      ),
                      // onClicked: () => DELETE_video_files_folder(),
                      onClicked: () {
                        Get.defaultDialog(
                          title: "Do You Realy Want to delete this video?",
                          barrierDismissible: false,
                          content: Container(),
                          textConfirm: "Yes",
                          textCancel: "No",
                          confirmTextColor: Colors.white,
                          buttonColor: AppColors.errorDark,
                          onCancel: () => {},
                          onConfirm: () async {
                            DELETE_video_files_folder();
                            Get.back();
                          },
                        );
                      },
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );

    // return GestureDetector(
    //   onTap: () {
    //     //Download the file to the user
    //     // Extract_the_video_data(content: content);
    //     // LOG_THE_DEBUG_DATA(messag: content);
    //   },
    //   child: Container(
    //     padding: const EdgeInsets.only(
    //       left: 16,
    //       right: 16,
    //       top: 16,
    //       bottom: 8,
    //     ),
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       border: Border(
    //         top:
    //             BorderSide(color: AppColors.brown.withOpacity(0.5), width: 0.5),
    //       ),
    //     ),
    //     child: Container(
    //       child: Row(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Icon(
    //             Icons.file_copy,
    //             color: AppColors.secondary,
    //           ),
    //           const SizedBox(
    //             width: 5,
    //           ),
    //           Expanded(
    //             child: CustomTextUtil(
    //               text1: "${fileName}",
    //               fontSize1: 14,
    //               fontWeight1: FontWeight.w500,
    //             ),
    //           ),
    //           const SizedBox(
    //             width: 20,
    //           ),
    //           CustomBtnUtil(
    //             btnTitle: "",
    //             btnType: BtnTypes.filledIcon,
    //             // isLoading: isLoading,
    //             onClicked: () async {
    //               //Todo: Start download
    //               fileExists && downloading == false
    //                   ? openFile()
    //                   : startDownload();

    //               // var storagPath = await DirectoryPath().getTemporaryPath();
    //               // var filePath = '${storagPath / fileName}';
    //               //Todo: Check to see if the file exists
    //               // bool fileExistCheck = await File(filePath).exists();

    //               // LOG_THE_DEBUG_DATA(messag: 'path: $path');
    //               //You can download a single file

    //               // getExternalStorageDirectory: /storage/emulated/0/Android/data/com.training.stc.stc_training/files
    //               // getTemporaryDirectory: /data/user/0/com.training.stc.stc_training/cache

    //               // /storage/emulated/0/Download/Nucleic_Acid_Structure_and_Organization-1.pptx

    //               // FileDownloader.downloadFile(
    //               //   url: url,
    //               //   name: "$fileName", //(optional)
    //               //   onProgress: (fileName, progress) {
    //               //     print('FILE fileName HAS PROGRESS $progress');
    //               //   },
    //               //   onDownloadCompleted: (String path) {
    //               //     print('FILE DOWNLOADED TO PATH: $path');
    //               //   },
    //               //   onDownloadError: (String error) {
    //               //     print('DOWNLOAD ERROR: $error');
    //               //   },
    //               // );

    //               // String fileName = '$netWorkFilePath'.split('/').last;
    //               // String path = (await getTemporaryDirectory()).path;
    //               // String filePath = '$path/$fileName';

    //               // bool fileExists = await File(filePath).exists();
    //               // // // 1 ) Get the pdf from the server
    //               // if (fileExists) {
    //               //   Get.toNamed(
    //               //     Routehelper.goToPdfScreenPage(
    //               //       path: filePath,
    //               //     ),
    //               //   );
    //               // } else {
    //               //   // Start the loader
    //               //   setState(() => isLoading = true);
    //               //   // Get the file from the server
    //               //   File file = await _fetchPDF(
    //               //     url: '${AppConstants.FileUrl}$netWorkFilePath',
    //               //     fileName: fileName,
    //               //   );
    //               //   LOG_THE_DEBUG_DATA(messag: file);
    //               //   // Stop the loader
    //               //   setState(() => isLoading = false);
    //               //   // Go to pdf screen
    //               //   Get.toNamed(
    //               //     Routehelper.goToPdfScreenPage(
    //               //       path: file.path,
    //               //     ),
    //               //   );
    //               // }
    //             },
    //             icon: fileExists
    //                 ? Icon(
    //                     Icons.save,
    //                     color: AppColors.successDark,
    //                   )
    //                 : downloading
    //                     ? Stack(
    //                         alignment: Alignment.center,
    //                         children: [
    //                           CircularProgressIndicator(
    //                             value: progress,
    //                             strokeWidth: 3,
    //                             backgroundColor: Colors.grey,
    //                             valueColor: const AlwaysStoppedAnimation<Color>(
    //                                 AppColors.brown),
    //                           ),
    //                           Text(
    //                             "${(progress * 100).toStringAsFixed(2)}",
    //                             style: TextStyle(
    //                               fontSize: 12,
    //                             ),
    //                           ),
    //                         ],
    //                       )
    //                     : Icon(
    //                         Icons.file_download,
    //                         color: AppColors.primary,
    //                       ),
    //             // icon: fileExists && downloading == false
    //             //     ? Icon(
    //             //         Icons.save,
    //             //         color: AppColors.successDark,
    //             //       )
    //             //     : Icon(
    //             //         Icons.file_download,
    //             //         color: AppColors.primary,
    //             //       ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  void Extract_the_video_data() {
    //TODO: Go to the video player page
    //Todo: Start the loading
    try {
      String? cipherIfram = widget.content?.cipherIframe;
      var cipherOtp, playbackInfo;
      if (cipherIfram != null && cipherIfram.isNotEmpty) {
        var otp = cipherIfram.split('otp=')[1].split('&');
        cipherOtp = otp.first;
        var info = cipherIfram.split('playbackInfo=')[1].split('"');
        playbackInfo = info.first;
      }

      var contentData = jsonDecode('${widget.content?.modelValue}');
      var video_type = contentData["video_type"];
      var metaData = contentData['video_metadata'];
      var video = contentData['video'];

      var videoUuid;
      if (video_type == 'TYPE_HASIF') {
        videoUuid = metaData['videoData']['videoUuid'];
      }

      // classRoomCtl.SET_video_palyer_info_data(
      //   loading: false,
      //   videoName: '${content!.title}',
      //   videoType: video_type,
      //   cipherOtp: cipherOtp,
      //   cipherPlayBackInfo: playbackInfo,
      //   alhasifVideoUuid: videoUuid,
      // );

      if (video != null && video.toString().isNotEmpty) {
        SEND_a_message_to_the_user(
          message:
              "Video is not supported on the phone, please watch it on the web version.",
          messageLable: "Error",
          backgroundColor: AppColors.errorLight,
        );
      } else {
        Get.toNamed(
          Routehelper.GoToClassRoomVideoPlayerPage(
            videoTitle: '${widget.content?.title}',
            unitContent: jsonEncode({
              'video_type': video_type,
              'cipherOtp': cipherOtp,
              'playbackInfo': playbackInfo,
              'videoUuid': videoUuid,
            }),
          ),
        );
      }
    } catch (e) {
      LOG_THE_DEBUG_DATA(messag: e, type: 'e');
    }
  }
}
