import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/screens/all_tasks.dart';
import 'package:task_management_app/utils/colors/app_colors.dart';
import 'package:task_management_app/widgets/button_widget.dart';
import 'package:task_management_app/widgets/textfield_widget.dart';

import '../controllers/data_controller.dart';
import '../widgets/error_warning_ms.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    bool _dataValidation() {
      if (nameController.text.trim() == '') {
        Message.taskErrorOrWarning("Task name", "Your task name is empty");
        return false;
      } else if (detailController.text.trim() == '') {
        Message.taskErrorOrWarning("Task detail", "Your task detail is empty");
      } else if (nameController.text.length < 2) {
        Message.taskErrorOrWarning(
            "Task name", "Your task name should be at least two characters");
      } else if (detailController.text.length < 2) {
        Message.taskErrorOrWarning("Task detail",
            "Your task detail should be at least two characters");
      }
      return true;
    }

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/addtask1.jpg"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                TextFieldWidget(
                  textController: nameController,
                  hintText: "Task name",
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  textController: detailController,
                  hintText: "Task details",
                  borderRadius: 15,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (_dataValidation()) {
                      Get.find<DataController>().postData(
                          nameController.text.trim(),
                          detailController.text.trim());
                      Get.to(
                        () => AllTasks(),
                        transition: Transition.circularReveal,
                      );
                    }
                  },
                  child: ButtonWidget(
                      backgroundcolor: AppColors.mainColor,
                      text: "Add",
                      textcolor: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            )
          ],
        ),
      ),
    );
  }
}
