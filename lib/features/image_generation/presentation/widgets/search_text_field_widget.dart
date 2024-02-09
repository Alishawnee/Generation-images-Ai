import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onTap;

  const SearchTextFieldWidget({
    Key? key,
    this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h, left: 4.w, right: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).w,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0.0, 0.50),
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Container(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 60),
                            child: Scrollbar(
                              child: TextField(
                                style: const TextStyle(fontSize: 14),
                                controller: controller,
                                maxLines: null,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        "Open AI Waiting for your query..."),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: controller!.text.isEmpty ? null : onTap,
            child: Container(
              decoration: BoxDecoration(
                  color: controller!.text.isEmpty
                      ? Colors.green.withOpacity(.4)
                      : Colors.green,
                  borderRadius: BorderRadius.circular(40)),
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
