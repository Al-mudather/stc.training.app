import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/app_bar_util.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_textField_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';

enum Gender {
  NOTHING,
  MALE,
  FEMALE,
}

class ProfilePage extends HookWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    TextEditingController fullNameTextCtl = useTextEditingController();
    TextEditingController emailTextCtl = useTextEditingController();
    TextEditingController whatsAppNumberTextCtl = useTextEditingController();
    TextEditingController telegramNumberTextCtl = useTextEditingController();
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    var genderTypes = useState<Gender>(Gender.NOTHING);
    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBarUtil(
        barText: "Profile",
        // iconColor: Colors.white,
        iconFilled: Colors.transparent,
        // backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 30,
            bottom: 120,
          ),
          child: Column(
            children: [
              ////////////////////////////////////////////////
              /// Profil card
              ///////////////////////////////////////////////
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 143,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryLight,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -70,
                    left: 0,
                    right: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 104,
                          width: 104,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryLight,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white),
                            image: DecorationImage(
                              image: AssetImage("assets/images/boy-avatar.png"),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 0.5,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          // child: Image.asset("assets/images/boy-avatar.png",),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextUtil(
                          text1: "Dr.sabri sad abo gron",
                          fontSize1: 14,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              ////////////////////////////////////////////////
              /// Join the marketing network
              ///////////////////////////////////////////////
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 0.5,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextUtil(
                        text1: "Join our marketing network to gain aprofit.",
                        fontSize1: 14,
                        fontWeight1: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 35,
                      decoration: ShapeDecoration(
                        color: AppColors.secondary,
                        shape: CircleBorder(),
                        shadows: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: CustomBtnUtil(
                        btnTitle: "",
                        btnType: BtnTypes.icon,
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onClicked: () => {},
                      ),
                    ),
                  ],
                ),
              ),
              ////////////////////////////////////////////////
              /// Full Name
              ///////////////////////////////////////////////
              CustomTextFieldUtil(
                hasLabel: false,
                hintText: "Full Name",
                controller: fullNameTextCtl,
              ),
              ////////////////////////////////////////////////
              /// Email
              ///////////////////////////////////////////////
              CustomTextFieldUtil(
                hasLabel: false,
                hintText: "Email",
                controller: emailTextCtl,
              ),
              ////////////////////////////////////////////////
              /// Whats app number
              ///////////////////////////////////////////////
              CustomTextFieldUtil(
                hasLabel: false,
                hintText: "Whats app number",
                controller: whatsAppNumberTextCtl,
              ),
              ////////////////////////////////////////////////
              /// Telegram number
              ///////////////////////////////////////////////
              CustomTextFieldUtil(
                hasLabel: false,
                hintText: "Telegram number",
                controller: telegramNumberTextCtl,
              ),
              ////////////////////////////////////////////////
              /// Male Or Female
              ///////////////////////////////////////////////
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 0.5,
                            spreadRadius: 0.5,
                          ),
                        ],
                      ),
                      child: RadioListTile<Gender>(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(Gender.MALE.name.toLowerCase()),
                        tileColor: Colors.white,
                        value: Gender.MALE,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        groupValue: genderTypes.value,
                        onChanged: (value) => {
                          genderTypes.value = value!,
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 0.5,
                            spreadRadius: 0.5,
                          ),
                        ],
                      ),
                      child: RadioListTile<Gender>(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(Gender.FEMALE.name.toLowerCase()),
                        value: Gender.FEMALE,
                        groupValue: genderTypes.value,
                        onChanged: (value) => {
                          genderTypes.value = value!,
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: _SAVE_the_profile_data_action(),
    );
  }

  Container _SAVE_the_profile_data_action() {
    return Container(
      height: 90,
      padding: EdgeInsets.all(20),
      width: double.maxFinite,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
          ),
        ],
      ),
      child: SizedBox(
        height: 40,
        width: 200,
        child: CustomBtnUtil(
          btnTitle: "Save",
          btnType: BtnTypes.eleveatedWithIcon,
          // btnColor: Colors.white,
          isLoading: false,
          icon: Icon(
            Icons.save,
            color: Colors.white,
          ),
          onClicked: () => {},
        ),
      ),
    );
  }
}
