import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/view/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

enum Status { Waiting, Error }

class OtpScreen extends StatefulWidget {
  final String phone;

  OtpScreen({Key? key, required this.phone}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final int _otpCodelength = 6;
  var _status = Status.Waiting;
  String _otpCode ="";
  late String _verificationCode;
  TextEditingController otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhoneNumber();
  }

  _verifyPhoneNumber()async{

    _auth.verifyPhoneNumber(
        phoneNumber: '+234${widget.phone}',
        verificationCompleted: (phoneAuthcredential)async{},
        verificationFailed: (verificationFailed)async{},
        codeSent: (verificationId, resendingToken)async{
          setState(() {
            _verificationCode = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (codeAutoRetrievalTimeout)async{});
    // await FirebaseAuth.instance.verifyPhoneNumber(
    //   phoneNumber: '+234${widget.phone}',
    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     await FirebaseAuth.instance
    //         .signInWithCredential(credential)
    //         .then((value) async {
    //       if (value.user != null) {
    //         print('user logged in');
    //       }
    //     });
    //   },
    //   verificationFailed: (FirebaseAuthException error) {
    //     debugPrint(error.message);
    //     setState(() {
    //       // isLoading = false;
    //       print('isloading off');
    //     });
    //   },
    //   codeSent: (verificationId, [forceResendingToken]) {
    //     debugPrint('greysafe test 6');
    //     setState(() {
    //       print('isloading off');
    //       _verificationCode = verificationId;
    //     });
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {
    //     debugPrint('grey test 7');
    //     setState(() {
    //       print('isloading off');
    //       _verificationCode = verificationId;
    //     });
    //   },
    //   timeout: const Duration(seconds: 60),
    // );
  }


  _sendCodeToFirebase({String? code})async{
  if(_verificationCode != null) {
    var credential = PhoneAuthProvider.credential(
        verificationId: _verificationCode,
        smsCode: code!);

    await _auth
        .signInWithCredential(credential)
        .then((value){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const InfoScreen()),
              (route) => false);
          })
        .whenComplete(() {})
        .onError((error, stackTrace) {
          otpController.text = "";
          _status = Status.Error;
    });
  }

  }


  @override
  Widget build(BuildContext context) {
    //Media query

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
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
        SizedBox(height: height*0.1,),
        Container(
          margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Enter OTP',
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                      '6 code otp sent to your phone at \n+234-${widget.phone}')
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: PinFieldAutoFill(
            currentCode: _otpCode,
            codeLength: _otpCodelength,
            controller: otpController,
            onCodeChanged: (value) {
              print(value);
              if(value?.length == 6){
                _sendCodeToFirebase(code: value);
              }
            },
          ),
        ),



      ],
    ));
  }
}
