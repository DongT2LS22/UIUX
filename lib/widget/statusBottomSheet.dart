import 'package:flutter/material.dart';

import '../model/task.dart';

class StatusBottomSheet extends StatefulWidget {
  Task task;

  StatusBottomSheet({required this.task});

  @override
  State<StatusBottomSheet> createState() => _StatusBottomSheetState();
}

class _StatusBottomSheetState extends State<StatusBottomSheet> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 50,
                height: 3,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text(
                "Status",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "To do",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Radio<int>(
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                      value: 0,
                      groupValue: selectedValue,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "In progress",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Radio<int>(
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                      value: 1,
                      groupValue: selectedValue,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Completed",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Radio<int>(
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                      value: 2,
                      groupValue: selectedValue,
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
