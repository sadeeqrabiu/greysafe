import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    //Media query

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
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

                Text('hasbiyalah'),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.add_alert_sharp,
                      size: 30,
                    )),
              ],
            ),
          ),
          SizedBox(height: height*0.02,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Text('Dashboard',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.dashboard,
                      size: 30,
                    )),
              ],
            ),
          ),


          Container(
              height: height*0.2,
              width: width*0.9,
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                color: Colors.blue
              )
          ),
          SizedBox(height: height*0.02,),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: const[
                Text('Recommended',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ))
              ],
            ),
          ),
          SizedBox(height: height*0.02,),
          Container(
            height: height*0.07,
            width: width*0.9,
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
                        Icons.groups,
                        size: 30,
                      )),

                  const Text('Community'),
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
