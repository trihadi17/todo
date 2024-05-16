import 'package:flutter/material.dart';

// Theme
import 'package:todo/theme.dart';

class RegistrationPage extends StatelessWidget {
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
                fullnameInput(),
                emailInput(),
                passwordInput(),
                confirmPasswordInput(),
                registerButton(context),
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
            height: 184,
          ),
          Text(
            'Welcome Onboard!',
            style: blackTextStyle.copyWith(
              fontSize: 22,
              fontWeight: bold,
              color: blackColor.withOpacity(0.9),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Lets help you in completing your tasks',
            style: blackTextStyle.copyWith(
              fontSize: 15,
              fontWeight: semiBold,
              color: blackColor.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget fullnameInput() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Text(
              'Full Name',
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
                hintText: 'Your Full Name',
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

  Widget emailInput() {
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
        ],
      ),
    );
  }

  Widget confirmPasswordInput() {
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
              'Confirm Password',
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
                hintText: 'Confirm Password',
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
        ],
      ),
    );
  }

  Widget registerButton(BuildContext context) {
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
              Navigator.pop(context);
            },
            child: Text(
              'Register',
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
            "Already have an account ?",
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
              Navigator.pop(context);
            },
            child: Text(
              'Sign In',
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
