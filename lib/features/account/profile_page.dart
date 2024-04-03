import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stc_training/features/account/components/account_controller.dart';
import 'package:stc_training/features/account/hooks/get_my_profile_account_hook.dart';
import 'package:stc_training/features/account/hooks/get_update_user_account_hook.dart';
import 'package:stc_training/features/account/models/user_models.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/helper/methods.dart';
import 'package:stc_training/utils/app_bar_util.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_textField_util.dart';
import 'package:stc_training/utils/custom_text_util.dart';

enum Gender {
  NOT_SET,
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
    final TextEditingController fullNameTextCtl = useTextEditingController();
    final TextEditingController emailTextCtl = useTextEditingController();
    final TextEditingController whatsAppNumberTextCtl =
        useTextEditingController();
    final TextEditingController telegramNumberTextCtl =
        useTextEditingController();
    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    var genderTypes = useState<Gender>(Gender.NOT_SET);
    final fullName = useState("");
    final email = useState("");
    final myAccount = useState<UserModel?>(UserModel.init());
    final whatsAppNumber = useState("");
    final telegramNumber = useState("");

    //TODO: To get the image from the network
    // final image = useFuture(NetworkAssetBundle(Uri.parse("")))
    //     .load("")
    //     .then((data) => data.buffer.asUint8List())
    //     .then((data) => Image.memory(data));

    ////////////////////////////////////////////////
    /// Functions
    ///////////////////////////////////////////////

    ////////////////////////////////////////////////
    /// Hook Functions
    ///////////////////////////////////////////////
    //Todo: Get my profile account data
    var unitsResult = UseGet_my_profile_account_query_hook(
      context: context,
    );
    //? Get the course units data
    myAccount.value = unitsResult["data"];
    QueryHookResult<Object?> hookRes = unitsResult['hookRes'];

    // Get the create new certifcate mutation hook
    MutationHookResult updateUserAccountHook = useUpdateUserAccountMutationHook(
      context: context,
    );

    //Todo: Whatch the change of the input fields
    useEffect(
      () {
        //TODO: Listen to the change of the fullname hook
        fullNameTextCtl.addListener(() {
          fullName.value = fullNameTextCtl.text;
        });
        // //TODO: Listen to the change of the email hook
        // emailTextCtl.addListener(() {
        //   email.value = emailTextCtl.text;
        // });
        //TODO: Listen to the change of the whatsAppNumber hook
        whatsAppNumberTextCtl.addListener(() {
          whatsAppNumber.value = whatsAppNumberTextCtl.text;
        });
        //TODO: Listen to the change of the telegramNumber hook
        telegramNumberTextCtl.addListener(() {
          telegramNumber.value = telegramNumberTextCtl.text;
        });

        if (myAccount.value != null) {
          emailTextCtl.text = myAccount.value?.email ?? '';
          fullNameTextCtl.text = myAccount.value?.fullName ?? '';
          whatsAppNumberTextCtl.text = myAccount.value?.phoneNumber2 ?? '';
          telegramNumberTextCtl.text = myAccount.value?.phoneNumber3 ?? '';
          var gender = myAccount.value?.gender;
          if (gender == 'MALE') {
            genderTypes.value = Gender.MALE;
          } else if (gender == 'FEMALE') {
            genderTypes.value = Gender.FEMALE;
          } else {
            genderTypes.value = Gender.NOT_SET;
          }
        }

        return null;
      },
      [
        fullNameTextCtl,
        emailTextCtl,
        whatsAppNumberTextCtl,
        telegramNumberTextCtl,
        myAccount.value,
      ],
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBarUtil(
        barText: "Profile",
        // iconColor: Colors.white,
        iconFilled: Colors.transparent,
        // backgroundColor: Colors.white,
      ),
      body: GetBuilder<AccountController>(
        builder: (innerAccountCtl) => SingleChildScrollView(
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
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 0.5,
                                  spreadRadius: 0.5,
                                ),
                              ],
                            ),
                            child: Center(child: GET_the_stc_logo(size: 60)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextUtil(
                            text1: fullName.value,
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
                // JoinTheMarketingAction(),
                ////////////////////////////////////////////////
                /// Full Name
                ///////////////////////////////////////////////
                CustomTextFieldUtil(
                  hasLabel: false,
                  hintText: "Full Name",
                  controller: fullNameTextCtl,
                  enable: !innerAccountCtl.isLoading,
                ),
                ////////////////////////////////////////////////
                /// Email
                ///////////////////////////////////////////////
                CustomTextFieldUtil(
                  hasLabel: false,
                  hintText: "Email",
                  controller: emailTextCtl,
                  keyboardType: TextInputType.emailAddress,
                  enable: false,
                ),
                ////////////////////////////////////////////////
                /// Whats app number
                ///////////////////////////////////////////////
                CustomTextFieldUtil(
                  hasLabel: false,
                  hintText: "Whats app number",
                  keyboardType: TextInputType.number,
                  controller: whatsAppNumberTextCtl,
                  enable: !innerAccountCtl.isLoading,
                ),
                ////////////////////////////////////////////////
                /// Telegram number
                ///////////////////////////////////////////////
                CustomTextFieldUtil(
                  hasLabel: false,
                  hintText: "Telegram number",
                  keyboardType: TextInputType.number,
                  controller: telegramNumberTextCtl,
                  enable: !innerAccountCtl.isLoading,
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
      ),
      bottomSheet: _SAVE_the_profile_data_action(
        updateUserAccountHook: updateUserAccountHook,
        genderTypes: genderTypes.value,
        fullName: fullName,
        whatsAppNumber: whatsAppNumber,
        telegramNumber: telegramNumber,
      ),
    );
  }

  Container JoinTheMarketingAction() {
    return Container(
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
    );
  }

  Container _SAVE_the_profile_data_action({
    required MutationHookResult updateUserAccountHook,
    required Gender genderTypes,
    required ValueNotifier fullName,
    required ValueNotifier whatsAppNumber,
    required ValueNotifier telegramNumber,
  }) {
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
      child: GetBuilder<AccountController>(
        builder: (btnAccountCtl) => SizedBox(
          height: 40,
          width: 200,
          child: CustomBtnUtil(
            btnTitle: "Save",
            btnType: BtnTypes.eleveatedWithIcon,
            // btnColor: Colors.white,
            isLoading: btnAccountCtl.isLoading,
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onClicked: () {
              //TODO: Prepare the payload data
              var payload = {
                'input': {
                  'fullName': fullName.value,
                  'phoneNumber2': whatsAppNumber.value,
                  'phoneNumber3': telegramNumber.value,
                  'gender': genderTypes == Gender.FEMALE
                      ? 'female'
                      : (genderTypes == Gender.MALE ? 'male' : 'not set'),
                }
              };

              //Todo: Start the loading
              btnAccountCtl.setIsLoadingValue(true);
              //Todo: Run the mutation
              updateUserAccountHook.runMutation(payload);
            },
          ),
        ),
      ),
    );
  }
}
