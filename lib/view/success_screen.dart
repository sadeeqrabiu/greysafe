import 'package:firebasetest/view/emergency_screen.dart';
import 'package:firebasetest/widget/button.dart';
import 'package:flutter/material.dart';


class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    //meida query
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: height*0.1, left: width*0.05,right: width*0.05),
        child: Column(
          children: [
            Row(
                children: const [
                  Text(
                    'Congratulations',
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            Row(
              children: const [
                Text(
                    'You have successfully created an account')
              ],
            ),

            SizedBox(height: height*0.05,),
            Container(
                height: height*0.4,
                width: width*0.9,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/succefully.png"),
                      fit: BoxFit.fill,
                    )
                )
            ),

            SizedBox(height: height*0.2,),
            ButtonPrimary(
              text: 'start',
              buttonColor: const Color(0xffD25525),
              width: width*0.52,
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmergencyScreen()),
                        (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
