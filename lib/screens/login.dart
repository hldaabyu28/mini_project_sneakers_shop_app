import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/main_screens.dart';


class LoginPage extends StatefulWidget {

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none
                ),
                fillColor: Colors.purple.withOpacity(0.1),
                filled: true,
                prefixIcon: const Icon(Icons.person)),
             ),
             const SizedBox(height: 20,),
             TextField(
                decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none
                ),
                fillColor: Colors.purple.withOpacity(0.1),
                filled: true,
                prefixIcon: const Icon(Icons.password)),
                obscureText: true,
             ),
             const SizedBox(height: 20,),
             SizedBox(
              width: double.infinity,
               child: ElevatedButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(
                      builder: (context) => MainScreen()), 
                      (route) => false);
                }, 
                child: Text("Login" , style: TextStyle(color: Colors.white),) ,
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6F35A5),
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(12),
                  ),
                   padding: EdgeInsets.symmetric(vertical: 12),
                ),),
             )

             
          ],),
        )
        ),
      );
    
  }
}