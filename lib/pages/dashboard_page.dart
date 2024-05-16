import 'package:flutter/material.dart';

// Theme
import 'package:todo/theme.dart';

// Widget
import '../widgets/todolist_widget.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

  Widget header() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 134),
          ClipOval(
            child: Image.asset(
              'assets/image_profile.png',
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Welcome Mary!',
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
        child: Image.asset(
          'assets/image_time.png',
          width: 127,
          height: 127,
          fit: BoxFit.cover,
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
                              children: [
                                TodoListWidget(),
                                TodoListWidget(),
                                TodoListWidget(),
                                TodoListWidget(),
                                TodoListWidget(),
                                TodoListWidget(),
                                TodoListWidget(),
                                TodoListWidget(),
                                TodoListWidget(),
                              ],
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
}
