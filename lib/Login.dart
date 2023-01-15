import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? student = true;
  bool? teacher = false;
  bool? parent = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Intecc App'),
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(
              height: height,
              width: width,
              color: const Color(0xff3D348B),
            ),
            Container(
              height: height * .6,
              width: width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    width * .03, height * .01, width * .03, height * .01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (student!) {
                            } else {
                              setState(() {
                                student = true;
                                parent = false;
                                teacher = false;
                              });
                            }
                          },
                          child: Container(
                            height: height * .04,
                            width: width * .25,
                            decoration: BoxDecoration(
                                color:
                                    student! ? Color(0xff3D348B) : Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(width * .4))),
                            child: Center(
                              child: Text(
                                "Student",
                                style: TextStyle(
                                    color:
                                        student! ? Colors.white : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (teacher!) {
                            } else {
                              setState(() {
                                teacher = true;
                                student = false;
                                parent = false;
                              });
                            }
                          },
                          child: Container(
                            height: height * .04,
                            width: width * .25,
                            decoration: BoxDecoration(
                                color:
                                    teacher! ? Color(0xff3D348B) : Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(width * .4))),
                            child: Center(
                              child: Text(
                                "Teacher",
                                style: TextStyle(
                                    color:
                                        teacher! ? Colors.white : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (parent!) {
                            } else {
                              setState(() {
                                parent = true;
                                student = false;
                                teacher = false;
                              });
                            }
                          },
                          child: Container(
                            height: height * .04,
                            width: width * .25,
                            decoration: BoxDecoration(
                                color: parent!
                                    ? const Color(0xff3D348B)
                                    : Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(width * .4))),
                            child: Center(
                              child: Text(
                                "Parent",
                                style: TextStyle(
                                    color:
                                        parent! ? Colors.white : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .04,
                    ),
                    Container(
                      width: width,
                      height: height * .06,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(14),
                          )),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(width * .04, height * .009,
                            width * .04, height * .009),
                        child: TextFormField(
                            decoration: const InputDecoration(
                          hintText: "Username",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: height * .04,
                    ),
                    Container(
                      width: width,
                      height: height * .06,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(14),
                          )),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(width * .04, height * .009,
                            width * .04, height * .009),
                        child: TextFormField(
                            decoration: const InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: height * .04,
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(width * .3))),
                      child: Container(
                        width: width * .5,
                        height: height * .055,
                        decoration: BoxDecoration(
                            color: const Color(0xff3D348B),
                            borderRadius:
                                BorderRadius.all(Radius.circular(width * .3))),
                        child: Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: height * .02),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .04,
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(width * .3))),
                      child: Container(
                        width: width * .5,
                        height: height * .055,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(width * .3))),
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                width: width * .2,
                              ),
                              Text(
                                "Sign up",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * .02),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
