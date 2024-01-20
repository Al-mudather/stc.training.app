import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stc_training/features/home/components/marketing_card_component.dart';
import 'package:stc_training/helper/app_colors.dart';

class MarketingSection extends HookWidget {
  const MarketingSection({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    // PageController pageController = PageController(viewportFraction: 0.9);
    PageController pageController = usePageController(viewportFraction: 0.9);
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    var _currentPageValue = useState(0.0);
    double _scaleFactor = 0.8;
    double sectionHeight = 180;
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    // Listen to the change of the pages
    pageController
        .addListener(() => _currentPageValue.value = pageController.page!);
    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    return Column(
      children: [
        SizedBox(
          height: sectionHeight, // Controll the card height
          child: PageView.builder(
            controller: pageController,
            itemCount: 3,
            itemBuilder: (context, index) {
              return _buildPageItem(
                index: index,
                sectionHeight: sectionHeight,
                currentPageValue: _currentPageValue.value,
                scaleFactor: _scaleFactor,
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          children: List.generate(
            3,
            (indexDots) => AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: _currentPageValue.value.toInt() == indexDots ? 25 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _currentPageValue.value.toInt() == indexDots
                    ? AppColors.primary
                    : AppColors.primary.withOpacity(0.29),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem({
    required int index,
    required double sectionHeight,
    required double currentPageValue,
    required double scaleFactor,
  }) {
    Matrix4 matrix = Matrix4.identity();
    double _height = sectionHeight;

    if (index == currentPageValue.floor()) {
      var currentScall = 1 - (currentPageValue - index) * (1 - scaleFactor);
      var currentTrans = _height * (1 - currentScall) / 2;
      matrix = Matrix4.diagonal3Values(1, double.parse('$currentScall'), 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == currentPageValue.floor() + 1) {
      var currentScall =
          scaleFactor + (currentPageValue - index + 1) * (1 - scaleFactor);
      var currentTrans = _height * (1 - currentScall) / 2;

      matrix = Matrix4.diagonal3Values(1, currentScall, 1);
      matrix = Matrix4.diagonal3Values(1, currentScall, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == currentPageValue.floor() - 1) {
      var currentScall = 1 - (currentPageValue - index) * (1 - scaleFactor);

      var currentTrans = _height * (1 - currentScall) / 2;

      matrix = Matrix4.diagonal3Values(1, double.parse('$currentScall'), 1);
      matrix = Matrix4.diagonal3Values(1, double.parse('$currentScall'), 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScall = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScall, 1)
        ..setTranslationRaw(1, _height * (1 - scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Container(
        height: sectionHeight,
        margin: const EdgeInsets.only(
          right: 10,
          left: 5,
          top: 5,
          bottom: 2,
        ),
        child: const MarketingCardComponent(),
      ),
    );
  }
}
