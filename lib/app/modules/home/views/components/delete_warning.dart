

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';
import 'package:wltm_test/app/widgets/widgets.dart';

class DeleteWarning extends StatelessWidget {
  const DeleteWarning({
    super.key,
    required this.title,
    required this.onDelete,
  });

  final String title;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8)
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                height: 1.3
              ),
              children: [
                const TextSpan(
                  text: "Anda akan menghapus ",
                ),
                TextSpan(
                  text: title,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  )
                )
              ]
            )
          ),
          Row(
            children: [
              Flexible(
                child: CommonButton(
                  onPressed: () => Get.back(),
                  label: "Batal",
                  bordered: true,
                  color: Colors.white,
                  labelColor: Colors.black,
                  borderColor: Colors.black,
                ),
              ),
              const Gap(8),
              Flexible(
                child: CommonButton(
                  onPressed: onDelete,
                  label: "Hapus",
                  labelColor: Colors.white,
                  color: Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}