import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluttering Course One"),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Text(
                  "LOGO",
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                  )
                ),
              height: 300, //pixel
              width: 300,
              decoration: BoxDecoration(
                color: const Color(0xffbb14aa), //0xff before the hexa color bb14aa
                borderRadius: BorderRadius.circular(25) //rounded border radius,
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