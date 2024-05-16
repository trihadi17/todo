import 'package:flutter/material.dart';

// Theme
import 'package:todo/theme.dart';

// Pages
import 'package:todo/pages/login_page.dart';

// Transition (Custom Page)
import 'package:todo/transitions/custom_page.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      body: Stack(
        children: [
          Image.asset(
            'assets/shape.png',
            fit: BoxFit.cover,
            width: 190,
          ),
          Column(
            children: [
              onBoard(),
              getStartedButton(context),
            ],
          )
        ],
      ),
    );
  }

  Widget onBoard() {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 164,
          ),
          Image.asset(
            'assets/image_onboarding.png',
            width: 188,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 70,
          ),
          Text(
            'Get things done with TODO',
            style: blackTextStyle.copyWith(
              fontSize: 22,
              fontWeight: bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Sed\nposuere gravida purus id eu\ncondimentum est diam quam.\nCondimentum blandit diam.',
            style: blackTextStyle.copyWith(
              fontSize: 15,
              fontWeight: semiBold,
              color: blackColor.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget getStartedButton(BuildContext context) {
    return Column(
      children: [
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
              // Navigator.pushNamed(context, '/login');
              Navigator.of(context).push(
                CustomPageRoute(page: LoginPage()),
              );
            },
            child: Text(
              'Get Started',
              style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
