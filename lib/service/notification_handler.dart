import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../data/model/fcm_notification_model.dart';
import 'redirect_engine.dart';

AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'dbnus_app', // id
    'dbnus_fcm', // name
    description: 'dbnus app fcm notification', // description
    importance: Importance.high,
    ledColor: Colors.white);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();
bool isFlutterLocalNotificationsInitialized = false;

String navigationActionId = 'id_3';
String darwinNotificationCategoryPlain = 'plainCategory';
String darwinNotificationCategoryText = 'textCategory';

class NotificationHandler {
  Future<void> initiateNotification() async {
    await setupFlutterNotifications();
    // await requestPermissions();
    _configureSelectNotificationSubject();
  }

  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final List<DarwinNotificationCategory> darwinNotificationCategories =
        <DarwinNotificationCategory>[
      DarwinNotificationCategory(
        darwinNotificationCategoryText,
        actions: <DarwinNotificationAction>[
          DarwinNotificationAction.text(
            'text_1',
            'Action 1',
            buttonTitle: 'Send',
            placeholder: 'Placeholder',
          ),
        ],
      ),
      DarwinNotificationCategory(
        darwinNotificationCategoryPlain,
        actions: <DarwinNotificationAction>[
          DarwinNotificationAction.plain('id_1', 'Action 1'),
          DarwinNotificationAction.plain(
            'id_2',
            'Action 2 (destructive)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.destructive,
            },
          ),
          DarwinNotificationAction.plain(
            navigationActionId,
            'Action 3 (foreground)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.foreground,
            },
          ),
          DarwinNotificationAction.plain(
            'id_4',
            'Action 4 (auth required)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.authenticationRequired,
            },
          ),
        ],
        options: <DarwinNotificationCategoryOption>{
          DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
        },
      )
    ];

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      notificationCategories: darwinNotificationCategories,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        selectNotificationStream.add(notificationResponse.payload);
      },
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  void _configureSelectNotificationSubject() {
    selectNotificationStream.stream.listen((String? payload) async {
      if (payload != null && payload.isNotEmpty) {
        RedirectEngine()
            .redirectRoutes(redirectUrl: Uri.parse(payload), delayedSeconds: 3);
      }
    });

    flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails()
        .then((value) {
      var payload = value?.notificationResponse?.payload;

      if (payload != null && payload.isNotEmpty) {
        RedirectEngine()
            .redirectRoutes(redirectUrl: Uri.parse(payload), delayedSeconds: 4);
      }
    });
  }

  Future<void> requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? granted =
          await androidImplementation?.requestNotificationsPermission();
    }
  }

  Future<void> showNotificationIos(
      FcmNotificationModel fcmNotificationModel) async {
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();
    final NotificationDetails notificationDetails = NotificationDetails(
      iOS: darwinNotificationDetails,
    );

    if (fcmNotificationModel.imageUrl == null &&
        fcmNotificationModel.bigText == null) {
      await flutterLocalNotificationsPlugin.show(
          getId(),
          '${fcmNotificationModel.title}',
          '${fcmNotificationModel.message}',
          notificationDetails,
          payload: fcmNotificationModel.actionURL);
    } else if (fcmNotificationModel.bigText != null &&
        fcmNotificationModel.imageUrl == null) {
      await flutterLocalNotificationsPlugin.show(
          getId(),
          '${fcmNotificationModel.title}',
          '${fcmNotificationModel.bigText}',
          notificationDetails,
          payload: fcmNotificationModel.actionURL);
    } else if (fcmNotificationModel.imageUrl != null &&
        fcmNotificationModel.bigText == null) {
      final String bigPicturePath = await _downloadAndSaveFile(
          fcmNotificationModel.imageUrl ?? 'https://picsum.photos/200',
          'bigPicture.jpg');

      final DarwinNotificationDetails darwinNotificationDetailsImage =
          DarwinNotificationDetails(attachments: <DarwinNotificationAttachment>[
        DarwinNotificationAttachment(bigPicturePath, hideThumbnail: false)
      ]);
      final NotificationDetails notificationDetailsImage = NotificationDetails(
        iOS: darwinNotificationDetailsImage,
      );

      await flutterLocalNotificationsPlugin.show(
          getId(),
          '${fcmNotificationModel.title}',
          '${fcmNotificationModel.message}',
          notificationDetailsImage,
          payload: fcmNotificationModel.actionURL);
    } else if (fcmNotificationModel.imageUrl != null &&
        fcmNotificationModel.bigText != null) {
      final String bigPicturePath = await _downloadAndSaveFile(
          fcmNotificationModel.imageUrl ?? 'https://picsum.photos/200',
          'bigPicture.jpg');

      final DarwinNotificationDetails darwinNotificationDetailsImage =
          DarwinNotificationDetails(attachments: <DarwinNotificationAttachment>[
        DarwinNotificationAttachment(bigPicturePath, hideThumbnail: false)
      ]);
      final NotificationDetails notificationDetailsImage = NotificationDetails(
        iOS: darwinNotificationDetailsImage,
      );

      await flutterLocalNotificationsPlugin.show(
          getId(),
          '${fcmNotificationModel.title}',
          '${fcmNotificationModel.bigText}',
          notificationDetailsImage,
          payload: fcmNotificationModel.actionURL);
    }
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response =
        await http.get(Uri.parse(url)).timeout(const Duration(minutes: 5));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  int getId() {
    int max = 5000;
    int min = 1000;
    Random rnd = Random();
    int r = min + rnd.nextInt(max - min);
    return r;
  }

  Future<void> showNotificationAndroid(
      FcmNotificationModel fcmNotificationModel) async {
    // final ByteArrayAndroidBitmap largeIcon = ByteArrayAndroidBitmap(
    //     await _getByteArrayFromUrl('https://dummyimage.com/48x48'));

    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      "${fcmNotificationModel.bigText}",
      htmlFormatBigText: true,
      contentTitle: fcmNotificationModel.title ?? "",
      htmlFormatContentTitle: true,
      summaryText: fcmNotificationModel.message ?? "",
      htmlFormatSummaryText: true,
    );

    if (fcmNotificationModel.imageUrl == null &&
        fcmNotificationModel.bigText == null) {
      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
      );
      NotificationDetails notificationDetails =
          NotificationDetails(android: androidNotificationDetails);
      await flutterLocalNotificationsPlugin.show(
          getId(),
          "${fcmNotificationModel.title}",
          "${fcmNotificationModel.message}",
          notificationDetails,
          payload: fcmNotificationModel.actionURL);
    } else if (fcmNotificationModel.imageUrl != null &&
        fcmNotificationModel.bigText == null) {
      final ByteArrayAndroidBitmap bigPicture = ByteArrayAndroidBitmap(
          await _getByteArrayFromUrl(fcmNotificationModel.imageUrl ??
              'https://picsum.photos/seed/picsum/200/300'));

      final BigPictureStyleInformation bigPictureStyleInformation =
          BigPictureStyleInformation(bigPicture,
              // largeIcon: largeIcon,
              contentTitle: "${fcmNotificationModel.title}",
              htmlFormatContentTitle: true,
              summaryText: "${fcmNotificationModel.message}",
              htmlFormatSummaryText: true);

      final AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description,
              styleInformation: bigPictureStyleInformation);
      final NotificationDetails notificationDetails =
          NotificationDetails(android: androidNotificationDetails);
      await flutterLocalNotificationsPlugin.show(
          getId(),
          "${fcmNotificationModel.title}",
          "${fcmNotificationModel.message}",
          notificationDetails,
          payload: fcmNotificationModel.actionURL);
    } else if (fcmNotificationModel.bigText != null &&
        fcmNotificationModel.imageUrl == null) {
      final AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description,
              styleInformation: bigTextStyleInformation);
      final NotificationDetails notificationDetails =
          NotificationDetails(android: androidNotificationDetails);
      await flutterLocalNotificationsPlugin.show(
          getId(),
          "${fcmNotificationModel.title}",
          fcmNotificationModel.message ?? "",
          notificationDetails,
          payload: fcmNotificationModel.actionURL);
    } else if (fcmNotificationModel.bigText != null &&
        fcmNotificationModel.imageUrl != null) {
      final ByteArrayAndroidBitmap bigPicture = ByteArrayAndroidBitmap(
          await _getByteArrayFromUrl(fcmNotificationModel.imageUrl ??
              'https://picsum.photos/seed/picsum/200/300'));

      final BigPictureStyleInformation bigPictureStyleInformationWithBigText =
          BigPictureStyleInformation(bigPicture,
              // largeIcon: largeIcon,
              contentTitle: "${fcmNotificationModel.title}",
              htmlFormatContentTitle: true,
              summaryText: "${fcmNotificationModel.bigText}",
              htmlFormatSummaryText: true);
      final AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description,
              styleInformation: bigPictureStyleInformationWithBigText);
      final NotificationDetails notificationDetails =
          NotificationDetails(android: androidNotificationDetails);
      await flutterLocalNotificationsPlugin.show(
          getId(),
          "${fcmNotificationModel.title}",
          fcmNotificationModel.message ?? "",
          notificationDetails,
          payload: fcmNotificationModel.actionURL);
    }
  }

  Future<void> showProgressNotification(
      {required int progress,
      required int progressId,
      required String imagePath}) async {
    await Future<void>.delayed(const Duration(seconds: 1), () async {
      final AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails('progress channel', 'progress channel',
              channelDescription: 'progress channel description',
              channelShowBadge: false,
              importance: Importance.max,
              priority: Priority.high,
              onlyAlertOnce: true,
              showProgress: true,
              maxProgress: 100,
              progress: progress);

      final DarwinNotificationDetails darwinNotificationDetails =
          DarwinNotificationDetails(attachments: <DarwinNotificationAttachment>[
        DarwinNotificationAttachment(imagePath, hideThumbnail: false)
      ]);
      final NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails, iOS: darwinNotificationDetails);
      await flutterLocalNotificationsPlugin.show(
          progressId, 'Downloading .... ', '', notificationDetails,
          payload: 'item x');
    });
  }

  Future<Uint8List> _getByteArrayFromUrl(String url) async {
    final http.Response response =
        await http.get(Uri.parse(url)).timeout(const Duration(minutes: 5));
    return response.bodyBytes;
  }
}
