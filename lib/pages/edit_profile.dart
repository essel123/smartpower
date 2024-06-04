import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});


  @override
  State<EditProfile> createState() => _EditProfileState();
}

TextEditingController controllerFulname_ = TextEditingController();

TextEditingController controllerEmail_ = TextEditingController();

TextEditingController controllerPhone_ = TextEditingController();

TextEditingController controllerusername_ = TextEditingController();

TextEditingController controllerMeter_ = TextEditingController();

TextEditingController controllerPassword_ = TextEditingController();

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    controllerFulname_.text = "Essel Apusiga Abraham";
    controllerEmail_.text = "abrahamessel156@gmail.com";
    controllerPhone_.text = "0532911103";
    controllerusername_.text = "essel_";
    controllerMeter_.text = "45893";
    controllerPassword_.text = "essel123";
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_outlined),
          ),
          const SizedBox(
            width: 340,
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          //form for user login
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Full name
                TextFormField(
                  controller: controllerFulname_,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                          width: 3,
                          color: Colors.grey,
                          style: BorderStyle.none),
                    ),
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
                  controller: controllerEmail_,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.grey,
                        style: BorderStyle.none,
                      ),
                    ),
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
                  controller: controllerPhone_,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                          width: 3,
                          color: Colors.grey,
                          style: BorderStyle.none),
                    ),
                    hintText: "Phone",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //username
                TextFormField(
                  controller: controllerusername_,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                          width: 3,
                          color: Colors.grey,
                          style: BorderStyle.none),
                    ),
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                          width: 3,
                          color: Colors.grey,
                          style: BorderStyle.none),
                    ),
                    hintText: "Meter No.",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                const SizedBox(
                  height: 20,
                ),

                //Password
                TextFormField(
                  controller: controllerPassword_,
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
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 35, 2, 248),
                        ),
                        side: WidgetStatePropertyAll(BorderSide.none),
                      ),
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
