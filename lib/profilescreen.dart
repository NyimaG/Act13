import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
//import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class profilescreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser;
  void _changePass() async {
    await currentUser!.updatePassword(_newpass.text);
  }

  final TextEditingController _newpass = TextEditingController();
  String email = '';
  //String newpass = '';

  /*void _changePass() async {
    await _auth.createUserWithEmailAndPassword(
      email: '',
      password: _newpass.text,
    );
  }
  */

  profilescreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //title: 'Firebase Auth Demo',
      body: Column(
        children: [
          Text('User Profile',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          Text('Email: $email'),
          TextFormField(
            controller: _newpass,
            decoration: InputDecoration(labelText: 'Change Password'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter some text';
              }
              if (value?.isEmpty ?? false) {
                _changePass();
                return 'Password Changed';
              }

              //return null;
            },
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Logout'),
          )
        ],
      ),
    );
    // title: 'Firebase Auth Demo',
    //home: MyHomePage(title: 'Firebase Auth Demo'),
  }
}
