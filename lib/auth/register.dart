import 'package:smartpower/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:smartpower/firebase-backend/firebase_auth_services.dart';
import 'package:smartpower/pages/pagestorage.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controllerFulname_ = TextEditingController();

  TextEditingController controllerEmail_ = TextEditingController();

  TextEditingController controllerPhone_ = TextEditingController();

  TextEditingController controllerUsername_ = TextEditingController();

  TextEditingController controllerMeter_ = TextEditingController();

  TextEditingController controllerPassword_ = TextEditingController();
  TextEditingController controllerPasswordRepeat = TextEditingController();

  final key_ = GlobalKey<FormState>();

  final AuthService auth = AuthService();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controllerFulname_.dispose();
    controllerEmail_.dispose();
    controllerPhone_.dispose();
    controllerMeter_.dispose();
    controllerPassword_.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's Register Account ",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Rubik-medium',
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Hello user , you have a grateful journey",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 30,
                    fontFamily: 'Rubik-Italic',
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),

          //form for user login
          Form(
            key: key_,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Full name
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "name required*";
                      }

                      return null;
                    },
                    controller: controllerFulname_,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        borderSide: BorderSide(
                            width: 3,
                            color: Colors.grey,
                            style: BorderStyle.none),
                      ),
                      hintText: "e.g Essel Apusiga",
                      label: Text("Your name"),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //email
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controllerEmail_,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "email required*";
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(
                            width: 3,
                            color: Colors.grey,
                            style: BorderStyle.none),
                      ),
                      hintText: "e.g abrahamessel156@gmail.com",
                      label: Text("Email"),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //phone
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controllerPhone_,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "phone required*";
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(
                            width: 3,
                            color: Colors.grey,
                            style: BorderStyle.none),
                      ),
                      hintText: "(MOMO prefered) e.g 0532911103",
                      label: Text("Phone"),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //Meter number
                  TextFormField(
                    controller: controllerMeter_,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "meter no. required*";
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.grey,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintText: "Enter your meter number",
                      label: Text("Meter no."),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //Password
                  TextFormField(
                    controller: controllerPassword_,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "password required*";
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(
                            width: 3,
                            color: Colors.grey,
                            style: BorderStyle.none),
                      ),
                      hintText: "set password",
                      label: Text("Password"),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //repeat password
                  TextFormField(
                    controller: controllerPasswordRepeat,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "repeat password required*";
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(
                            width: 3,
                            color: Colors.grey,
                            style: BorderStyle.none),
                      ),
                      hintText: "type password again",
                      label: Text("Repeat password"),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: signup,
                      style: const ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 8, 1, 74),
                          ),
                          side: WidgetStatePropertyAll(BorderSide.none)),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const Login(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(0.0, 1.0);
                                  const end = Offset.zero;
                                  const curve = Curves.ease;

                                  final tween = Tween(begin: begin, end: end);
                                  final curvedAnimation = CurvedAnimation(
                                    parent: animation,
                                    curve: curve,
                                  );

                                  return SlideTransition(
                                    position: tween.animate(curvedAnimation),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 8, 1, 74),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Sign in",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void signup() {
    if (key_.currentState!.validate()) {
      if (controllerPassword_.text != controllerPasswordRepeat.text) {
        showDialog(
          context: context,
          builder: (context) => SizedBox(
            width: 100,
            child: AlertDialog(
              alignment: Alignment.center,
              title: const Text("Password Mismatched"),
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              actionsPadding: const EdgeInsets.all(8),
              iconColor: Colors.white,
              iconPadding: const EdgeInsets.all(2),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              backgroundColor: const Color.fromARGB(255, 8, 1, 74),
              // icon: Icon(Icons.info, size: 100),
              actions: [
                Center(
                  child: Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Okay"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        showDialog(
            context: context,
            builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                  ),
                ));

        Map<String, dynamic> users = {
          "Name": controllerFulname_.text,
          "Email": controllerEmail_.text,
          "Phone": controllerPhone_.text,
          "Meter Number": controllerMeter_.text,
          "Password": controllerPassword_.text,
        };

        auth.addUserDetails(users).then(
          (value) {
            auth
                .createUserWithEmailAndPassword(
                  controllerEmail_.text,
                  controllerPassword_.text,
                )
                .then(
                  (value) => Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const Home(
                        index: 0,
                      ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.ease;

                        final tween = Tween(begin: begin, end: end);
                        final curvedAnimation = CurvedAnimation(
                          parent: animation,
                          curve: curve,
                        );

                        return SlideTransition(
                          position: tween.animate(curvedAnimation),
                          child: child,
                        );
                      },
                    ),
                  ),
                );
          },
        );
      }

      // controllerEmail_.clear();
      // controllerPassword_.clear();
    }
  }
}
