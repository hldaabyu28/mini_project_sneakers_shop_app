import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/helpers/database.dart';
import 'package:mini_project_shoes_app/views/admin/widgets/add_product.dart';
import 'package:mini_project_shoes_app/views/admin/widgets/admin_product.dart';
import 'package:mini_project_shoes_app/views/login.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async{
              await DatabaseHelper().logout();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
            },
            icon: Icon(Icons.logout),
          ),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/addproduct');
          }, icon: Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AdminProduct(),
          ],
        ),
      ),
      
    );
  }
}