import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_project_shoes_app/helpers/database.dart';
import 'package:mini_project_shoes_app/models/user_model.dart';
import 'package:mini_project_shoes_app/views/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isVisible = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Color(0xFF4F4FEC).withOpacity(0.1),
                      filled: true,
                      prefixIcon: const Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                      
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
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                   TextFormField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
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
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  Gap(6),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            final db = DatabaseHelper();
                            db.signup(Users(
                              usrName: usernameController.text, 
                              usrPassword: passwordController.text

                              )).whenComplete(() {
                                  Navigator.push(
                                    context,MaterialPageRoute(builder: (context) => LoginPage())
                                  );
                              });
                          }
                        },
                        child: Text('Register', style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4F4FEC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      ),
                  ),
                    
                     Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                              onPressed: () {
                                //Navigate to sign up
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: const Text("Login"))
                        ],
                      ),
                      
                      ],
                    )
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
