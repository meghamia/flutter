import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiledevelopment/controller/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());

    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              themeController.changeTheme();
            },
            icon: Obx(
                  () => themeController.isDark.value
                  ? Icon(Icons.dark_mode)
                  : Icon(Icons.light_mode),
            ),
          ),
        ],
      ),
    );
  }
}
