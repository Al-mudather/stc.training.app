import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/features/course_details/course_details_page.dart';
import 'package:stc_training/features/home/home_page.dart';
import 'package:stc_training/helper/app_colors.dart';

class MainLayoutPage extends HookWidget {
  const MainLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////

    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    var _currentIndex = useState(0);
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset("assets/svgs/logo-small.svg"),
        centerTitle: true,
      ),
      body: const HomePage(),
      // body: const CourseDetailsPage(),
      bottomNavigationBar: Container(
        height: 75,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: _bottomNavigationBar(currentIndex: _currentIndex),
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar(
      {required ValueNotifier currentIndex}) {
    return BottomNavigationBar(
      onTap: (index) => {currentIndex.value = index},
      currentIndex: currentIndex.value,
      selectedItemColor: AppColors.secondary,
      unselectedItemColor: const Color(0xFF7B7E81),
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/svgs/home-icon.svg",
            color: currentIndex.value == 0
                ? AppColors.secondary
                : const Color(0xFF7B7E81),
            height: 24,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/svgs/shopping-cart.svg",
            color: currentIndex.value == 1
                ? AppColors.secondary
                : const Color(0xFF7B7E81),
            height: 24,
          ),
          label: "Cart",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: "Categories",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/svgs/my-courses-icon.svg",
            color: currentIndex.value == 3
                ? AppColors.secondary
                : const Color(0xFF7B7E81),
            height: 24,
          ),
          label: "My Courses",
        ),
      ],
    );
  }
}
