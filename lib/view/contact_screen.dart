import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/model/user.dart';
import 'package:firebasetest/view/gender_screen.dart';
import 'package:firebasetest/widget/button.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  UserProfile _profile = UserProfile();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _lgaController = TextEditingController();


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
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: height*0.05),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 30,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.08,),
                  Container(
                    margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Contact Details',
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
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Email',
                                  ),
                                  validator: (value){
                                    if(value!.length <= 10){
                                      return 'is that an Email?';
                                    }
                                    if(value.isEmpty){
                                      return 'Email field cant be Empty';
                                    }
                                  },
                                ),
                                SizedBox(height: height*0.02,),
                                TextFormField(
                                  enabled: !isLoading,
                                  keyboardType: TextInputType.text,
                                  controller: _addressController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'address',
                                  ),
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'address field cant be empty';
                                    }
                                    if(value.length <= 5){
                                      return 'is that even an address?';
                                    }
                                  },
                                ),
                                SizedBox(height: height*0.02,),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: _lgaController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'LGA',
                                  ),
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'LGA cant be Empty?';
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
                                          _userinfodata();
                                          setState(() {
                                            isLoading = false;
                                          });

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  GenderScreen()),
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

    _profile.Email = _emailController.text;
    _profile.Address = _addressController.text;
    _profile.lga = _lgaController.text;

    await FirebaseFirestore.instance
        .collection('user')
        .doc(_auth.currentUser?.uid)
        .collection('profile')
        .add(_profile.toJson());
  }
}
