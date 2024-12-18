import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                
                  Container(
                    width: screenW/2, //from media query
                    child: TextFormField(
                      controller: _mobile,
                      decoration: InputDecoration(
                        hintText: "اكتب رقم الجوال"
                      ),
                    ),
                  ),
            
                  TextFormField(
                    controller: _username,
                    decoration: InputDecoration(
                      hintText: "اكتب اسمك"
                    ),
                  ),
                    
                    
                  TextFormField(
                    controller: _password,
                    decoration: InputDecoration(
                      hintText: "أكتب كلمة المرور"
                    ),
                    obscureText: true,
                  ),
            
                  SizedBox(height: 15,),
            
                   ElevatedButton(
                    onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('students')
                      .doc(_mobile.text)
                      .set({
                      "name": _username.text,
                      "mobile": _mobile.text,
                      "password": _password.text,
                      });

                   Navigator.pop(context);
                    }, 

                    child: Text("تسجيل حساب جديد")),
                  
                  // Text(textname) //error message
              ],
            ),
          ),
        ),
      ),
    );
  }
}