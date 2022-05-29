import 'dart:convert';

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
      update();
    } else {
      print("We didn't get any data");
    }
    _isLoading = false;
  }

  Future<void> getSingleData(String id) async {
    _isLoading = true;
    Response response = await service.getData('${AppConstant.GET_TASK}/$id');
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("We got the single data" + response.body);
        _singleData = jsonDecode(response.body);
        print('_singleData: $_singleData');
      }
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

  Future<void> updateData(String task, String taskDetail, String id) async {
    _isLoading = true;
    Response response =
        await service.updateData('${AppConstant.UPDATE_TASK}/$id', {
      "task_name": task,
      "task_detail": taskDetail,
    });
    if (response.statusCode == 200) {
      update();
      print('data update successful');
    } else {
      print('data update failed');
    }
  }

  Future<void> deleteData(String task, String taskDetail, String id) async {
    _isLoading = true;
    Response response =
        await service.deleteData('${AppConstant.UPDATE_TASK}/$id');
    if (response.statusCode == 200) {
      update();
      print('data update successful');
    } else {
      print('data update failed');
    }
  }
}
