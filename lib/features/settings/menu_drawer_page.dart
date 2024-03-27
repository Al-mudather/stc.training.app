import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stc_training/features/authentication/controller/auth_controller.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/routes/route_helper.dart';
import 'package:stc_training/utils/custom_text_util.dart';

class MenuDrawerPage extends StatelessWidget {
  const MenuDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      // appBar: AppBar(
      //   leading: Icon(Icons.menu_open),
      //   elevation: 0,
      //   backgroundColor: AppColors.primary,
      // ),
      body: Container(
        margin: EdgeInsets.only(
          top: AppConstants.height_50,
        ),
        padding: EdgeInsets.only(
          left: 14,
          right: 14,
        ),
        child: Stack(
          children: [
            GetBuilder<AuthController>(builder: (innerAuthCtl) {
              // LOG_THE_DEBUG_DATA(messag: innerAuthCtl.user, type: 'd');
              return ListView(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // CustomTextUtil(
                  //   text1: "Dr.sabri sad altyb sad \n",
                  //   fontSize1: 15,
                  //   textColor: Colors.white,
                  //   fontWeight1: FontWeight.w500,
                  //   hasAnotherText: true,
                  //   text2: "almudatheryhaya.one@gmail.com",
                  //   textAlign: TextAlign.center,
                  //   text2Color: AppColors.secondary,
                  //   fontWeight2: FontWeight.w500,
                  // ),
                  const SizedBox(
                    height: AppConstants.height_30,
                  ),
                  menuItem(
                    itemTitle: "Menu",
                    iconData: Icons.home,
                    onClicked: () {},
                  ),
                  menuItem(
                    itemTitle: "All Courses",
                    iconData: Icons.video_collection,
                    onClicked: () {
                      Get.toNamed(Routehelper.GoToAllCoursesPage());
                    },
                  ),
                  menuItem(
                    itemTitle: "My Orders",
                    iconData: Icons.watch_later_outlined,
                    onClicked: () {},
                  ),
                  menuItem(
                    itemTitle: "My Courses",
                    iconData: Icons.video_collection,
                    onClicked: () =>
                        Get.toNamed(Routehelper.GoToMyCoursesPage()),
                  ),
                  menuItem(
                    itemTitle: "My marketing Page",
                    iconData: Icons.pages,
                    onClicked: () => Get.toNamed(
                      Routehelper.GoToMyMarketingPage(),
                    ),
                  ),
                  menuItem(
                    itemTitle: "Profile",
                    iconData: Icons.person,
                    onClicked: () {},
                  ),
                  menuItem(
                    itemTitle: "Settings",
                    iconData: Icons.settings,
                    onClicked: () {},
                  ),
                  innerAuthCtl.token.isNotEmpty
                      ? menuItem(
                          itemTitle: "Log Out",
                          iconData: Icons.logout,
                          onClicked: () {
                            //TODO: Implement the log out functinality
                            // Get.toNamed(
                            //   Routehelper.GoToAuthLoginPage(),
                            // );
                          },
                        )
                      : menuItem(
                          itemTitle: "Login",
                          iconData: Icons.login,
                          onClicked: () => Get.toNamed(
                            Routehelper.GoToAuthLoginPage(),
                          ),
                        ),
                  // Spacer(),
                ],
              );
            }),
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                "assets/svgs/marketing_image.svg",
                height: 150,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container menuItem({
    required itemTitle,
    required iconData,
    required onClicked,
  }) {
    return Container(
      margin: EdgeInsets.only(
        top: AppConstants.height_30 / 2,
      ),
      child: ListTile(
        onTap: onClicked,
        // contentPadding: const EdgeInsets.all(0),
        visualDensity: VisualDensity.compact,
        title: CustomTextUtil(
          text1: itemTitle,
          fontSize1: 15,
          fontWeight1: FontWeight.w500,
          textColor: Colors.white,
        ),
        leading: Icon(
          iconData,
          color: Colors.white,
        ),
        selectedTileColor: Colors.black,
        dense: true,
      ),
    );
  }
}
