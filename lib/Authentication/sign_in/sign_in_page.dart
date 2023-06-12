import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/Authentication/sign_up/sign_up_page.dart';
import 'package:firebase_test/home_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
  FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
        title: const Text('Sign In Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Text('Sign In'),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                    label: Text('Email'), border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: password,
                decoration: const InputDecoration(
                    label: Text('Password'), border: OutlineInputBorder()),
              ),
              OutlinedButton(
                onPressed: () async {
                  try {
                     await auth.signInWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${e}')));
                  }
                },
                child: const Text('Sign in user'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
