import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task_management_app/services/service.dart';
import 'package:task_management_app/utils/app_constants.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  Map<String, dynamic> _singleData = {};
  Map<String, dynamic> get singleData => _singleData;

  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData(AppConstant.GET_TASKS);
    if (response.statusCode == 200) {
      _myData = response.body;
      print("We got the data");
    } else {
      print("We didn't get any data");
    }
    _isLoading = false;
    update();
  }

  Future<void> getSingleData(String id) async {
    _isLoading = true;
    Response response = await service.getData('${AppConstant.GET_TASK}/$id');
    print(response.body);
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("We got the single data ${response.body}");
        _singleData = response.body;
        print('_singleData: $_singleData');
      }
    } else {
      print("We didn't get any single data");
    }
    _isLoading = false;
    update();
  }

  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData(AppConstant.POST_TASK, {
      "task_name": task,
      "task_detail": taskDetail,
    });
    if (response.statusCode == 200) {
      print('data post successful');
    } else {
      print('data post failed');
    }
    update();
  }

  Future<void> updateData(String task, String taskDetail, String id) async {
    _isLoading = true;
    Response response =
        await service.updateData('${AppConstant.UPDATE_TASK}/$id', {
      "task_name": task,
      "task_detail": taskDetail,
    });
    if (response.statusCode == 200) {
      print('data update successful');
    } else {
      print('data update failed');
    }
    update();
  }

  Future<void> deleteData(String id) async {
    _isLoading = true;
    update();
    Response response =
        await service.deleteData('${AppConstant.DELETE_TASK}/$id');
    print(response.headers);
    if (response.statusCode == 200) {
      print(response);
      // update();
      print('data delete successful');
    } else {
      print('data delete failed');
    }
    await Future.delayed(Duration(seconds: 1), () {
      _isLoading = false;
      update();
    });
  }
}
