import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stc_training/features/category/components/category_card_comp.dart';
import 'package:stc_training/features/category/components/category_loading_page_comp.dart';
import 'package:stc_training/features/category/hooks/get_all_categories_hook.dart';
import 'package:stc_training/features/category/models/category_models.dart';
import 'package:stc_training/helper/app_constants.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////

    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    Map<String, dynamic> result;

    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    result = UseGet_all_categories_query_hook(
      context: context,
    );
    //? Get the course data
    AllCategoriesModel? courseCategories = result['data'];
    return SingleChildScrollView(
      // child: CategoryLoadingPageComp(),
      child: result['loading']
          ? CategoryLoadingPageComp()
          : _CATEGORIES_data(
              courseCategories: courseCategories,
            ),
    );
  }

  Container _CATEGORIES_data({AllCategoriesModel? courseCategories}) {
    var categories = courseCategories!.categories;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.horizentalPadding,
        vertical: AppConstants.verticalPadding,
      ),
      child: Wrap(
        runSpacing: AppConstants.height_20,
        spacing: AppConstants.height_20,
        children: List.generate(
          categories.length ?? 0,
          (index) => CategoryCardComp(category: categories[index]),
        ),
      ),
    );
  }
}
