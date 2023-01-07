<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Show very simple dialogs in Flutter with a single line.

Keep in mind that these are very minimalistic dialogs with very few options to
customize.

## Installation

### Add to pubspec.yaml
``` yaml
dependencies:
  flutter_dialog_helper: ^0.1.0
```

## Usage

Usually you will want to call any of the methods inside the callback of a button:

### Success Message

```dart
ElevatedButton(
  onPressed: (){
    showSuccessMessage(context, 'Success!!!');
  },
  child: const Text('Success Message'),
),
```

### Error Message

```dart
ElevatedButton(
  onPressed: (){
    showErrorMessage(context, 'Error!!!');
  },
  child: const Text('Error Message'),
),
```

### Confirmation Dialog

```dart
ElevatedButton(
  onPressed: () async{
    bool? confirm = await showConfirmationMessage(context, 'Confirmation', 'Are you sure?');
    setState(() {
      lastConfirmation = confirm;
    });
  },
  child: const Text('Confirmation Dialog'),
),
```

### Prompt Dialog

```dart
ElevatedButton(
  onPressed: () async{
    String? input = await showPromtDialog(context, 'Input dialog',);
    setState(() {
      lastInput = input;
    });
  },
  child: const Text('Prompt Dialog'),
),
```