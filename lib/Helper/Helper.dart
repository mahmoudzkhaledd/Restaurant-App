import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../GeneralWidgets/AppText.dart';

class Helper {
  static Widget loadingWidget() => const Center(
        child: CircularProgressIndicator(),
      );
  static Widget loadNetworkImage(String url, String assetsErrorPath,
      [BoxFit fit = BoxFit.cover]) {
    if (url.isNotEmpty) {
      bool validUrl = Uri.parse(url).isAbsolute;
      if (validUrl) {
        return CachedNetworkImage(
          imageUrl: url,
          fit: fit,
          placeholder: (ctx, str) => Helper.loadingWidget(),
          errorWidget: (ctx, str, obj) =>
              Image.asset("assets/images/$assetsErrorPath"),
        );
      } else {
        return Image.asset("assets/images/$assetsErrorPath");
      }
    } else {
      return Image.asset("assets/images/$assetsErrorPath");
    }
  }

  static FutureOr<T> showLoading<T>(
    String title,
    String content,
    Future<T> Function() future,
  ) async {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: AppText(title),
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 20),
            AppText(content),
          ],
        ),
      ),
    );
    T res = await future();
    Get.back();
    return res;
  }

  static bool isValidEmail(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  static void showSnackBarMessage(
    BuildContext context,
    String content,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: AppText(content),
      showCloseIcon: true,
    ));
  }

  static Future<void> showMessage(
    String title,
    String message,
  ) async {
    await showDialog(
      context: Get.context!,
      builder: (ctx) => AlertDialog(
        title: AppText(title),
        content: AppText(message),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const AppText("OK"),
          )
        ],
      ),
    );
  }

  static Future<void> showBottomSheetWidget(
    Widget child,
  ) async {
    await showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      builder: (ctx) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -60,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              icon: const Icon(Icons.close),
            ),
          ),
          DraggableScrollableSheet(
            expand: false,
            maxChildSize: 0.9,
            initialChildSize: 0.3,
            builder: (ctx, ctrl) => SingleChildScrollView(
              controller: ctrl,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  static Future<bool> showYesNoMessage(
    BuildContext context,
    String title,
    String content,
  ) async {
    bool? ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: AppText(title),
        content: AppText(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop<bool>(true);
            },
            child: const AppText("Yes"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop<bool>(false);
            },
            child: const AppText("No"),
          ),
        ],
      ),
    );
    return ok ?? false;
  }
}
