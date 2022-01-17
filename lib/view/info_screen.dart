import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/model/user.dart';
import 'package:firebasetest/view/contact_screen.dart';
import 'package:firebasetest/widget/button.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final _formKey = GlobalKey<FormState>();
  UserProfile _profile = UserProfile();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _middlenameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();


  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    //Media query

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body:  CustomScrollView(
        slivers: [
          SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  // Row(
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.only(top: 20),
                  //       child: IconButton(
                  //           onPressed: () {
                  //             Navigator.pop(context);
                  //           },
                  //           icon: const Icon(
                  //             Icons.arrow_back,
                  //             size: 30,
                  //           )),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: height*0.2,),
                  Container(
                    margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Information',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                                'Enter your credentials to continue')
                          ],
                        ),
                        SizedBox(height: height * 0.05,),
                        Container(
                          width: width*0.9,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  enabled: !isLoading,
                                  keyboardType: TextInputType.text,
                                  controller: _firstnameController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Firstname',
                                  ),
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Firstname field cant be empty';
                                    }
                                    if(value.length <= 2){
                                      return 'is that even a name?';
                                    }
                                  },
                                ),
                                SizedBox(height: height*0.02,),
                                TextFormField(
                                  enabled: !isLoading,
                                  keyboardType: TextInputType.text,
                                  controller: _lastnameController,

                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Lastname',
                                  ),
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Lastname field cant be empty';
                                    }
                                    if(value.length <= 2){
                                      return 'is that even a name?';
                                    }
                                  },
                                ),
                                SizedBox(height: height*0.02,),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: _middlenameController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Middlename',
                                  ),
                                  validator: (value){
                                    if(value!.length == 2 || value.length == 1 ){
                                      return 'is that even a name?';
                                    }
                                  },
                                ),
                                SizedBox(height: height*0.02,),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: _usernameController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Username',
                                  ),
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Username field cant be empty';
                                    }
                                    if(value.length <= 2){
                                      return 'is that even a name?';
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
                                          FirebaseAuth.instance.currentUser?.updateProfile(displayName: _usernameController.text);
                                          _userinfodata();
                                          setState(() {
                                            isLoading = false;
                                          });

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  ContactScreen()),
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
                  ),
                ],
              )
          )
        ],
      ),
    );
  }

  void _userinfodata() async{

    _profile.firstname = _firstnameController.text;
    _profile.lastName = _lastnameController.text;
    _profile.middleName = _middlenameController.text;

    await FirebaseFirestore.instance
              .collection('user')
              .doc(_auth.currentUser?.uid)
              .collection('profile')
              .add(_profile.toJson());
  }
}
