import 'package:get/get.dart';
import 'package:task_management_app/screens/all_tasks.dart';
import 'package:task_management_app/screens/home_screen.dart';

import '../screens/add_task.dart';
import '../screens/edit_task.dart';
import '../screens/view_task.dart';

class RoutesClass {
  static String home = '/';
  static String allTasks = '/allTask';
  static String addTask = '/addTask';
  static String editTask = '/editTask';
  static String viewTask = '/viewTask';

  static String getHomeRoute() => home;
  static String getAllTasksRoute() => allTasks;
  static String getAddTaskRoute() => addTask;
  static String getEditTaskRoute(String id) => '$editTask?id=$id';
  static String getViewTaskRoute(String id) => '$viewTask?id=$id';

  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(
      name: allTasks,
      page: () => const AllTasks(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: addTask,
      page: () => const AddTask(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: editTask,
      page: () {
        var id = Get.parameters['id'];
        return EditTask(id: int.parse(id!));
      },
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: viewTask,
      page: () {
        var id = Get.parameters['id'];
        return ViewTask(id: int.parse(id!));
      },
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}
