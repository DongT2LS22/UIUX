import 'package:ebook/model/assignment.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../constant.dart';

class SubmitTaskPage extends StatefulWidget {
  Assignment assignment;

  SubmitTaskPage({required this.assignment});

  @override
  State<SubmitTaskPage> createState() => _SubmitTaskPageState();
}

class _SubmitTaskPageState extends State<SubmitTaskPage> {

  _buildAttachFile() {
    List<Widget> fileWidgets = [];
    widget.assignment.files == null
        ? Container()
        : widget.assignment.files!.forEach((file) {
            fileWidgets.add(Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 50,
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/docIcon.png",
                        width: 35,
                        height: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            file.name,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          Text(
                            file.volume,
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "100%",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.check_circle,
                        color: Colors.black,
                        size: 20,
                      )
                    ],
                  )
                ],
              ),
            ));
            fileWidgets.add(SizedBox(
              height: 10,
            ));
          });
    return fileWidgets;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Assignment",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () async {
                await showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    context: context,
                    builder: (context) {
                      return Container(
                          height: 250,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: StatefulBuilder(
                            builder: (context, state) {
                              int _currentValue = widget.assignment.mark??5;
                              return Column(
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
                                  TextButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => Dialog(
                                                insetPadding:
                                                    const EdgeInsets.all(0),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 0,
                                                      vertical: 10),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      StatefulBuilder(builder:
                                                          (context, setState) {

                                                        return NumberPicker(
                                                          value: _currentValue,
                                                          minValue: 0,
                                                          maxValue: 10,
                                                          onChanged: (value) {
                                                            setState(() =>
                                                                _currentValue =
                                                                    value);
                                                            state;
                                                          },
                                                        );
                                                      }),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              widget.assignment.mark = _currentValue;
                                                            });
                                                            Navigator.pop(context);
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10,
                                                                    horizontal:
                                                                        20),
                                                            child: const Text(
                                                              "Ok",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 17),
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ));
                                    },
                                    style: ButtonStyle(
                                        padding:
                                            MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    const EdgeInsets.all(0)),
                                        foregroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) => Colors.black)),
                                    child: SizedBox(
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.assignment,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                "Assess",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 17),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Text(
                                              widget.assignment.mark == null ? "?" : widget.assignment.mark.toString() + "/10",
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => Dialog(
                                            insetPadding: EdgeInsets.all(0),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.only(left: 14),
                                                    height: 40,
                                                    width: 300,
                                                    margin: const EdgeInsets.only(top: 10),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey, width: 1),
                                                        borderRadius: BorderRadius.circular(8)),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            child: TextFormField(
                                                              readOnly: false,
                                                              autofocus: false,
                                                              cursorColor: Colors.black,
                                                              style: const TextStyle(
                                                                  fontSize: 16, color: Colors.black),
                                                              decoration: const InputDecoration(
                                                                  hintText: "Enter comment",
                                                                  hintStyle: TextStyle(
                                                                      fontSize: 16, color: Colors.grey),
                                                                  focusedBorder: UnderlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Colors.white,
                                                                          width: 0)),
                                                                  enabledBorder: UnderlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Colors.white,
                                                                          width: 0))),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: const Text(
                                                        "Submit",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w600),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ));
                                    },
                                    style: ButtonStyle(
                                        padding:
                                            MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    const EdgeInsets.all(0)),
                                        foregroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) => Colors.black)),
                                    child: SizedBox(
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Icon(
                                            Icons.comment,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            "Comment",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ));
                    });
              },
              icon: const Icon(
                Icons.more_vert,
                size: 20,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  child: widget.assignment!.person.avatar == null
                      ? Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.grey)),
                          child: const Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 34,
                          ),
                        )
                      : Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.grey)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              widget.assignment!.person.avatar!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  widget.assignment!.person.name,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            widget.assignment.note != null
                ? Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.assignment.note!,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  )
                : Container(),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: _buildAttachFile(),
            )
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20)),
          child: const Center(
              child: Text(
                "Submit",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              )),
        ),
      )
    );
  }
}
