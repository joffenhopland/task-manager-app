import 'package:get/get.dart';
import 'package:task_management_app/services/service.dart';
import 'package:task_management_app/utils/app_constants.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;

  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData(AppConstant.GET_TASKS);
    if (response.statusCode == 200) {
      _myData = response.body;
      print("We got the data");
      update();
    } else {
      print("We didn't get any data");
    }
    _isLoading = false;
  }

  Future<void> getSingleData(String id) async {
    _isLoading = true;
    Response response =
        await service.getData('${AppConstant.GET_TASK}/?id=$id');
    if (response.statusCode == 200) {
      // _myData = response.body;
      print("We got the single data");
      update();
    } else {
      print("We didn't get any single data");
    }
    _isLoading = false;
  }

  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData(AppConstant.POST_TASK, {
      "task_name": task,
      "task_detail": taskDetail,
    });
    if (response.statusCode == 200) {
      update();
      print('data post successful');
    } else {
      print('data post failed');
    }
  }
}
