import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/utils/big_text.dart';
import 'package:stc_training/utils/custom_text.dart';

class SearchSection extends HookWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    var searchController = TextEditingController();
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF5F5F5),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            // blurRadius: 0.1,
            spreadRadius: 0.1,
            offset: Offset(0, 0.1),
          ),
        ],
      ),
      child: TextField(
        controller: searchController,
        onTap: () {
          //TODO: Make the search
          //TODO: if there is a result show them
          _SHOW_result_in_bottomSheet(context);
        },
        decoration: InputDecoration(
          hintText: "What are you loking for ?",
          hintStyle: const TextStyle(
            color: Color(0xFF989898),
          ),
          suffixIcon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: const Icon(
              Icons.search,
              size: 30,
              color: AppColors.secondary,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  dynamic _SHOW_result_in_bottomSheet(context) {
    showModalBottomSheet(
      // isScrollControlled: true,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          builder: (_, controller) => ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(35)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                padding: const EdgeInsets.only(right: 20, left: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.7),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                ),
                child: ListView(
                  controller: controller,
                  children: [
                    // The shape
                    FractionallySizedBox(
                      widthFactor: 0.25,
                      child: Container(
                        height: 6,
                        // width: 20,
                        margin: const EdgeInsets.only(top: 24),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadiusDirectional.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // The data
                    // for (var i = 0; i < 20; i++) _searchCard(),
                    Wrap(
                      children: List.generate(20, (index) => _searchCard()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Container _searchCard() {
    return Container(
      width: 345,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primaryDark,
              child: SvgPicture.asset("assets/svgs/glass-search.svg"),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: BigText(
                text: "MRCOG part1 and local OBS and GYNE course",
                color: const Color(0xFF707070),
                size: 20,
                maxLines: 2,
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }
}
