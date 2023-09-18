import 'package:flutter/material.dart';
import 'package:nav_bar/add.dart';
import 'package:nav_bar/pages/chat.dart';
import 'package:nav_bar/pages/dash_board.dart';
import 'package:nav_bar/pages/profile.dart';
import 'package:nav_bar/pages/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTab = 0;
  final List<Widget> screensNavBar = [
    const Chat(),
    const DashBoard(),
    const Profile(),
    const Settings(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DashBoard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddPages()));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = const DashBoard();
                        _currentTab = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(Icons.dashboard,
                            color:
                                _currentTab == 0 ? Colors.blue : Colors.grey),
                        Text(
                          "Приборы",
                          style: TextStyle(
                              color:
                                  _currentTab == 0 ? Colors.blue : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  // 2 button
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = const Chat();
                        _currentTab = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(Icons.chat,
                            color:
                                _currentTab == 1 ? Colors.blue : Colors.grey),
                        Text(
                          "Чат",
                          style: TextStyle(
                              color:
                                  _currentTab == 1 ? Colors.blue : Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
              // 2 button right
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = const Profile();
                        _currentTab = 2;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(Icons.person,
                            color:
                                _currentTab == 2 ? Colors.blue : Colors.grey),
                        Text(
                          "Профиль",
                          style: TextStyle(
                              color:
                                  _currentTab == 2 ? Colors.blue : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  // 2 button
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = const Settings();
                        _currentTab = 3;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(Icons.settings,
                            color:
                                _currentTab == 3 ? Colors.blue : Colors.grey),
                        Text(
                          "Настройки",
                          style: TextStyle(
                              color:
                                  _currentTab == 3 ? Colors.blue : Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: PageStorage(bucket: bucket, child: currentScreen),
    );
  }
}
