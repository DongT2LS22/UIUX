import 'package:flutter/material.dart';
class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14),
      height: 52,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.black,
            size: 25,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: TextFormField(
                autofocus: false,
                cursorColor: Colors.black,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 5),
                    hintText: "Search",
                    hintStyle:
                    TextStyle(fontSize: 16, color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 0)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 0))),
              )),
        ],
      ),
    );
  }
}
