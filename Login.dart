import 'package:flutter/material.dart';
import 'package:mobiledevelopment/sharedpref/HomePage.dart';
import 'package:mobiledevelopment/sharedpref/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> _saveData(String name, String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
    await prefs.setString("email", email);
    await prefs.setString("password", password);
  }

  Future<bool> _checkUserExist(String email,String password)async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString("email");
    String? savePassword = prefs.getString("password");
    return savedEmail == email && savePassword == password;
  }
  @override
  Widget build(BuildContext context) {
    var nameText = TextEditingController();
    var emailText = TextEditingController();
    var passText = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("ghggdhd"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
            Color(0xffbdc2e8),
            Color(0xff616161),
            Color(0xffdf89b5),
          ], center: Alignment.topCenter)),
          child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                width: 310,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                        controller: nameText,
                        decoration: InputDecoration(
                          hintText: "name..",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(color: Colors.black87),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill required fields";
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 11,
                    ),
                    TextFormField(
                        controller: emailText,
                        decoration: InputDecoration(
                          hintText: "email..",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(color: Colors.black87),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill required fields";
                          }
                          if (!value.contains('@gmail')) {
                            return "format should be correct";
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 11,
                    ),
                    TextFormField(
                        controller: passText,
                        decoration: InputDecoration(
                          hintText: "pass..",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(color: Colors.black87),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill required fields";
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 11,
                    ),


                    // ElevatedButton(
                    //     onPressed: () async {
                    //       if (_formKey.currentState!.validate()) {
                    //         String uname = nameText.text.toString();
                    //         String uemail = emailText.text.toString();
                    //         String upass = passText.text.toString();
                    //         bool userExist =  await _checkUserExist(uemail, upass);
                    //         if(userExist){
                    //           Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    //         }else{
                    //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("user  do not exist"),backgroundColor: Colors.red,));
                    //         }
                    //         // await _saveData(uname, uemail, upass);
                    //         // Navigator.push(
                    //         //     context,
                    //         //     MaterialPageRoute(
                    //         //         builder: (context) => HomePage()));
                    //       }
                    //     },
                    //     child: Text("press Login")),
                    ElevatedButton(onPressed: ()async{
                      if(_formKey.currentState!.validate()){
                        String uname = nameText.text.toString();
                        String uemail = emailText.text.toString();
                        String upass = passText.text.toString();
                        await _saveData(uname, upass, uemail);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      }
                    }, child: Text("Signup")),


                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an Account?",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Text("Signup"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


