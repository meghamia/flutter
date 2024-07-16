import 'package:flutter/material.dart';
import 'package:mobiledevelopment/sharedpref/HomePage.dart';
import 'package:mobiledevelopment/sharedpref/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  Future<void> _signData(String name, String password, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
    await prefs.setString("password", password);
    await prefs.setString("email", email);
  }

  // Future<bool> checkUserExist(String email ,String password) async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? checkemail = prefs.getString("email");
  //   String? checkpassword = prefs.getString("password");
  //   return checkemail == email && checkpassword == password;
  // }

  @override
  Widget build(BuildContext context) {
    var nameText = TextEditingController();
    var emailText = TextEditingController();
    var passText = TextEditingController();
    final _signKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Signup '),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xffbdc2e8),
              Color(0xff616161),
              Color(0xffdf89b5),
            ])),
            child:
              Form(
                key: _signKey,
                child: Center(
                  child: Container(
                    width: 310,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                            controller: nameText,
                            decoration: InputDecoration(
                                hintText: "Name",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                    color: Color(0xfffbc2eb),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide:
                                        BorderSide(color: Colors.black87)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide:
                                        BorderSide(color: Color(0xffa1c4fd))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide:
                                        BorderSide(color: Color(0xffa6c0fe)))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please fill the required fields";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 11,
                        ),
                        TextFormField(
                            controller: passText,
                            decoration: InputDecoration(
                                hintText: "password",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                    color: Color(0xfffbc2eb),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide:
                                        BorderSide(color: Colors.black87)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide:
                                        BorderSide(color: Color(0xffa1c4fd))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide:
                                        BorderSide(color: Color(0xffa6c0fe)))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please fill the required fields";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 11,
                        ),
                        TextFormField(
                            controller: emailText,
                            decoration: InputDecoration(
                                hintText: "email",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                    color: Color(0xfffbc2eb),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide:
                                        BorderSide(color: Colors.black87)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide:
                                        BorderSide(color: Color(0xffa1c4fd))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide:
                                        BorderSide(color: Color(0xffa6c0fe)))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please fill the required fields";
                              }
                              if (!value.contains('@gmail.com')) {
                                return "Format is incorrect";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 11,
                        ),
                        // ElevatedButton(onPressed: ()async{
                        //   if(_signKey.currentState!.validate()){
                        //     String uname = nameText.text.toString();
                        //     String uemail = emailText.text.toString();
                        //     String upass = passText.text.toString();
                        //     bool userExist = await checkUserExist(uemail, upass);
                        //     if(userExist){
                        //
                        //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("exist user")));
                        //     }else{
                        //       await _signData(uname, upass, uemail);
                        //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        //     }
                        //
                        //   }
                        // }, child: Text("signup")),

                        ElevatedButton(
                            onPressed: () async {
                              if (_signKey.currentState!.validate()) {
                                String uname = nameText.text.toString();
                                String uemail = emailText.text.toString();
                                String upass = passText.text.toString();
                                await _signData(uname, upass, uemail);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            },
                            child: Text("Signup")),
                        SizedBox(
                          height: 11,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Text("Login"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

          ),
        ));
  }
}
