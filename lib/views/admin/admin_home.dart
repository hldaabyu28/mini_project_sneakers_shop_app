import 'package:flutter/material.dart';
import 'package:mini_project_shoes_app/controllers/product_controller.dart';
import 'package:mini_project_shoes_app/helpers/database.dart';
import 'package:mini_project_shoes_app/views/admin/widgets/admin_product.dart';
import 'package:mini_project_shoes_app/views/login.dart';
import 'package:provider/provider.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context , listen: false);
    return Scaffold(
      backgroundColor: Color(0xFFE0DEEB),
      appBar: AppBar(
        title: Text('Admin' , style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFF4F4FEC),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: (){
              productController.getProducts();
          }, icon: Icon(Icons.refresh_outlined)),

          IconButton(
            onPressed: () async{
              await DatabaseHelper().logout();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AdminProduct(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/addproduct');
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xFF4F4FEC),
      ),
      
    );
  }
}