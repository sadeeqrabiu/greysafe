import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/widget/button.dart';
import 'package:flutter/material.dart';

import 'otp_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _phoneController = TextEditingController();


  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    //Media query

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                },icon: const Icon(Icons.arrow_back,size: 30,)),
              ),
            ],
          ),
          SizedBox(height: height*0.08,),
          Container(
            margin: EdgeInsets.only(left: width*0.05),
            child: Row(
              children: const [
                Text('Email Verification',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(height: height * 0.02,),
          Container(
            margin: EdgeInsets.only(left: width*0.05),
            child: Row(
              children: const [
                Text('Enter your phone number to continue',style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
          SizedBox(height: height * 0.02,),
          Container(
            width: width*0.9,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    enabled: !isLoading,
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,

                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Phone',
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Phone Number cant be empty';
                      }
                    },
                  ),
                  SizedBox(height: height*0.02,),
                  Padding(
                    padding:  const EdgeInsets.all(0.0),
                    child:!isLoading
                        ? ButtonPrimary(
                      text: 'Next',
                      buttonColor: const Color(0xffD25525),
                      width: width*1,
                      onTap: () {
                        if(!isLoading){
                          if(_formKey.currentState!.validate()) {
                            setState(() {

                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  OtpScreen(phone: _phoneController.text)),
                            );
                          }
                        }
                      },
                    )
                        : const CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
