import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Icon(
        Icons.home_work_outlined,
        color: Colors.amber,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              child: Center(
                child: Text(
                  "LOGO",
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                  ),
              ),
              height: 300, //pixel
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 179, 197, 233), //0xff before the hexa color bb14aa
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    opacity: 0.3
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1.5,
                        spreadRadius: 1
                      )
                    ],
                    border: Border.all()
                 //rounded border radius,
              ),
            ),
         
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter username"
              ),

            ),


            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter password"
              ),
            ),

            ElevatedButton(
              onPressed: (){}, 
              child: Text("LOGIN"))
          ],
        ),
      ),
    );
  }
}