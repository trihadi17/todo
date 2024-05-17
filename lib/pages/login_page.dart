import 'package:flutter/material.dart';

// Theme
import 'package:todo/theme.dart';

// Page
import 'package:todo/pages/dashboard_page.dart';
import 'package:todo/pages/registration_page.dart';

// Widget
import 'package:todo/widgets/loading_button.dart';

// Transition Page
import '../transitions/custom_page.dart';

// Provider
import 'package:provider/provider.dart';
import 'package:todo/providers/auth_provider.dart';

// Model
import 'package:todo/model/user.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text Editing Controller
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // Provider
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.of(context).pushAndRemoveUntil(
            CustomPageRoute(page: DashboardPage()), (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Login Failed',
            textAlign: TextAlign.center,
          ),
        ));
      }

      setState(() {
        isLoading = false;
      });
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
                controller: emailController,
                textInputAction: TextInputAction.next,
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
                controller: passwordController,
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

    Widget loginButton() {
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
              onPressed: handleSignIn,
              child: Text(
                'Login',
                style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
            ),
          ),
        ],
      );
    }

    Widget signUp() {
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
                isLoading ? LoadingButton() : loginButton(),
                signUp(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
