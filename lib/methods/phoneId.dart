import 'package:onesignal_flutter/onesignal_flutter.dart';

// Future<String> getId() async {
//   var status = await OneSignal.shared.getPermissionSubscriptionState();
//   var playerId = status.subscriptionStatus.userId;
//   print("plyer id  " + playerId.toString());
//   return playerId;
// }
Future<String> getId() async {
  String? playerId;
  final status = await OneSignal.shared.getDeviceState();
  playerId = status?.userId;
  // try {
  //   OneSignal.shared.getDeviceState().then((deviceState) {
  //     playerId = deviceState.userId;
  //     print("OneSignal: device state: ${deviceState.jsonRepresentation()}");
  //   });
  //   // var status = await OneSignal.shared.getPermissionSubscriptionState();
  //   // playerId = status.subscriptionStatus.userId;
  //   print("plyer id  " + playerId.toString());
  // } catch (_) {
  //   print("play servicesss   one signel");
  //   print(_.toString());
  // }
  print("plyer id  " + playerId.toString());
  return playerId == null ? "null" : playerId;
}
  // Future<void> initOneSignal(BuildContext context) async {
  //   /// Set App Id.
  //   await OneSignal.shared.setAppId(SahityaOneSignalCollection.appID);

  //   /// Get the Onesignal userId and update that into the firebase.
  //   /// So, that it can be used to send Notifications to users later.̥
  //   final status = await OneSignal.shared.getDeviceState();
  //   final String? osUserID = status?.userId;
  //   // We will update this once he logged in and goes to dashboard.
  //   ////updateUserProfile(osUserID);
  //   // Store it into shared prefs, So that later we can use it.
  //   Preferences.setOnesignalUserId(osUserID);

  //   // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  //   await OneSignal.shared.promptUserForPushNotificationPermission(
  //     fallbackToSettings: true,
  //   );

  //   /// Calls when foreground notification arrives.
  //   OneSignal.shared.setNotificationWillShowInForegroundHandler(
  //     handleForegroundNotifications,
  //   );

  //   /// Calls when the notification opens the app.
  //   OneSignal.shared.setNotificationOpenedHandler(handleBackgroundNotification);
  // }
