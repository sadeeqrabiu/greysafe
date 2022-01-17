import 'package:firebasetest/view/dashboard_screen.dart';
import 'package:flutter/material.dart';


class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  @override
  Widget build(BuildContext context) {
    //Media Query
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height*0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                     IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.settings,
                          size: 30,
                        )),

                  Text('Hasbiyalah',style: TextStyle(fontWeight: FontWeight.bold),),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 30,
                      )),
                ],
              ),
            ),

            SizedBox(height: height*0.2,),
            Container(
                height: height*0.35,
                width: width*0.7,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/sos.png"),
                      fit: BoxFit.fill,
                    )
                )
            ),
            SizedBox(height: height*0.2,),
            Container(
                height: height*0.07,
                width: width*0.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.dashboard,
                          size: 30,
                        )),

                    const Text('Dashbord'),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 30,
                        )),
                  ],
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  DashboardScreen()),
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}
