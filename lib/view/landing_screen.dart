import 'package:firebasetest/view/login_screen.dart';
import 'package:firebasetest/view/register_screen.dart';
import 'package:firebasetest/widget/button.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    //Media Query
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(

      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: 35,
                  width: 120,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/safe.png"),
                          fit: BoxFit.fill,
                        )
                    )
                ),
              ],
            ),

          ),
          const SizedBox(height: 30,),
          Container(
              height: height*0.35,
              width: width*0.9,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/securitylandingpage.png"),
                    fit: BoxFit.fill,
                  )
              )
          ),

          Column(
            children: const[
              Text('Let’s keep you safe', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              SizedBox(height: 5,),
              Text('with a few clicks!',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
            ],
          ),
          const SizedBox(height: 10,),
          Container(
            height: height*0.08,
            width: width*0.8,
            child: const Text('At GreySafe we prioritize the lives of people ino                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Kaduna State',textAlign: TextAlign.center,),
          ),
          SizedBox(height: height*0.02,),
          ButtonPrimary(
            text: 'Let’s get started',
            buttonColor: const Color(0xffD25525),
            width: width*0.52,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const RegisterScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(height: height*0.1,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const LoginScreen();
              },),);
            },
            child: Container(
              child: const Center(
                child: Text(
                  'already have an account?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
