import 'package:flutter/material.dart';

/// Shows a dialog box with a `title`, an Error icon and an `errorMessage`
Future<void> showErrorMessage(BuildContext context, String errorMessage,
    {String title = 'Error'}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: const Icon(Icons.error),
        title: Text(title),
        content: Text(errorMessage),
      );
    },
  );
}

/// Shows a dialog box with a `title`, a Success icon and a `message`
Future<void> showSuccessMessage(BuildContext context, String message,
    {String title = 'Success!'}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: const Icon(Icons.check),
        title: Text(title),
        content: Text(message),
      );
    },
  );
}

/// Shows a dialog box with a `title` and a `message`/question
/// 
/// Returns true or false if any button in the dialog is presssed. And
/// returns `null` if the dialog is dismissed
Future<bool?> showConfirmationDialog(
    BuildContext context, String title, String message,
    {String confirmButtonText = 'Ok',
    String cancelButtonText = 'Cancel'}) async {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          ElevatedButton(
            child: Text(confirmButtonText),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          ElevatedButton(
            child: Text(cancelButtonText),
            onPressed: () {
              Navigator.pop(context, false);
            },
          )
        ],
      );
    },
  );
}

/// Shows a dialog box with a `title` and a TextBox
/// 
/// Returns the value inside the Textbox, or `null` if the dialog
/// is dismissed
Future<String?> showPromtDialog(BuildContext context, String title,
    {String confirmButtonText = 'Ok', String initialValue = ''}) async {
  final TextEditingController controller =
      TextEditingController(text: initialValue);
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
            onPressed: () {
              String text = controller.value.text;
              Navigator.pop(context, text);
            },
          ),
        ],
      );
    },
  );
}
