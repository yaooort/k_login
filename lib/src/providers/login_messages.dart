import 'package:flutter/material.dart';

class LoginMessages with ChangeNotifier {
  LoginMessages({
    this.userHint,
    this.passwordHint = defaultPasswordHint,
    this.confirmPasswordHint = defaultConfirmPasswordHint,
    this.forgotPasswordButton = defaultForgotPasswordButton,
    this.loginButton = defaultLoginButton,
    this.signupButton = defaultSignupButton,
    this.recoverPasswordButton = defaultRecoverPasswordButton,
    this.recoverPasswordIntro = defaultRecoverPasswordIntro,
    this.recoverPasswordDescription = defaultRecoverPasswordDescription,
    this.goBackButton = defaultGoBackButton,
    this.confirmPasswordError = defaultConfirmPasswordError,
    this.recoverPasswordSuccess = defaultRecoverPasswordSuccess,
    this.flushbarTitleError = defaultflushbarTitleError,
    this.flushbarTitleSuccess = defaultflushbarTitleSuccess,
    this.signUpSuccess = defaultSignUpSuccess,
    this.providersTitleFirst = defaultProvidersTitleFirst,
    this.providersTitleSecond = defaultProvidersTitleSecond,
    this.additionalSignUpSubmitButton = defaultAdditionalSignUpSubmitButton,
    this.additionalSignUpFormDescription =
        defaultAdditionalSignUpFormDescription,
    this.confirmSignupIntro = defaultConfirmSignupIntro,
    this.confirmationCodeHint = defaultConfirmationCodeHint,
    this.confirmationCodeValidationError =
        defaultConfirmationCodeValidationError,
    this.resendCodeButton = defaultResendCodeButton,
    this.resendCodeSuccess = defaultResendCodeSuccess,
    this.confirmSignupButton = defaultConfirmSignupButton,
    this.confirmSignupSuccess = defaultConfirmSignupSuccess,
    this.confirmRecoverIntro = defaultConfirmRecoverIntro,
    this.recoveryCodeHint = defaultRecoveryCodeHint,
    this.recoveryCodeValidationError = defaultRecoveryCodeValidationError,
    this.setPasswordButton = defaultSetPasswordButton,
    this.confirmRecoverSuccess = defaultConfirmRecoverSuccess,
    this.recoverCodePasswordDescription = defaultRecoverCodePasswordDescription
  });

  static const defaultPasswordHint = '密码';
  static const defaultConfirmPasswordHint = '确认密码';
  static const defaultForgotPasswordButton = '忘记密码？';
  static const defaultLoginButton = '登录';
  static const defaultSignupButton = '注册';
  static const defaultRecoverPasswordButton = '恢复';
  static const defaultRecoverPasswordIntro = '在此重置密码';
  static const defaultRecoverPasswordDescription =
      '我们将把您的纯文本密码发送到此电子邮件帐户。';
  static const defaultRecoverCodePasswordDescription =
      '我们将把密码恢复代码发送到您的电子邮件。';
  static const defaultGoBackButton = '返回';
  static const defaultConfirmPasswordError = '密码不匹配！';
  static const defaultRecoverPasswordSuccess = '电子邮件已发送';
  static const defaultflushbarTitleSuccess = '成功';
  static const defaultflushbarTitleError = '错误';
  static const defaultSignUpSuccess = '已发送激活链接';
  static const defaultProvidersTitleFirst = '或使用以下方式登录';
  static const defaultProvidersTitleSecond = '或';
  static const defaultAdditionalSignUpSubmitButton = '提交';
  static const defaultAdditionalSignUpFormDescription =
      '请填写此表单以完成注册';

  static const defaultConfirmRecoverIntro =
      '设置新密码的恢复代码已发送到您的电子邮箱。';
  static const defaultRecoveryCodeHint = '恢复代码';
  static const defaultRecoveryCodeValidationError = '恢复代码为空';
  static const defaultSetPasswordButton = '设置密码';
  static const defaultConfirmRecoverSuccess = '密码已恢复。';
  static const defaultConfirmSignupIntro =
      '确认码已发送到您的电子邮件。'
      '请输入代码以确认您的帐户。';
  static const defaultConfirmationCodeHint = '确认码';
  static const defaultConfirmationCodeValidationError =
      '确认码为空';
  static const defaultResendCodeButton = '重新发送代码';
  static const defaultResendCodeSuccess = '已发送新电子邮件。';
  static const defaultConfirmSignupButton = '确认';
  static const defaultConfirmSignupSuccess = '帐户已确认。';

  /// Hint text of the userHint [TextField]
  /// Default will be selected based on userType
  final String? userHint;

  /// Additional signup form button's label
  final String additionalSignUpSubmitButton;

  /// Description in the additional signup form
  final String additionalSignUpFormDescription;

  /// Hint text of the password [TextField]
  final String passwordHint;

  /// Hint text of the confirm password [TextField]
  final String confirmPasswordHint;

  /// Forgot password button's label
  final String forgotPasswordButton;

  /// Login button's label
  final String loginButton;

  /// Signup button's label
  final String signupButton;

  /// Recover password button's label
  final String recoverPasswordButton;

  /// Intro in password recovery form
  final String recoverPasswordIntro;

  /// Description in password recovery form, shown when the onConfirmRecover
  /// callback is not provided
  final String recoverPasswordDescription;

  /// Go back button's label. Go back button is used to go back to to
  /// login/signup form from the recover password form
  final String goBackButton;

  /// The error message to show when the confirm password not match with the
  /// original password
  final String confirmPasswordError;

  /// The success message to show after submitting recover password
  final String recoverPasswordSuccess;

  /// Title on top of Flushbar on errors
  final String flushbarTitleError;

  /// Title on top of Flushbar on successes
  final String flushbarTitleSuccess;

  /// The success message to show after signing up
  final String signUpSuccess;

  /// The string shown above the Providers buttons
  final String providersTitleFirst;

  /// The string shown above the Providers icons
  final String providersTitleSecond;

  /// The intro text for the confirm recover password card
  final String confirmRecoverIntro;

  /// Hint text of the password recovery code [TextField]
  final String recoveryCodeHint;

  /// The validation error message  to show for an empty recovery code
  final String recoveryCodeValidationError;

  /// Set password button's label for password recovery confirmation
  final String setPasswordButton;

  /// The success message to show after confirming recovered password
  final String confirmRecoverSuccess;

  /// The intro text for the confirm signup card
  final String confirmSignupIntro;

  /// Hint text of the confirmation code for confirming signup
  final String confirmationCodeHint;

  /// The validation error message to show for an empty confirmation code
  final String confirmationCodeValidationError;

  /// Resend code button's label
  final String resendCodeButton;

  /// The success message to show after resending confirmation code
  final String resendCodeSuccess;

  /// Confirm signup button's label
  final String confirmSignupButton;

  /// The success message to show after confirming signup
  final String confirmSignupSuccess;

  /// Description in password recovery form, shown when the onConfirmRecover
  /// callback is provided
  final String recoverCodePasswordDescription;


}
