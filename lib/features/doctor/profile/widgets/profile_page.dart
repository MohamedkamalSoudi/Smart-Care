import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/home/widgets/custom_bottom_navgbar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 70,),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/Bitmap.png'), 
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt, color: Colors.white, size: 15),
                        onPressed: () {
                          
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Ahmed Mohamed',
                style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              Text(
                'Doctor',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('Ahmed Data',style: TextStyle(color: Colors.blue ,fontSize: 25, fontWeight: FontWeight.bold),),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Ahmed Mohamed'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Dentistry'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('ahmed@gmail.com'),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Sohag'),
              ),
              ListTile(
                leading: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                title: Text(_isPasswordVisible ? '123456789' : '**********'),
                onTap: _togglePasswordVisibility,
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}