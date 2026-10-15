import 'package:flutter/material.dart';
import '../database/firestore_service.dart';
import '../widgets/custom_form.dart';
import 'home.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomForm(
      title: "Let's get started",
      subtitle: 'What should we call you?',
      hint: 'Your name',
      buttonText: 'Save',
      onSave: (name) async {
        await FirestoreService.saveName(name);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(name: name)),
        );
      },
    );
  }
}