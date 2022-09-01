import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/data/contactsModel.dart';

import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  // LoginController _profController = Get.put(LoginController());
  ContactUsScreen(this.contact);
  ContactsModel contact;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("أتصل بنا",
              style: TextStyle(color: Colors.black, fontSize: 22)),
          centerTitle: true,
        ),
        body: Container(
            child: Container(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "أرقم التواصل",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        print("clickkkkkk");

                        if (Platform.isIOS) {
                          try {
                            await launch(
                              getUrl(contact.mainPhoneCall),
                              forceSafariVC: false,
                            );
                          } catch (_) {
                            print(_.toString());
                          }
                        } else if (Platform.isAndroid) {
                          print("click");
                          try {
                            await launch(
                              getUrl(contact.mainPhoneCall),
                              forceSafariVC: false,
                            );
                          } catch (_) {
                            print(_.toString());
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Get.theme.primaryColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              contact.mainPhoneCall,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        print("clickkkkkk");

                        if (Platform.isIOS) {
                          try {
                            await launch(
                              getUrl(contact.secondPhoneCall),
                              forceSafariVC: false,
                            );
                          } catch (_) {
                            print(_.toString());
                          }
                        } else if (Platform.isAndroid) {
                          print("click");
                          try {
                            await launch(
                              getUrl(contact.secondPhoneCall),
                              forceSafariVC: false,
                            );
                          } catch (_) {
                            print(_.toString());
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              contact.secondPhoneCall,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  if (Platform.isIOS) {
                    try {
                      await launch(
                        contact.website,
                        forceSafariVC: false,
                      );
                    } catch (_) {
                      print(_.toString());
                    }
                  } else if (Platform.isAndroid) {
                    print("click");
                    try {
                      await launch(
                        contact.website,
                        forceSafariVC: false,
                      );
                    } catch (_) {
                      print(_.toString());
                    }
                  }
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/facebook.png",
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "الصفحة الرسمية",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    throw 'Could not launch $url';
  }
}

String getUrl(String phone) {
  String message = "";
  // Uri.parse(message);

  // add the [https]
  return "tel://$phone"; // new line
}
