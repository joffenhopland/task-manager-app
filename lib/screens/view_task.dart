import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:task_management_app/controllers/data_controller.dart';

import '../utils/colors/app_colors.dart';
import '../widgets/textfield_widget.dart';

class ViewTask extends StatelessWidget {
  final int id;
  const ViewTask({Key? key, required this.id}) : super(key: key);

  _loadSingleTask() async {
    print("Passed id is " + id.toString());
    await Get.find<DataController>().getSingleData(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    _loadSingleTask();
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    return Scaffold(body: GetBuilder<DataController>(
      builder: (controller) {
        nameController.text =
            controller.singleData["task_name"] ?? "Task name not found";
        detailController.text =
            controller.singleData["task_detail"] ?? "Task detail not found";
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: const BoxDecoration(
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
                  const SizedBox(
                    height: 35,
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
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
                    hintText: 'Task name',
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    textController: detailController,
                    hintText: 'Task detail',
                    readOnly: true,
                    borderRadius: 15,
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              )
            ],
          ),
        );
      },
    ));
  }
}
