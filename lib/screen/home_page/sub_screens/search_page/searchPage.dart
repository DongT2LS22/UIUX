import 'package:ebook/widget/field/searchField.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? _stringValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stringValue = _stringValue ?? "Schedule";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Search",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body:  Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SearchField(),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Radio<String>(
                        value: "Schedule",
                        groupValue: _stringValue,
                        onChanged: (value) {
                          setState(() {
                            _stringValue = value;
                          });
                        }),
                    Text("Schedule",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.black),)
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                        value: "Task",
                        groupValue: _stringValue,
                        onChanged: (value) {
                          setState(() {
                            _stringValue = value;
                          });
                        }),
                    Text("Task",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.black),)
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                        value: "Person",
                        groupValue: _stringValue,
                        onChanged: (value) {
                          setState(() {
                            _stringValue = value;
                          });
                        }),
                    const Text("Person",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.black),)
                  ],
                ),
                const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
