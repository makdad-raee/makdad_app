import 'dart:convert';


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('title ${message.notification?.title}');
  print('body ${message.notification?.body}');
  print('payLoad ${message.data}');
}

class FirebaseApi {
  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Channel',
    description: 'This chanel is used for important notification',
    importance: Importance.defaultImportance,
  );
  final _localNotification = FlutterLocalNotificationsPlugin();
  final _firebaseMessaging = FirebaseMessaging.instance;
  void handleMessage(RemoteMessage? message) {
    if (message == null) {
      return;
    } else {
      // Navigator.of(context).push(MaterialPageRoute(
      //   settings: RouteSettings(arguments: message),
      //   builder: (context) => const EditProfileView(),
      // ));
    }
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(
      (value) {
        handleMessage(value);
      },
    ).catchError((error) {});
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(event);
    });
    FirebaseMessaging.onBackgroundMessage((message) {
      return handleBackgroundMessage(message);
    });
    FirebaseMessaging.onMessage.listen((event) {
      final notification = event.notification;
      if (notification == null) {
        return;
      } else {
        _localNotification.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: '@drawable/ic_launcher',
            ),
          ),
          payload: jsonEncode(event.toMap()),
        );
      }
    });
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print('Token =======$fcmToken');
    FirebaseMessaging.onBackgroundMessage(
      handleBackgroundMessage,
    );
    initPushNotification();
    initLocalNotification();
  }

  Future initLocalNotification() async {
    // const ios=iosint
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android);
    await _localNotification.initialize(settings,onDidReceiveNotificationResponse: (details) {
      final message=RemoteMessage.fromMap(jsonDecode(details.payload!));
      handleMessage(message);
    },);
    final platform=_localNotification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }
}
