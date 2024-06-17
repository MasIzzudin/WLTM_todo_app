import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wltm_test/app/widgets/widgets.dart';

class OptionMenu extends StatelessWidget {
  const OptionMenu({
    super.key,
    required this.title,
    required this.isComplete,
    required this.onEdit,
    required this.markComplete,
    required this.onDelete
  });

  final String title;
  final bool isComplete;
  final Function() onEdit;
  final Function() markComplete;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 250,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: title.toUpperCase(),
            maxLines: 1,
            flow: TextOverflow.ellipsis,
            size: 18,
            weight: FontWeight.w800,
          ),
          const Gap(20),
          InkWell(
            onTap: onEdit,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CommonText(
                    text: "Edit",
                    weight: FontWeight.w600,
                  )
                ),
                const Icon(
                  Icons.edit,
                  color: Colors.orange,
                )
              ],
            ),
          ),
          const Gap(15),
          InkWell(
            onTap: onDelete,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CommonText(
                    text: "Hapus",
                    weight: FontWeight.w600,
                  ),
                ),
                const Icon(Icons.delete, color: Colors.red,)
              ],
            ),
          ),
          const Gap(15),
          InkWell(
            onTap: markComplete,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CommonText(
                    text: "Jadikan ${isComplete == false ? "Selesai" : "Tidak Selesai"}",
                    weight: FontWeight.w600,
                  ),
                ),
                const Icon(
                  Icons.change_circle,
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}