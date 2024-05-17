import 'package:flutter/material.dart';

// Theme
import 'package:todo/theme.dart';

// Widget
import '../widgets/todolist_widget.dart';

// Package
import 'package:provider/provider.dart';
import 'package:analog_clock/analog_clock.dart';

// Provider
import 'package:todo/providers/auth_provider.dart';

// Model
import 'package:todo/model/user.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    // Get Current User
    UserModel user = authProvider.user;

    Widget header() {
      return Center(
        child: Column(
          children: [
            SizedBox(height: 134),
            ClipOval(
              child: Image.network(
                'https://ui-avatars.com/api/?name=${user.name}&color=7F9CF5&background=EBF4FF&size=150',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome, ${user.name}!',
              style: whiteTextStyle.copyWith(
                fontSize: 22,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget clock() {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 73,
          ),
          child: AnalogClock(
            decoration: BoxDecoration(
                border: Border.all(width: 5, color: Color(0xff3F3D56)),
                color: toscaColor,
                shape: BoxShape.circle),
            height: 127,
            width: 127,
            isLive: true,
            hourHandColor: Color(0xff3F3D56),
            minuteHandColor: Color(0xff3F3D56),
            showSecondHand: true,
            secondHandColor: Colors.red,
            numberColor: Colors.black87,
            showNumbers: true,
            showAllNumbers: true,
            textScaleFactor: 1.5,
            showTicks: true,
            tickColor: whiteColor,
            showDigitalClock: true,
            datetime: DateTime.now(),
            useMilitaryTime: true,
          ),
        ),
      );
    }

    Widget task() {
      return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 18,
              ),
              Container(
                child: Text(
                  'Tasks List',
                  style: blackTextStyle.copyWith(
                    fontSize: 22,
                    fontWeight: bold,
                    color: blackColor.withOpacity(0.9),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 23,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 12,
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Daily Tasks',
                              style: blackTextStyle.copyWith(
                                fontSize: 17,
                                fontWeight: bold,
                                color: blackColor.withOpacity(0.8),
                              ),
                            ),
                            Image.asset(
                              'assets/icon_add.png',
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 20,
                          ),
                          child: Scrollbar(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [TodoListWidget(), TodoListWidget()],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.38,
            width: double.infinity,
            color: toscaColor,
          ),
          Image.asset(
            'assets/shape_white.png',
            fit: BoxFit.cover,
            width: 190,
          ),
          SizedBox(
            height: 134,
          ),
          Column(
            children: [
              header(),
              clock(),
              task(),
            ],
          ),
        ],
      ),
    );
  }
}
