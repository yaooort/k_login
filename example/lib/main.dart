import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:k_login/flutter_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child:  _LoginView(context),
        ),
      ),
    );
  }


  _LoginView(BuildContext context){
    return FlutterLogin(
      popupOnly: true, // 弹窗模式或页面模式
      popupTapMask: () {
        // 点击外部遮罩
        // SmartDialog.dismiss();
      },
      termsOfService: [
        TermOfService(
            id: "id",
            mandatory: false,
            text: "同意协议",
            linkUrl: "https://www.baidu.com",
            initialValue: true,
            validationErrorMessage: "必须同意协议才可以"),
        TermOfService(
            id: "id",
            mandatory: false,
            text: "用户条款",
            linkUrl: "https://www.baidu.com",
            initialValue: false,
            validationErrorMessage: "条款")
      ],
      additionalSignupFields: [
        UserFormField(
            keyName: "invitationCode",
            displayName: "邀请码",
            defaultValue: '01UT8J',
            // linkUrl: "https://www.baidu.com",
            icon: Icon(Icons.handshake_outlined),
            fieldValidator: (s) {
              // 邀请码验证
              return null;
            },
            userType: LoginUserType.email,
            // tooltip: TextSpan(
            //     text: "点击查看",
            //     recognizer: TapGestureRecognizer()
            //       ..onTap = () {
            //         // 点击查看
            //       })
        ),
      ],
      onLogin: _authUser, // 登录回调
      onSignup: _signupUser, // 注册回调
      onConfirmSignup: _confirmSignup, // 确认注册回调
      onRecoverPassword: _recoverPassword, // 忘记密码回调
      onConfirmRecover: _confirmRecover, // 确认忘记密码回调
      onResendCode: _onResendCode, // 重新发送验证码回调
      // title: "这个是标题",
      validateUserImmediately: true,
      userType: LoginUserType.name,
      // footer: "这个是底部",
      disableCustomPageTransformer: true,
      initialAuthMode: AuthMode.login,
      theme: LoginTheme(
          inputTheme: const InputDecorationTheme(
            filled: true,
          ),
          buttonTheme: LoginButtonTheme(
              backgroundColor: Theme.of(context).colorScheme.secondary)),
      messages: LoginMessages(
        userHint: "邮箱/手机号",
        passwordHint: "密码",
        confirmPasswordHint: "确认密码",
        forgotPasswordButton: "忘记密码?",
        loginButton: "登录",
        signupButton: "注册",
        recoverPasswordButton: "重置密码",
        recoverPasswordIntro: "在此重置密码",
        recoverPasswordDescription: "我们将把您的纯文本密码发送到此邮箱/手机号帐户",
        recoverCodePasswordDescription: "我们将把密码恢复验证码发送到您的邮箱/手机号。",
        goBackButton: "返回",
        confirmPasswordError: "密码不匹配",
        recoverPasswordSuccess: "验证码已发送",
        flushbarTitleSuccess: "成功",
        flushbarTitleError: "错误",
        signUpSuccess: "已发送激活链接",
        providersTitleFirst: "或其他方式登录",
        providersTitleSecond: "或",
        additionalSignUpSubmitButton: "提交或跳过",
        additionalSignUpFormDescription: "请填写此表单以完成注册",
        confirmRecoverIntro: "设置新密码的恢复验证码已发送到您的电子邮箱/手机号。",
        recoveryCodeHint: '恢复验证码',
        recoveryCodeValidationError: '恢复验证码为空',
        setPasswordButton: '设置密码',
        confirmRecoverSuccess: '密码已恢复。',
        confirmSignupIntro: "验证码已发送到您的电子邮箱/手机号\n请输入验证码以确认您的帐户。",
        confirmationCodeHint: '确认验证码',
        confirmationCodeValidationError: '验证码为空',
        resendCodeButton: '重新发送验证码',
        resendCodeSuccess: '已发送新验证码。',
        confirmSignupButton: '确认',
        confirmSignupSuccess: '帐户已确认。',
      ),
      userValidator: (s){
        // 账号验证
        return null;
      },
      passwordValidator:(s){
        // 密码验证
        return null;
      },
      loginProviders: <LoginProvider>[
        // 其他登录方式
        LoginProvider(
          button: Buttons.google,
          // icon: FontAwesomeIcons.google,
          label: 'Google login',
          callback: () async {
            return "ERR";
          },
        ),
        LoginProvider(
          // button: Buttons.apple,
          icon: Icons.apple,
          label: 'Apple',
          callback: () async {
            return null;
          },
        ),
        LoginProvider(
          // button: Buttons.microsoft,
          icon: Icons.desktop_windows,
          label: 'Microsoft',
          callback: () async {
            return null;
          },
        ),
        LoginProvider(
          // button: Buttons.twitter,
          icon: Icons.safety_divider,
          label: 'Twitter',
          callback: () async {
            return null;
          },
        ),
      ],
      onSubmitAnimationCompleted: () {
        // SmartDialog.dismiss(); // 成功后关闭弹窗回调
        // Navigator.pushNamed(context, '/home');
      },
    );
  }
  Future<String?> _authUser(LoginData data) async {
    debugPrint("登录回调");
    debugPrint(data.name);
    debugPrint(data.password);
    return null;
  }
  Future<String?> _signupUser(SignupData data) async {
    debugPrint("注册回调，这里需要发送验证码");
    debugPrint(data.name);
    debugPrint(data.password);
    return null;
  }
  Future<String?> _recoverPassword(String data) async {
    debugPrint("忘记密码回调，这里需要发送验证码");
    debugPrint(data);
    return null;
  }
  Future<String?> _confirmSignup(String data,LoginData loginData) async {
    debugPrint("确认注册回调");
    debugPrint(data);
    debugPrint(loginData.name);
    debugPrint(loginData.password);
    return null;
  }
  Future<String?> _confirmRecover(String data,LoginData loginData) async {
    debugPrint("确认忘记密码回调");
    debugPrint(data);
    debugPrint(loginData.name);
    debugPrint(loginData.password);
    return null;
  }
  Future<String?> _onResendCode(SignupData data) async{
    debugPrint("重新发送验证码回调");
    debugPrint(data.name);
    debugPrint(data.password);
    return null;
  }

}


