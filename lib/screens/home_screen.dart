import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/screens/add_task.dart';
import 'package:task_management_app/utils/colors/app_colors.dart';
import 'package:task_management_app/widgets/button_widget.dart';
import 'all_tasks.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Hello",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "\nstart your beautiful day",
                    style: TextStyle(
                      color: AppColors.smallTextColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const AddTask(),
                    transition: Transition.zoom,
                    duration: const Duration(milliseconds: 250));
              },
              child: ButtonWidget(
                  backgroundcolor: AppColors.mainColor,
                  text: "Add Task",
                  textcolor: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(
                  () => const AllTasks(),
                  transition: Transition.fade,
                  duration: const Duration(milliseconds: 250),
                );
              },
              child: ButtonWidget(
                  backgroundcolor: Colors.white,
                  text: "View All",
                  textcolor: AppColors.smallTextColor),
            ),
          ],
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/welcome.jpg"),
          ),
        ),
      ),
    );
  }
}
