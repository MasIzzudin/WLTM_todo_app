import 'package:get/get.dart';
import 'package:wltm_test/app/modules/home/services/home_page_services.dart';
import 'package:wltm_test/core/utils/function.dart';

import '../models/todos.dart';

class HomePageController extends GetxController {
  HomePageServices homePageServices = HomePageServices();
  
  var isLoading = false.obs;
  List<Todos> getList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTodos();
  }

  getTodos() async {
    try {
      isLoading.value = true;
      getList = await homePageServices.getAllTodos();

      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  editAsComplete(Todos data) async {
    try {
      GFunction.openModalLoading();
      data.completed = !data.completed!;
      var callBack = await homePageServices.editTodos(data);
      GFunction.closeModalLoading();
      changeLocalTodos(callBack);
      return callBack;
    } catch (e) {
      GFunction.closeModalLoading();
      rethrow;
    }
  }
  
  deleteTodos(Todos data) async {
    try {
      GFunction.openModalLoading();
      Map res = await homePageServices.deleteTodos(data);
      deleteLocalTodos(res);
      GFunction.closeModalLoading();
      return res;
    } catch (e) {
      GFunction.closeModalLoading();
      rethrow;
    }
  }

  deleteLocalTodos(Map callBack) {
    getList.removeWhere((element) => element.id == callBack["id"]);

    update();
  }

  addLocalTodos(Map callBack) {
    getList.insert(0, Todos(
      completed: callBack["completed"],
      id: callBack["id"],
      todo: callBack["todo"],
      userId: callBack["userId"],
    ));

    update();
  }

  changeLocalTodos(Map callBack) {
    int getIndex = getList.indexWhere((element) => element.id == callBack["id"]);
    getList[getIndex].todo = callBack["todo"];
    getList[getIndex].completed = callBack["completed"];

    update();
  }
}