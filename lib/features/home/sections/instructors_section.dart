import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stc_training/features/home/components/instructor_card_component.dart';

import 'package:stc_training/features/instructor/hooks/get_all_instructors_hook.dart';
import 'package:stc_training/features/instructor/components/instructor_loading_card_comp.dart';
import 'package:stc_training/features/instructor/models/instructor_models.dart';
import 'package:stc_training/utils/horizontal_loading_data_util.dart';
import 'package:stc_training/utils/section_title_util.dart';

class InstructorsSection extends HookWidget {
  const InstructorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////

    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    Map<String, dynamic> data;
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    data = UseGet_all_instructors_query_hook(context: context);

    return data['loading']
        ? HorizontalLoadingDataUtil(
            child: InstructorLoadingCardComp(),
          )
        : Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SectionTitleUtil(
                    firstText: "Best",
                    secondText: "Instructors",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      // allinstructors?.length ?? 0,
                      data['data'].instructors.length,
                      (index) {
                        InstructorModel instructor =
                            data['data'].instructors![index];
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InstructorCardComponent(
                            instructor: instructor,
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
