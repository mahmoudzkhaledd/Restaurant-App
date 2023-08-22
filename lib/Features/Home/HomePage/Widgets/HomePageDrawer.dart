import 'package:flutter/material.dart';

import 'package:foodapp/Helper/Helper.dart';

import '../../../../GeneralWidgets/AppText.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({
    super.key,
    required this.onGoToOrdersPage,
    required this.onGoToSettingsPage,
    required this.onLogOut,
  });

  final VoidCallback onGoToOrdersPage;
  final VoidCallback onGoToSettingsPage;
  final VoidCallback onLogOut;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            height: MediaQuery.of(context).size.width / 2.5,
            child: Helper.loadNetworkImage(
              "",
              'target.png',
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: AppText(
              "مستخدم ضيف",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: const AppText('طلباتك'),
            onTap: onGoToOrdersPage,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const AppText('الاعدادات'),
            onTap: onGoToSettingsPage,
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const AppText('تسجيل الخروج'),
            onTap: onLogOut,
          ),
        ],
      ),
    );
  }
}
