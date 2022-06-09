import 'package:flutter/material.dart';
import 'package:task_management_app/controllers/data_controller.dart';
import 'package:task_management_app/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  loadData() async {
    await Get.find<DataController>().getData();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController());
    loadData();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesClass.getHomeRoute(),
      getPages: RoutesClass.routes,
    );
  }
}
