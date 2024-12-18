import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttering_class_one/home_page.dart';
import 'package:fluttering_class_one/registration_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  String textname = "";

  String name = "";
  String password = "";

  bool exist = false;

  
  Future<bool> checkExist(String docID) async {
    try {
      await FirebaseFirestore.instance
      .doc("students/$docID")
      .get().then((doc) {
        if (doc.exists) {
          //if document exist, check user password
          //here I made the document ID as user mobile number

          Map<String, dynamic> data = doc.data()!;
          // You can then retrieve the value from the Map like this:
          name = data['name'];
          password = data['password'];

          if (password == _password.text) {
           //
            exist = true;
            //if entered password is correct, go to next screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  user_name: name,
                ),));
          }

        //if entered value is not equal to document password
        else if (password != _password.text) {
            print("Worng password");
            setState(() {
              textname = "كلمة مرور خاطئة";
            });
          }
        }
        
        //if document not exists
        else if (!doc.exists) {
          exist = false;
          setState(() {
          print("user not found");
          textname =  "اعد المحاولة مرة أخرى";
        });
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
      return exist;
    } catch (e) {
      // If any error
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.flutter_dash_rounded),
              Text("كورس فلاترينج",
              style: GoogleFonts.tajawal(
                color: Colors.blue
              ) ,),
            ],
          ),
        ),
      
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  image: DecorationImage(
                    image: NetworkImage("https://flutter-ko.dev/assets/images/docs/catalog-widget-placeholder.png"),
                    fit: BoxFit.cover,
                    opacity: 0.3
                    ),
                    border: Border.all(),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1.5,
                        spreadRadius: 1
                      )
                    ]
                ),
              ),
      
              TextFormField(
                controller: _username,
                decoration: InputDecoration(
                  hintText: "اكتب رقم الجوال"
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
                onPressed: (){

                  checkExist(_username.text);

                  // setState(() {
                  //   textname =  _username.text; //setState to change the text حالياً
                  // });
      
                  // if(_username.text == "nayra"
                  // && _password.text == "123"){
                  //   setState(() {
                  //   textname =  "تم تسجيل الدخول بنجاح";
                  // });
                  // Navigator.push(
                  //   context, 
                  //   MaterialPageRoute(
                  //     builder: (context)=> HomePage(
                  //     user_name: _username.text,
                  //     )),
                  // );
                  // }
                  // else {
                  //    setState(() {
                  //   textname =  "اعد المحاولة مرة أخرى"; //setState to change the text حالياً
                  // });
                  // }
                }, 
                child: Text("تسجيل الدخول")),

                 TextButton(
                  onPressed: () {
                   Navigator.push(context, 
                   MaterialPageRoute(builder: (context)=> RegistrationPage()));
                  }, 
                  child: Text("تسجيل حساب جديد")),
      
              Text(textname)
            ],
            ),
        ),
      ),
    );
  }
}