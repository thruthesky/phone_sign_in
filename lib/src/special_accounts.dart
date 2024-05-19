class SpecialAccounts {
  final String reviewEmail;
  final String reviewPassword;
  final String reviewPhoneNumber;
  final String reviewSmsCode;
  final bool emailLogin;

  const SpecialAccounts({
    required this.reviewEmail,
    required this.reviewPassword,
    required this.reviewPhoneNumber,
    required this.reviewSmsCode,
    this.emailLogin = true,
  });
}
