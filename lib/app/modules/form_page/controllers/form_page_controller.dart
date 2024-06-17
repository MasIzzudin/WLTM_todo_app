import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wltm_test/app/modules/home/services/home_page_services.dart';
import 'package:wltm_test/core/utils/function.dart';

import '../../home/models/todos.dart';

class FormPageController extends GetxController {
  HomePageServices homePageServices = HomePageServices();
  var title = "".obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isComplete = false.obs;
  late TextEditingController todoController;
  Todos? getParam;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    todoController = TextEditingController();
    var getArgument = Get.arguments;

    if(getArgument != null && getArgument is Todos) {
      title.value = "Edit Tugas";
      getParam = getArgument;
      todoController.text = getParam!.todo!;
      isComplete.value = getParam!.completed!;

      update();
    } else {
      title.value = "Buat Tugas";
    }
  }

  setComplete(value) {
    isComplete.value = value;
  }

  addTodos() async {
    print("hit add");
    try {
      GFunction.openModalLoading();
      Map body = {
        "userId": 200,
        "todo": todoController.text,
        "completed": isComplete.value 
      };
      Map res = await homePageServices.addTodos(body);
      GFunction.closeModalLoading();
      Get.back(result: res);
    } catch (e) {
      GFunction.closeModalLoading();
      rethrow;
    }
  }

  editTodos() async {
    print("hit edit");
    try {
      GFunction.openModalLoading();
      Todos data = Todos(
        completed: isComplete.value,
        id: getParam!.id,
        userId: getParam!.userId,
        todo: todoController.text
      );
      Map res = await homePageServices.editTodos(data);
      GFunction.closeModalLoading();
      Get.back(result: res);      
    } catch (e) {
      GFunction.closeModalLoading();
      rethrow;
    }
  }

  saveForm() {
    if(formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if(getParam == null) {
        addTodos();
      } else {
        editTodos();
      }
    }
  }
}
