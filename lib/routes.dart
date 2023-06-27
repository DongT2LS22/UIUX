import 'package:ebook/screen/home_page/sub_screens/profile_page/accountPage.dart';
import 'package:ebook/screen/schedule_page/addSchedule.dart';
import 'package:ebook/screen/task_page/addTaskPage.dart';
import 'package:ebook/screen/login_page/landingPage.dart';
import 'package:ebook/screen/home_page/sub_screens/schedules_page/listSchedulePage.dart';
import 'package:ebook/screen/login_page/loginPage.dart';
import 'package:ebook/screen/home_page/notificationPage.dart';
import 'package:ebook/screen/login_page/signupPage.dart';
import 'screen/home_page/homePage.dart';
import 'package:flutter/cupertino.dart';

final Map<String,WidgetBuilder> routes = {
  HomePage.route : (context) => HomePage(),
  LandingPage.route : (context) => const LandingPage(),
  LoginPage.route : (context) => const LoginPage(),
  SignUpPage.route : (context) => const SignUpPage(),
  AddTaskPage.route : (context) => AddTaskPage(),
  AccoutPage.route : (context) => AccoutPage(),
  AddSchedulePage.route : (context) => AddSchedulePage(),
  ListSchedule.route : (context) => const ListSchedule(),
  NotificationPage.route : (context) => const NotificationPage()
};