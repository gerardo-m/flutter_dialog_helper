import 'package:flutter/material.dart';

Future<void> showErrorMessage(
      BuildContext context, String errorMessage) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.error),
          content: Text(errorMessage),
        );
      },
    );
  }

  Future<void> showSuccessMessage(BuildContext context, String message) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.check),
          content: Text(message),
        );
      },
    );
  }

  Future<bool?> showConfirmationMessage(
      BuildContext context, String title, String message,
      {String confirmButtonText = 'Ok', String cancelButtonText = 'Cancel'}) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              child: Text(confirmButtonText),
              onPressed: (){
                Navigator.pop(context, true);
              },
            ),
            ElevatedButton(
              child: Text(cancelButtonText),
              onPressed: (){
                Navigator.pop(context, false);
              },
            )
          ],
        );
      },
    );
  }

  Future<String?> showGetTextDialog(BuildContext context, String title, {String confirmButtonText = 'Ok', String initialValue = ''}) async{
    final TextEditingController controller = TextEditingController(text: initialValue);
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
          ),
          actions: [
            ElevatedButton(
              child: Text(confirmButtonText),
              onPressed: (){
                String text = controller.value.text;
                Navigator.pop(context, text);
              },
            ),
          ],
        );
      },
    );
  }