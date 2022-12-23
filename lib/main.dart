import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/audio_calling_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_live_streaming_app/notificationController.dart';
import 'package:flutter_live_streaming_app/notification_page.dart';
import 'package:flutter_live_streaming_app/push_home.dart';

Future<void> main() async {
  await NotificationController.initializeLocalNotifications();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Color mainColor = const Color(0xFF9D50DD);
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const String routeHome = '/',
      routeNotification = '/audio-calling-page';

  @override
  void initState() {
    NotificationController.startListeningNotificationEvents();
    super.initState();
  }

  // List<Route<dynamic>> onGenerateInitialRoutes(String initialRouteName) {
  //   List<Route<dynamic>> pageStack = [];
  //   pageStack.add(MaterialPageRoute(
  //       builder: (_) =>
  //           const HomePage(title: 'Awesome Notifications Example App')));
  //   if (initialRouteName == routeNotification &&
  //       NotificationController.initialAction != null) {
  //     pageStack.add(MaterialPageRoute(
  //         builder: (_) => NotificationPage(
  //             receivedAction: NotificationController.initialAction!)));
  //   }
  //   return pageStack;
  // }

  // Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case routeHome:
  //       return MaterialPageRoute(
  //           builder: (_) =>
  //               const HomePage(title: 'Awesome Notifications Example App'));

  //     case routeNotification:
  //       ReceivedAction receivedAction = settings.arguments as ReceivedAction;
  //       return MaterialPageRoute(
  //           builder: (_) => NotificationPage(receivedAction: receivedAction));
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  
      navigatorKey: MyApp.navigatorKey,
      // onGenerateInitialRoutes: onGenerateInitialRoutes,
      // onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Zego Video Calling',
      home: AudioCallingScreen(),
    );
  }
}
