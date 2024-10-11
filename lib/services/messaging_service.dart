// import 'package:tiin_cashback/bloc/blocs.dart';
// import 'package:tiin_cashback/core/core.dart';
// import 'package:tiin_cashback/firebase_options.dart';
// import 'package:tiin_cashback/hive_helper/hive_helper.dart';
// import 'package:tiin_cashback/routes/app_navigator.dart';
// import 'package:tiin_cashback/routes/app_route_name.dart';
// import 'package:tiin_cashback/services/services.dart';

// Future<void> _backgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   if (message.notification == null) return;

//   if (message.data['type'] == 'news') {
//     FileService fileService = FileService();
//     await fileService.setBool(key: 'notification', data: true);
//   }
// }

// class MessagingService {
//   MessagingService._();
//   static final MessagingService instance = MessagingService._();

//   final FirebaseMessaging _messaging = FirebaseMessaging.instance;

//   Future<void> initialize() async {
//     await NotificationService.init();
//     await getToken();
//     listenFcm();
//   }

//   void listenFcm() {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;

//     FirebaseMessaging.onMessage.listen(_handleMessage);
//     FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
//     FirebaseMessaging.onMessageOpenedApp.listen((message) async {
//       _handleMessage(message, isInitialMessage: true);
//     });

//     messaging.getInitialMessage().then((message) {
//       if (message == null) return;
//       _handleMessage(message, isInitialMessage: true);
//     });

//     messaging.subscribeToTopic('news');
//   }

//   Future<void> _handleMessage(
//     RemoteMessage message, {
//     bool isInitialMessage = false,
//   }) async {
//     const encoder = JsonEncoder.withIndent(" ");
//     encoder.convert(message.toMap()).printf();
//     String? type = message.data['type'];
//     NewsBloc newsBloc = NewsBloc();

//     if (type == 'news') {
//       newsBloc.add(NewsGetByIdEvent(message.data['id'].toString()));
//       AppPrefs.setNotification(true);
//       AppNavigator.pushNamed(RouteNames.news);
//     } else if (type == 'banner') {
//       newsBloc.add(BannerLoadedEvent());
//     } else {
//       ReceiptBloc receiptBloc = ReceiptBloc();
//       UserBloc userBloc = UserBloc();
//       receiptBloc.add(ReceiptLoadedEvent());
//       userBloc.add(GetUserEvent());
//     }
//     if (isInitialMessage) return;
//     RemoteNotification? notification = message.notification;
//     if (notification == null) return;
//     NotificationService.showNotification(notification, type: type);
//   }

//   Future<String?> getToken() async {
//     String? token = await _messaging.getToken();
//     "Token: $token".printf(name: "MessagingService");
//     return token;
//   }
// }
