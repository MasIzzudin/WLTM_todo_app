

import 'package:dio/dio.dart';
import 'package:wltm_test/app/modules/home/models/todos.dart';
import 'package:wltm_test/core/services/dio_services.dart';

class HomePageServices {
  DioService dioService = DioService();
  Response? response;

  Future<List<Todos>> getAllTodos() async {
    try {
      String path = "todos";
      response = await dioService.dio.get(path);
      Map getMap = response!.data as Map;
      List getList = getMap["todos"];
      List<Todos>newRes = [];
      for (var element in getList) {
        Todos newObj = Todos.fromJson(element);
        newRes.add(newObj);
      }

      return newRes;
    } on DioException catch (e) {
      rethrow;
    }
  }

  Future<Map> addTodos(Map data) async {
    try {
      String path = "todos/add";
      response = await dioService.dio.post(
        path,
        data: data
      );

      return response!.data as Map;
    } on DioException catch (e) {
      rethrow;
    }
  }

  Future<Map> editTodos(Todos data) async {
    try {
      String path = "todos/${data.id}";
      Map newData = data.toJson();
      newData.remove("id");
      response = await dioService.dio.put(
        path,
        data: newData
      );

      return response!.data as Map;
    } on DioException catch (e) {
      rethrow;
    }
  }

  Future<Map> deleteTodos(Todos data) async {
    try {
      String path = "todos/${data.id}";
      response = await dioService.dio.delete(path);

      return response!.data as Map;
    } on DioException catch (e) {
      rethrow;
    }
  }
}