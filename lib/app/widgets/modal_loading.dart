import 'package:flutter/material.dart';
import 'package:wltm_test/app/widgets/widgets.dart';

class ModalLoading extends StatelessWidget {
  const ModalLoading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 150,
            maxWidth: 200
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5)
          ),
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const CircularProgressIndicator(
                color: Colors.black,
              ),
              const SizedBox(height: 20,),
              CommonText(text: "Mohon tunggu sebentar")
            ],
          ),
        ),
      ),
    );
  }
}