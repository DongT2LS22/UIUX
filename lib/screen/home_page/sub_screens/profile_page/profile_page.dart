import 'package:ebook/constant.dart';
import 'package:ebook/screen/home_page/notificationPage.dart';
import 'package:flutter/material.dart';

import '../../../login_page/landingPage.dart';
import 'accountPage.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  _buildButton({label, icon, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: const Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon,
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, left: 20, top: 15),
                    child: Text(
                      label,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const Icon(Icons.navigate_next)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
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
                        image: DecorationImage(
                          image: AssetImage(userDefault.avatar!),
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
                          border: Border.all(color: Colors.black, width: 1)),
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
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              userDefault.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              userDefault.email,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          _buildButton(
              icon: const Icon(Icons.person),
              label: "My accout",
              onTap: () {
                Navigator.pushNamed(context, AccoutPage.route).then((value){setState(() {

                });});
              }),
          const SizedBox(
            height: 20,
          ),
          _buildButton(
              icon: const Icon(Icons.notifications),
              label: "Notifications",
              onTap: () {
                Navigator.pushNamed(context, NotificationPage.route);
              }),
          const SizedBox(
            height: 20,
          ),
          _buildButton(
              icon: const Icon(Icons.settings), label: "Setting", onTap: () {}),
          const SizedBox(
            height: 20,
          ),
          _buildButton(
              icon: const Icon(Icons.help), label: "Help Center", onTap: () {}),
          const SizedBox(
            height: 20,
          ),
          _buildButton(
              icon: const Icon(Icons.logout),
              label: "Log out",
              onTap: () => Navigator.pushNamed(context, LandingPage.route)),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
