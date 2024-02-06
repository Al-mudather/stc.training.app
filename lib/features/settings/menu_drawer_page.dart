import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextUtil(
              text1: "Dr.sabri sad altyb sad \n",
              fontSize1: 15,
              textColor: Colors.white,
              fontWeight1: FontWeight.w500,
              hasAnotherText: true,
              text2: "almudatheryhaya.one@gmail.com",
              textAlign: TextAlign.center,
              text2Color: AppColors.secondary,
              fontWeight2: FontWeight.w500,
            ),
            const SizedBox(
              height: AppConstants.height_30,
            ),
            menuItem(
              itemTitle: "Menu",
              iconData: Icons.home,
              onClicked: () {},
            ),
            menuItem(
              itemTitle: "My Orders",
              iconData: Icons.watch_later_outlined,
              onClicked: () {},
            ),
            menuItem(
              itemTitle: "My Courses",
              iconData: Icons.video_collection,
              onClicked: () {},
            ),
            menuItem(
              itemTitle: "My marketing Page",
              iconData: Icons.pages,
              onClicked: () {},
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
            menuItem(
              itemTitle: "Log Out",
              iconData: Icons.logout,
              onClicked: () {},
            ),
            Spacer(),
            SvgPicture.asset(
              "assets/svgs/marketing_image.svg",
              height: 150,
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