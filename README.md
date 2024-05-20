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
    phone_sign_in: ^version;
```

## 전화번호 입력

- 사용자가 입력한 전화번호에 `@` 이 들어가 있으면 이메일 회원 가입 또는 로그인을 한다. 사용자가 국가 선택을 했어도 무시하고, 이메일로 로그인한다. 만약, 이전에 가입되어져 있지 않으면 가입을 한다.

- 사용자가 전화번호가 `+` 으로 시작하면, 사용자가 입력한 전화번호 자체가 국제 전화번호 포멧으로 인식하여 선색된 국가 정보를 무시고, 사용자가 입력한 전화번호로 로그인을 한다.
  - 예를 들면, 사용자가 국가를 `필리핀`으로 선택한 다음, `+1 1111 1111 11` 와 같이 맨 처음에 `+1` 을 넣어 미국 전화번호를 입력하면, 국가 선택이 `필리핀`으로 되어져 있지만, 무시하고 사용자가 입력한 `+1 1111 1111 11` 으로 파이어베이스 전화번호 로그인을 시도한다.



## countryPickerOptions

`countryPickerOptions` 는 국가를 선택 할 수 있게 해 준다. 이 옵션이 생략되면, 위젯에서 국가 선택 화면을 보여주지 않는다.


## countryCode

국가 코드를 선택할 수 있는 버튼을 보여주지 않고, 그냥 국가 코드를 고정시킨다. 이 경우 사용자는 국가를 변경 할 수 없다.


## firebaseAuthLanguageCode

파이어베이스 전화번호 로그인에서 사용할 기본 언어이다.

## onCompletePhoneNumber

`onCompletePhoneNumber` 는 국제 전화번호 포멧이 필요한 경우 호출되는 함수이고, 국제 전화번호 포멧을 리턴해야하는 함수이다.

사용자가 입력한 전화번호를 국제 전화번호 포맷으로 바꾸어 리턴하면, Firebase phone sign-in 으로 전송하여 로그인을 하는 것이다. 이 함수가 생략되면 선택된 국가 코드에 맞춰서 자동으로 국제 전화번호를 표시한다.
이 함수는 주로, `countryPickerOptions` 와 `countryCode` 를 지정하지 않을 때 사용하는데, 사용자가 직접 "+821012345678" 과 같이 국제 전화번호를 입력해야하는데, "01012345678"와 같이 입력한 경우, 이 함수에서 적절히 국제 전화번호 포멧으로 변경해서 리턴하면 된다.

주의, 사용자가 입력한 전화번호가 `+` 로 시작하면, onCompletePhoneNumber 함수가 호출되지 않는다. 즉, 사용자가 입력한 전화번호가 완전한 국제 전화번호라고 인식을 하여, 국제 전화번호로 변환하는 함수를 호출하지 않는 것이다.

즉, `countryPickerOptions` 와 `countryCode` 를 지정하지 않는 경우, 사용자가 `+` 로 시작하는 전화번호를 입력하지 않으면, 전화번호를 국제 전화번호 포멧으로 리턴하는 것이다.

사용자가 입력한 전화번호에서 불필요한 특수문자를 뺀 전화번호가 콜백 함수로 넘어온다. 이 때, 전화번호가 0 으로 시작하면 0을 빼고 리턴한다. 예를 들어 사용자가 010-1111-2222 와 같이 입력하면 `1011112222` 가 파라메타로 넘어온다.






## onDisplayPhoneNumber

화면에 보여줄 전화번호이다. `onCompletePhoneNumber` 와는 다르게, Firebase phone sign-in 에 사용되지 않고, 그냥 화면에 보여줄 전화번호이다.

예를 들어, 한국 사람만 회원 가입하는 경우, 전화번호가 `"+82" (KR)` 로 고정할 수 있는데, 이 때 화면에 "+821012345678" 으로 보여주는 것 보다 "010-1234-5678"로 보여 줄 수 있다.

특히, 전화번호를 입력하고 SMS 코드를 보낸 경우, 화면에 표시 할 전화번호로 사용된다.

이 콜백 함수에는 국제 전화번호가 전달되어 온다. 보다 정확하게는 `onCompletePhoneNumber` 가 리턴하는 값이 전달되어져 오는 것이다.


## 몇 개 국가의 전화번호만 받기

한국과 필리핀 두 개의 국가만 지원하는 경우, `countryPickerOptions` 와 `countryCode` 를 지정하지 않고, 사용자가 자유롭게 전화번호를 "010-1234-5678" 또는 "0917-111-2222" 와 같이 입력하도록 한다.

그래서 `onCompletePhoneNumber` 에서는 전화번호가 010 으로 시작하면 +821012345678 로 변경하고, 09 로 시작하면 +639171112222 와 같이 변경해서 리턴하면 된다.

그리고 화면에 표시하는 전화번호는 `onDisplayPhoneNumber` 에서 적절히 표현을 해 주면 된다.






## no country code picker

- If the app does not set `countryCode` and `countryPickerOption`, then the user cannot choose a country. The user must input the international phone number by himself.


## countryCode

- 이 값은 'KR', 'PH' 와 같이 두 자리 국가 코드를 대문자로 지정하면 된다.

- 이 값이 지정되면, 해당 국가 코드가 자동 선택되며 사용자는 변경을 할 수 없다.



## onSignInFailed

로그인 실패 할 때 호출되는 콜백 함수로, `FirebaseAuthException` 이 전달되어져 온다.


## specialAccount

리뷰를 위한 임시 전화번호를 기록하는 것이다.


- `reviewPhoneNumber` 와 `reviewSmsCode` 는 임시 전화번호와 SMS 코드이다. `reviewPhoneNumber` 에는 국제 전화번호 포멧으로 저장해야 한다. 그리고 사용자가 입력하는 전화번호가 국제 전화번호 포멧으로 변경된 다음, `reviewPhoneNumber` 와 일치하는지 비교를 해서 일치하면 리뷰용 (임시) 로그인을 진행한다.

- `reviewEmail` 와 `reviewPassword` 은 임시 전화번호와 SMS 코드를 입력하면 로그인을 할 리뷰용 메일 주소와 비밀번호이다.

- `emailLogin` 이 true 이면, 전화번호 대신에 `test@test.com:12345a` 와 같이 이메일과 비밀번호로 로그인 (자동가입)을 할 수 있다.




## labelEmptyCountry

- 선택된 국가가 없을 때 보여 줄 위젯. 국가를 선택하면 이 위젯이 사라지고 국가 정보가 나타난다.


## 에러 핸들링

에러가 발생하면 `onSignInFailed` 콜백 함수가 호출되며 `FirebaseAuthException` 이 인자로 넘어온다. 이 에러 인자를 가지고 적절히 사용자에게 에러 메시지를 알려주면 된다.

```dart
PhoneSignIn(
  onSignInFailed: (FirebaseAuthException e) {
  if (e.code == 'web-context-cancelled') {
    print('The interaction was cancelled by the user.');
  } else if (e.code == 'missing-client-identifier') {
    print("We couldn't verify your phone number at the moment. Please ensure you entered a valid phone number and try again.");
  } else if (e.code == 'too-many-requests') {
    print('We have blocked all requests from this device due to unsual activity. Please try again later');
  } else if (e.code == 'invalid-verification-code') {
    print('Oops! Incorrect code, Please double-check the code sent to your phone and try again.');
  } else {
    dog(
      'FirebaseAuthException : $e',
    );
    throw e;
  }
}
```