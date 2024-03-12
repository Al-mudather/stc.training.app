import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_colors.dart';

class SearchTextFieldUtil extends StatelessWidget {
  const SearchTextFieldUtil({
    super.key,
    this.onClicked,
    this.hideSearchIcon = false,
    required this.controller,
  });

  final VoidCallback? onClicked;
  final TextEditingController controller;
  final bool hideSearchIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF5F5F5),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 0.1,
            spreadRadius: 0.1,
            offset: Offset(0, 0.1),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        // onChanged: (value) {
        //   Make_the_search();
        // },
        onEditingComplete: onClicked,
        // onSubmitted: (value) {
        //   Make_the_search();
        // },
        decoration: InputDecoration(
          hintText: "What are you looking for ?",
          hintStyle: const TextStyle(
            color: Color(0xFF989898),
          ),
          suffixIcon: hideSearchIcon == true
              ? Container(
                  width: 0.1,
                )
              : InkWell(
                  onTap: onClicked,
                  child: Container(
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
                ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
