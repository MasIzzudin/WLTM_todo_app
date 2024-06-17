import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:wltm_test/app/widgets/common_text_form.dart';
import 'package:wltm_test/app/widgets/widgets.dart';

import '../controllers/form_page_controller.dart';

class FormPageView extends GetView<FormPageController> {
  const FormPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => CommonText(
          text: controller.title.value,
          size: 20,
          align: TextAlign.left,
          weight: FontWeight.w700,
        )),
      ),
      body: GetBuilder<FormPageController>(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Form(
              key: _.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: "Nama Tugas",
                    weight: FontWeight.w600,
                  ),
                  const Gap(8),
                  TextForm(
                    controller: _.todoController,
                    hintText: "Buat tugas...",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  const Gap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(() => Checkbox(
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: _.isComplete.value, 
                        activeColor: Colors.blue,
                        onChanged: (value) {
                          _.setComplete(!_.isComplete.value);
                        }
                      ),),
                      const Gap(8),
                      CommonText(text: "Jadikan selesai")
                    ],
                  )
                ],
              ),
            ),
          );
        }
      ),
      bottomNavigationBar: BottomAppBar(
        child: CommonButton(
          label: "Simpan",
          onPressed: () => controller.saveForm()
        ),
      ),
    );
  }
}
