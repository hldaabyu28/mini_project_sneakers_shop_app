import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_project_shoes_app/helpers/database.dart';
import 'package:mini_project_shoes_app/models/user_model.dart';
import 'package:mini_project_shoes_app/views/main_screens.dart';


// Import statements...

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController UsernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;
  bool isLoginTrue = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final db = DatabaseHelper();
  login() async {
    var response = await db
        .login(Users(usrName: UsernameController.text , usrPassword: passwordController.text));
    if (response == true) {
      //If login is correct, then goto notes
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    } else {
      //If not, true the bool value to show error message
      setState(() {
        isLoginTrue = true;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/login.png',
                width: 150,
                height: 150,
              ),
              Gap(6),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                controller: UsernameController,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xFF4F4FEC).withOpacity(0.1),
                  filled: true,
                  prefixIcon: const Icon(Icons.person),
                ),
                validator: (value) {
               
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xFF4F4FEC).withOpacity(0.1),
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                  prefixIcon: const Icon(Icons.password),         
                ),
                obscureText: !isVisible,
                
                validator: (value) {
                     if (value!.isEmpty) {
                          return "password is required";
                        }
                        return null;
                 
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        login();
                      }
                
                
                  //     String email = emailController.text.trim();
                  //     String password = passwordController.text.trim();
                
                  // if (email.isNotEmpty && password.isNotEmpty) {
                  //   try {
                  //     await authController.login(email, password);
                  //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainScreen()), (route) => false);
                  //   } catch (e) {
                  //     // Show error message to user
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(content: Text('Registration failed: $e')),
                  //     );
                  //   }
                  // } else {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(content: Text('Email and password cannot be empty')),
                  //   );
                  // }
                      
                    },
                    child: Text('Login', style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4F4FEC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    
                  ),
              ),
  

                  ],
                )
              ),
              Gap(6),
              Text(
                'Don\'t have an account?',
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(color: Color(0xFF4F4FEC)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
