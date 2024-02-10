import 'package:flutter/material.dart';
import 'package:stc_training/helper/app_constants.dart';

class HorizontalLoadingDataUtil extends StatelessWidget {
  HorizontalLoadingDataUtil({super.key, required this.child});
  Widget child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          5,
          (index) => Container(
            margin: EdgeInsets.all(AppConstants.space_8),
            child: child,
          ),
        ),
      ),
    );
    ;
  }
}
