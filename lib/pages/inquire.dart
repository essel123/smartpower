import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({super.key});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  final TextEditingController bodycontroller = TextEditingController();
  final TextEditingController subcontroller = TextEditingController();

  Future<void> _sendEmail() async {
    final Email email = Email(
      body: bodycontroller.text,
      subject: subcontroller.text,
      recipients: ['abrahamessel156@gmail.com'], // Replace with recipient email
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email sent successfully!')),
      );

      bodycontroller.clear();
      subcontroller.clear();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send email, try again')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 72,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      style: const TextStyle(),
                      controller: subcontroller,
                      decoration: const InputDecoration(
                          hintText: "Type the Subject of your message here",
                          label: Text("Subject of message"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color.fromARGB(255, 16, 1, 67),
                            width: 2,
                          ))),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent,
                          border: Border.all(
                            color: const Color.fromARGB(255, 16, 1, 67),
                            width: 2,
                          )),
                      child: TextFormField(
                        controller: bodycontroller,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          hintText: "Let's here from you, start typing...",
                          border: InputBorder.none,
                        ),
                        maxLines: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                ),
                child: SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: FloatingActionButton(
                    elevation: 5,
                    backgroundColor: const Color.fromARGB(255, 16, 1, 67),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: _sendEmail,
                    child: const Center(
                      child: Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
