import 'package:flutter/material.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';
import 'package:get/get.dart';

List<ExpansionTile> cuisineListBuilder(TextEditingController controller, BuildContext context)
{
  return [
    ExpansionTile(
      title: AppText(
        "أنماط المطبخ",
        style: TextStyle(
            fontFamily: CairoFont.cairoBold
        ),
      ),
      children: [
        ListTile(title: AppText("مطبخ فيوجن"), onTap: () {
          controller.text = "مطبخ فيوجن";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
          },),
        ListTile(title: AppText("هوت كوزين"), onTap: () {
          controller.text = "هوت كوزين";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),
        ListTile(title: AppText("نوفيليو كوزين"), onTap: () {
          controller.text = "نوفيليو كوزين";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),
        ListTile(title: AppText("خضرية"), onTap: () {
          controller.text = "خضرية";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),
        ListTile(title: AppText("مطبخ نباتي"), onTap: () {
          controller.text = "مطبخ نباتي";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),
      ],
    ),

    ExpansionTile(
      title: AppText(
        "المأكولات العرقية والدينية",
        style: TextStyle(
            fontFamily: CairoFont.cairoBold
        ),
      ),
      children: [
        ListTile(title: AppText("مطبخ إينو"), onTap: () {
          controller.text = "مطبخ إينو";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
          },),
        ListTile(title: AppText("مطبخ ألبانى"), onTap: () {
          controller.text = "مطبخ ألبانى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),
        ListTile(title: AppText("مطبخ أرجنتينى"), onTap: () {
          controller.text = "مطبخ أرجنتينى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),
        ListTile(title: AppText("مطبخ تيليوغو"), onTap: () {
          controller.text = "مطبخ تيليوغو";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),
        ListTile(title: AppText("مطبخ أمريكي"), onTap: () {
          controller.text = "مطبخ أمريكي";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),

        ListTile(title: AppText("مطبخ أنجلوهندي"), onTap: () {
          controller.text = "مطبخ أنجلوهندي";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),

        ListTile(title: AppText("مطبخ عربى"), onTap: () {
          controller.text = "مطبخ عربى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),

        ListTile(title: AppText("مطبخ أرمني"), onTap: () {
          controller.text = "مطبخ أرمني";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),

        ListTile(title: AppText("مطبخ آشورى/ سريانى/ كلدانى"), onTap: () {
          controller.text = "مطبخ آشورى/ سريانى/ كلدانى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),

        ListTile(title: AppText("مطبخ أوادى"), onTap: () {
          controller.text = "مطبخ أوادى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),

        ListTile(title: AppText("مطبخ بلوشي"), onTap: () {
          controller.text = "مطبخ بلوشي";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ بشكيرى"), onTap: () {
          controller.text = "مطبخ بشكيرى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("المطبخ البيلاروسى"), onTap: () {
          controller.text = "المطبخ البيلاروسى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ بنغلاديشى"), onTap: () {
          controller.text = "مطبخ بنغلاديشى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ بنغالى"), onTap: () {
          controller.text = "مطبخ بنغالى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ أمازيغى"), onTap: () {
          controller.text = "مطبخ أمازيغى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ برازيلى"), onTap: () {
          controller.text = "مطبخ برازيلى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ بريطاني"), onTap: () {
          controller.text = "مطبخ بريطاني";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ صيني"), onTap: () {
          controller.text = "مطبخ صيني";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ تشيكى"), onTap: () {
          controller.text = "مطبخ تشيكى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ دنماركي"), onTap: () {
          controller.text = "مطبخ دنماركي";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ مصرى"), onTap: () {
          controller.text = "مطبخ مصرى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ إنجليزى"), onTap: () {
          controller.text = "مطبخ إنجليزى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("المطبخ الإثيوبى"), onTap: () {
          controller.text = "المطبخ الإثيوبى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ فرنسى"), onTap: () {
          controller.text = "مطبخ فرنسى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ فلبينى"), onTap: () {
          controller.text = "مطبخ فلبينى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ ألمانى"), onTap: () {
          controller.text = "مطبخ ألمانى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ يونانى"), onTap: () {
          controller.text = "مطبخ يونانى";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ هندي"), onTap: () {
          controller.text = "مطبخ هندي";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),


        ListTile(title: AppText("مطبخ إيطالي"), onTap: () {
          controller.text = "مطبخ إيطالي";
          Navigator.pop(context);
          FocusManager.instance.primaryFocus!.unfocus();
        },),

      ],
    ),
  ];
}