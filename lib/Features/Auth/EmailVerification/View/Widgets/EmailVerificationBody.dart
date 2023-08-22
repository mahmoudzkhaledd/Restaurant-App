import 'package:flutter/material.dart';
import 'package:foodapp/GeneralWidgets/CustomButton.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../GeneralWidgets/AppText.dart';

class EmailVerificationBody extends StatelessWidget {
  EmailVerificationBody({super.key});
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/email_verification.png",
                        height: MediaQuery.of(context).size.height / 2.5,
                      ),
                      const AppText(
                        "تأكيد الإيميل",
                        style: TextStyle(
                          fontFamily: CairoFont.cairoBold,
                          fontSize: 26,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const AppText(
                        "من فضلك، ادخل الرمز المكون من ٦ أرقام المرسلة إلى الإيميل الذي ادخلته",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: CairoFont.cairoMedium,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PinCodeTextField(
                        appContext: context,
                        controller: pinController,
                        length: 6,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          activeColor: const Color.fromRGBO(44, 85, 125, 1),
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(7),
                          inactiveColor: Colors.grey,
                          selectedColor: const Color.fromRGBO(44, 85, 125, 1),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppText("لم تستلم الرمز؟"),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const AppText("اعد الإرسال"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          CustomButton(
            onTap: () {},
            text: "تأكيد",
            verticalPadding: 20,
            icon: const Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
