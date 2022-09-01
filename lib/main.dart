import 'package:labtolab_app/controllers/cont.dart';
import 'package:labtolab_app/ui/mainScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/ui/mainScreen/labInfoScreen.dart';
import 'package:labtolab_app/ui/mainScreen/mainLabScrenn.dart';
import 'package:labtolab_app/ui/mainScreen/slidesScreen.dart';
import 'package:labtolab_app/ui/order/mainLab/myOrderScreen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(
      EasyLocalization(
          path: "lang",
          saveLocale: true,
          startLocale: Locale("ar"),
          useOnlyLangCode: true,
          supportedLocales: [Locale("ar")],
          child: baseWedget()),
    );

class baseWedget extends StatefulWidget {
  const baseWedget({Key? key}) : super(key: key);

  @override
  _baseWedgetState createState() => _baseWedgetState();
}

class _baseWedgetState extends State<baseWedget> {
  @override
  void initState() {
    // getToken();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("7ee9d802-0e45-4242-81bc-c492e78ede92");
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      /// Display Notification, send null to not display, send notification to display
      event.complete(event.notification);
    });
    return GetMaterialApp(
        theme: ThemeData(
            primaryColor: Color(0xff1D71B8),
            primaryColorLight: Color(0xffFEE8C1),
            primaryColorDark: Color(0xff3A3A3A),
            fontFamily: "Arabic",
            appBarTheme:
                AppBarTheme(iconTheme: IconThemeData(color: Colors.white))),
        darkTheme: ThemeData(
            primaryColor: Color(0xff1D71B8),
            primaryColorLight: Color(0xffFEE8C1),
            primaryColorDark: Color(0xff3A3A3A),
            fontFamily: "Arabic",
            appBarTheme:
                AppBarTheme(iconTheme: IconThemeData(color: Colors.white))),
        debugShowCheckedModeBanner: false,
        enableLog: true,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        defaultTransition: Transition.rightToLeft,
        locale: context.locale,
        home: Main(0));
  }
}

class Main extends StatefulWidget {
  int? indexB = 0;
  Main([this.indexB]);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin {
  // final Connectivity _connectivity = Connectivity();
  // StreamSubscription<ConnectivityResult> _connectivitySubscription;
  // ItemDetailsController controller = Get.put(ItemDetailsController());
  // FavouriteController favouriteController = Get.put(FavouriteController());
  // SectionsController _controller = Get.put(SectionsController());
  Contx cont = Get.put(Contx());

  @override
  void initState() {
    _child = MainScreen();
    super.initState();
  }

  bool isOpened = false;

  MainScreen? _child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: Get.theme.primaryColor,
            elevation: 0,
          )),
      body: selectedWidget(widget.indexB!),
      bottomNavigationBar: Obx(() => cont.role.value == "DriverMan"
          ? Container(
              height: 0,
              child: BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                items: [
                  BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Icon(Icons.home, color: Colors.transparent),
                      label: ""),

                  BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Icon(Icons.bar_chart, color: Colors.transparent),
                      label: ""),

                  // Icon(Icons.more_horiz,
                  //     size: 30, color: indexB == 4 ? Colors.white : Colors.grey),
                ],
                // onTap: (index) {
                //   //Handle button tap
                //   print(index);
                //   setState(() {
                //     widget.indexB = index;
                //   });
                // },
              ),
            )
          : Container(
              child: cont.role.value == "LabAmin"
                  ? BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Colors.white,
                      currentIndex: widget.indexB!,
                      selectedItemColor: Theme.of(context).primaryColor,
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home,
                                color: widget.indexB == 0
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                            label: "الرئيسية"),

                        BottomNavigationBarItem(
                            icon: Icon(Icons.bar_chart,
                                color: widget.indexB == 1
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                            label: "الطلبات"),

                        BottomNavigationBarItem(
                            icon: Icon(Icons.change_history,
                                color: widget.indexB == 2
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                            label: "معلومات مختبرية"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.image,
                                color: widget.indexB == 3
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                            label: "الأعلانات")

                        // Icon(Icons.more_horiz,
                        //     size: 30, color: indexB == 4 ? Colors.white : Colors.grey),
                      ],
                      onTap: (index) {
                        //Handle button tap
                        print(index);
                        setState(() {
                          widget.indexB = index;
                        });
                      },
                    )
                  : BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Colors.white,
                      selectedItemColor: Theme.of(context).primaryColor,
                      currentIndex: widget.indexB!,
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home,
                                color: widget.indexB == 0
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                            label: "الرئيسية"),

                        BottomNavigationBarItem(
                            icon: Icon(Icons.bar_chart,
                                color: widget.indexB == 1
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                            label: "المختبرات"),

                        BottomNavigationBarItem(
                            icon: Icon(Icons.change_history,
                                color: widget.indexB == 2
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                            label: "معلومات مختبرية"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.image,
                                color: widget.indexB == 3
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                            label: "الأعلانات")

                        // Icon(Icons.more_horiz,
                        //     size: 30, color: indexB == 4 ? Colors.white : Colors.grey),
                      ],
                      onTap: (index) {
                        //Handle button tap
                        print(index);
                        setState(() {
                          widget.indexB = index;
                        });
                      },
                    ),
            )),
    );
  }

  Widget? selectedWidget(int? index) {
    if (index == 0) {
      return _child;
    } else if (index == 1) {
      return cont.role.value == "LabAmin"
          ? MainLabOrderScreen()
          : MainLabScreen();
    } else if (index == 2) {
      return LabInfoScreen();
    } else if (index == 3) {
      return SlidesScreen();
    }
  }
}
