import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/helper/enumerations.dart';
import 'package:stc_training/utils/big_text_util.dart';
import 'package:stc_training/utils/custom_btn_util.dart';
import 'package:stc_training/utils/custom_textField_util.dart';
import 'package:stc_training/utils/small_text_util.dart';
import 'package:stc_training/utils/title_with_background_util.dart';

class LoginAuthPage extends HookWidget {
  const LoginAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////
    /// Controllers
    ///////////////////////////////////////////////
    final TextEditingController emailTextCtl = useTextEditingController();
    final TextEditingController passwordCtl = useTextEditingController();

    ///////////////////////////////////////////////
    /// Parameters
    ///////////////////////////////////////////////
    final email = useState("");
    final password = useState("");

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
    useEffect(
      () {
        //TODO: Listen to the change of the fullname hook
        passwordCtl.addListener(() {
          password.value = passwordCtl.text;
        });
        //TODO: Listen to the change of the email hook
        emailTextCtl.addListener(() {
          email.value = emailTextCtl.text;
        });
        return null;
      },
      [passwordCtl, emailTextCtl],
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(
          vertical: AppConstants.verticalPadding,
          horizontal: AppConstants.horizentalPadding,
        ),
        padding: EdgeInsets.only(
          top: AppConstants.height_30,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svgs/stc-logo.svg",
                color: AppColors.deepPrimary,
              ),
              const SizedBox(
                height: AppConstants.space_26,
              ),
              TitleWithBackgroundUtil(title: "Login"),
              const SizedBox(
                height: AppConstants.space_26,
              ),
              CustomBtnUtil(
                btnTitle: "Login with Gmail",
                btnType: BtnTypes.eleveatedWithIcon,
                btnColor: AppColors.deepOrange.withOpacity(0.8),
                icon: SvgPicture.asset("assets/svgs/google-icon.svg"),
                onClicked: () {},
              ),
              CustomBtnUtil(
                btnTitle: "Login with Facebook",
                btnType: BtnTypes.eleveatedWithIcon,
                btnColor: AppColors.primary.withOpacity(0.8),
                icon: SvgPicture.asset("assets/svgs/facebook-icon.svg"),
                onClicked: () {},
              ),
              const SizedBox(
                height: AppConstants.space_26,
              ),
              BigTextUtil(
                text: "OR",
                color: AppColors.blacklight2,
              ),
              CustomTextFieldUtil(
                hintText: "Email",
                controller: emailTextCtl,
                keyboardType: TextInputType.emailAddress,
                hasLabel: false,
                prefixIcon: SvgPicture.asset(
                  "assets/svgs/email.svg",
                ),
                radius: AppConstants.radius_24,
              ),
              CustomTextFieldUtil(
                hintText: "Password",
                controller: passwordCtl,
                isPassword: true,
                hasLabel: false,
                prefixIcon: SvgPicture.asset(
                  "assets/svgs/password-key.svg",
                ),
                radius: AppConstants.radius_24,
              ),
              const SizedBox(
                height: AppConstants.space_26,
              ),
              _AGREAMENT_message_and_actions(),
            ],
          ),
        ),
      ),
      bottomSheet: _Login_action(),
    );
  }

  Column _AGREAMENT_message_and_actions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmallTextUtil(
          text: "By using our services, you are agreed to",
          size: 15,
          color: AppColors.brown,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBtnUtil(
              btnTitle: "terms",
              btnType: BtnTypes.text,
              onClicked: () => {},
            ),
            SmallTextUtil(
              text: "and",
              size: 15,
              color: AppColors.brown,
            ),
            CustomBtnUtil(
              btnTitle: "privecy",
              btnType: BtnTypes.text,
              onClicked: () => {},
            ),
          ],
        )
      ],
    );
  }

  Container _Login_action() {
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
          btnTitle: "Login",
          btnType: BtnTypes.eleveatedWithIcon,
          // btnColor: Colors.white,
          isLoading: false,
          icon: Icon(
            Icons.login,
            color: Colors.white,
          ),
          onClicked: () => {},
        ),
      ),
    );
  }
}
