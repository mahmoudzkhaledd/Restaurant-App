import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp/GeneralWidgets/CustomButton.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../GeneralWidgets/AppText.dart';

class EmailVerificationBody extends StatelessWidget {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
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

                      AppText(
                        "تأكيد الإيميل",
                        style: TextStyle(
                         fontFamily: CairoFont.cairoBold,
                         fontSize: 26,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 10,),

                      AppText(
                        "من فضلك، ادخل الرمز المكون من ٦ أرقام المرسلة إلى الإيميل الذي ادخلته",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: CairoFont.cairoMedium,
                          fontSize: 15,
                        ),
                      ),

                      SizedBox(height: 20,),

                      PinCodeTextField(
                        appContext: context,
                        controller: pinController,
                        length: 6,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          activeColor: Color.fromRGBO(44, 85, 125, 1),
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(7),
                          inactiveColor: Colors.grey,
                          selectedColor: Color.fromRGBO(44, 85, 125, 1),
                        ),
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText("لم تستلم الرمز؟"),

                          SizedBox(width: 10,),

                          TextButton(
                              onPressed: (){},
                              child: AppText("اعد الإرسال"),
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
            onTap: (){},
            text: "تأكيد",
            verticalPadding: 20,
            icon: Icon(Icons.check_circle, color: Colors.white,),
          ),

          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
