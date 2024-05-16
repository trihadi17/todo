import 'package:flutter/material.dart';

// Theme
import 'package:todo/theme.dart';

// Page
import 'package:todo/pages/dashboard_page.dart';
import 'package:todo/pages/registration_page.dart';

// Transition Page
import '../transitions/custom_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      body: SingleChildScrollView(
        reverse: true,
        child: Stack(
          children: [
            Image.asset(
              'assets/shape.png',
              fit: BoxFit.cover,
              width: 190,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                emailInput(),
                passwordInput(),
                loginButton(context),
                signUp(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 134,
          ),
          Text(
            'Welcome Back!',
            style: blackTextStyle.copyWith(
              fontSize: 22,
              fontWeight: bold,
              color: blackColor.withOpacity(0.9),
            ),
          ),
          SizedBox(
            height: 33,
          ),
          Image.asset(
            'assets/image_login.png',
            width: 180,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget emailInput() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 33,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Text(
              'Email',
              style: blackTextStyle.copyWith(
                fontSize: 15,
                fontWeight: semiBold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 19,
              vertical: 14,
            ),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: TextFormField(
              style: blackTextStyle.copyWith(
                fontSize: 15,
                fontWeight: regular,
              ),
              decoration: InputDecoration.collapsed(
                hintText: 'Your Email',
                hintStyle: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: semiBold,
                  color: blackColor.withOpacity(0.5),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget passwordInput() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Text(
              'Password',
              style: blackTextStyle.copyWith(
                fontSize: 15,
                fontWeight: semiBold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 19,
              vertical: 14,
            ),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: TextFormField(
              obscureText: true,
              obscuringCharacter: '*',
              style: blackTextStyle.copyWith(
                fontSize: 15,
                fontWeight: regular,
              ),
              decoration: InputDecoration.collapsed(
                hintText: 'Your Password',
                hintStyle: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: semiBold,
                  color: blackColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password?',
              style: toscaTextStyle.copyWith(
                fontSize: 15,
                fontWeight: bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 66,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: toscaColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  CustomPageRoute(page: DashboardPage()), (route) => false);
            },
            child: Text(
              'Login',
              style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget signUp(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don'nt have an account ?",
            style: blackTextStyle.copyWith(
              fontSize: 15,
              fontWeight: semiBold,
              color: blackColor.withOpacity(0.8),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                CustomPageRoute(page: RegistrationPage()),
              );
            },
            child: Text(
              'Sign Up',
              style: toscaTextStyle.copyWith(
                fontSize: 15,
                fontWeight: bold,
                color: toscaColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
