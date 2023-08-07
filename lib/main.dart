import 'package:dhoom/resources/auth_methods.dart';
import 'package:dhoom/screens/home_screen.dart';
import 'package:dhoom/screens/login_screen.dart';
import 'package:dhoom/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lenden',
      debugShowCheckedModeBanner: false,
      routes: {
        '/login':(context)=>const loginScreen(),
        '/home':(contexflut)=>const Home()
      },
      theme: ThemeData.dark(
        useMaterial3: true,
      // ignore: deprecated_member_use
      ).copyWith(scaffoldBackgroundColor: backgroundColor,),
      home:StreamBuilder(stream: authMethods().authChanges,builder: (context, snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasData){
          return Home();
        }
        return const loginScreen();
      },),
       
    );
  }
}

