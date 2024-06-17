import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wltm_test/app/modules/home/controllers/home_page_controller.dart';
import 'package:wltm_test/app/modules/home/views/components/delete_warning.dart';
import 'package:wltm_test/app/modules/home/views/components/option_menu.dart';
import 'package:wltm_test/app/routes/app_pages.dart';

import '../../../widgets/widgets.dart';
import '../models/todos.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});


  showModalOption(Todos data) {
    Get.bottomSheet(
      OptionMenu(
        title: data.todo!, 
        isComplete: data.completed!,
        onEdit: () async {
          Get.back();
          Map callBack = await Get.toNamed(Routes.formPage, arguments: data);
          controller.changeLocalTodos(callBack);
        }, 
        markComplete: () async {
          await controller.editAsComplete(data);
          Get.back();
        },
        onDelete: () {
          Get.back();
          showAlertDelete(data);
        },
      )
    );
  }

  showAlertDelete(Todos data) {
    Get.bottomSheet(DeleteWarning(
      title: data.todo!, 
      onDelete: () async {
       await controller.deleteTodos(data);
       Get.back();
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonText(
          text: "Apa yang akan anda lakukan hari ini?",
          size: 16,
          weight: FontWeight.w700,
        ),
      ),
      body: MixinBuilder<HomePageController>(
        builder: (_) {
          return ConditionalWidget(
            condition: _.isLoading.value,
            builder: (context) => circularLoading,
            fallback: (context) => LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: RefreshIndicator(
                    onRefresh: () {
                      return controller.getTodos();
                    },
                    child: ListView.builder(
                      itemCount: _.getList.length,
                      itemBuilder: (context, index) {
                        Todos data = _.getList[index];
                        return InkWell(
                          onTap: () => showModalOption(data),
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black
                                )
                              )
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                        text: data.todo,
                                        size: 15,
                                        weight: FontWeight.w700,
                                      ),
                                      const Gap(5),
                                      Visibility(
                                        visible: data.completed == true,
                                        child: CommonText(
                                          text: "Selesai",
                                          size: 12,
                                          color: Colors.green,
                                          weight: FontWeight.w800,
                                        )
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: 20,
                                  child: const Icon(Icons.more_vert_outlined),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
         Map callBack = await Get.toNamed(Routes.formPage);
         controller.addLocalTodos(callBack);
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}