# Phone Sign In

This is a Flutter package that simplifies the process of implementing Google phone sign-in in your application.

## Features

- Easy integration with Google Sign-In
- Supports both Android and iOS platforms
- Provides a streamlined UI for phone number input and verification

## Installation

To use this package, add `phone_sign_in` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

Usage
Here is a simple example of how to use the package:

```yaml
dependencies:
    phone_sign_in: ^versionimport 'package:phone_sign_in/phone_sign_in.dart';
```

```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SignInButton(
            onPressed: () async {
              final result = await PhoneSignIn.signInWithPhoneNumber('+1234567890');
              if (result != null) {
                // Handle successful sign in
              } else {
                // Handle sign in failure
              }
            },
          ),
        ),
      ),
    );
  }
}
```

For more detailed usage instructions, please refer to the example project in the repository.

Contributing
Contributions are welcome! Please read our contributing guide to learn about our development process, how to propose bugfixes and improvements, and how to build and test your changes to phone_sign_in.

License
This project is licensed under the MIT License.