import 'package:get/get.dart';
import 'package:task_management_app/services/service.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;

  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData();
    if (response.statusCode == 200) {
      _myData = response.body;
      print("We got the data");
      update();
    } else {
      print("We didn't get any data");
    }
  }

  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData({
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
