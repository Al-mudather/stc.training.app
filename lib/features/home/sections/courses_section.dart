import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stc_training/features/course/components/course_loading_card_comp.dart';
import 'package:stc_training/features/course/hooks/get_all_courses_hook.dart';
import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/features/home/components/course_card_component.dart';
import 'package:stc_training/features/instructor/components/instructor_loading_card_comp.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/horizontal_loading_data_util.dart';
import 'package:stc_training/utils/section_title_util.dart';

class CoursesSection extends HookWidget {
  const CoursesSection({super.key});

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
    data = UseGet_all_courses_query_hook(context: context);

    return data['loading']
        ? HorizontalLoadingDataUtil(
            child: CourseLoadingCardComp(),
          )
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SectionTitleUtil(
                  firstText: "Available",
                  secondText: "Courses",
                  hasLink: true,
                  linkTitle: "All Courses",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        data['data'].courses.length,
                        (index) {
                          CourseModel course = data['data'].courses![index];
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CourseCardComponent(
                              course: course,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          );

    // return HorizontalLoadingDataUtil(
    //   child: CourseLoadingCardComp(),
    // );
    // return Column(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 24),
    //       child: SectionTitleUtil(
    //         firstText: "Available",
    //         secondText: "Courses",
    //         hasLink: true,
    //         linkTitle: "All Courses",
    //       ),
    //     ),
    //     const SizedBox(
    //       height: 10,
    //     ),
    //     SizedBox(
    //       height: 250,
    //       child: ListView(
    //         scrollDirection: Axis.horizontal,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: List.generate(
    //               3,
    //               (index) {
    //                 return const Padding(
    //                   padding: EdgeInsets.all(8.0),
    //                   child: CourseCardComponent(),
    //                 );
    //               },
    //             ),
    //           ),
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }
}
