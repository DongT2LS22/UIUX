import 'package:ebook/constant.dart';
import 'package:ebook/widget/field/inputField.dart';
import 'package:flutter/material.dart';

class AccoutPage extends StatelessWidget {
  static String route = 'accout';

  AccoutPage({Key? key}) : super(key: key);
  TextEditingController _nameController = TextEditingController(text: userDefault.name);
  TextEditingController _emailController = TextEditingController(text: userDefault.email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Account setting",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/elonmusk.png'),
                                fit: BoxFit.cover,
                              ),
                              border: const Border(
                                bottom: BorderSide(color: Colors.grey),
                                top: BorderSide(color: Colors.grey),
                                left: BorderSide(color: Colors.grey),
                                right: BorderSide(color: Colors.grey),
                              ),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            child: Center(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  size: 17,
                                  color: Colors.black,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InputField(title: "Name", hint: "Enter your name" , controller: _nameController,),
                InputField(title: "Email", hint: "Enter your email" , controller: _emailController,),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                    onPressed: () {
                      userDefault.name = _nameController.text;
                      userDefault.email = _emailController.text;
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue),
                      child: const Center(
                        child: Text(
                          "Edit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }

}
