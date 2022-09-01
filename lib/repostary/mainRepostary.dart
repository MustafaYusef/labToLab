import 'dart:convert';

import 'package:labtolab_app/const.dart';
import 'package:labtolab_app/data/bannersData.dart';
import 'package:labtolab_app/data/contactsModel.dart';
import 'package:labtolab_app/data/correntOrderModel.dart';
import 'package:labtolab_app/data/driverOrder.dart';
import 'package:labtolab_app/data/favouriteModel.dart';
import 'package:labtolab_app/data/loginModel.dart';
import 'package:labtolab_app/data/mainLabOrder.dart';
import 'package:labtolab_app/data/mainLabs.dart';
import 'package:labtolab_app/data/labInfo.dart';
import 'package:labtolab_app/data/orderGps.dart';
import 'package:labtolab_app/data/orderTenderData.dart';
import 'package:labtolab_app/data/searchModel.dart';
import 'package:labtolab_app/data/tendersData.dart';
import 'package:http/http.dart';
import 'package:labtolab_app/data/termsConditions.dart';

class MainRepostary {
  Future<MainLabsModel> getMainLabs() async {
    final response = await get(Uri.parse(baseUrl + "GetMainLab"));
    if (response.statusCode == 200) {
      return mainLabsModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<LabInfoModel> getLabInfo() async {
    final response = await get(Uri.parse(baseUrl + "GetInformations"));
    if (response.statusCode == 200) {
      return labInfoModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<LoginModel> Login(
      String phone, String password, String player_id) async {
    final response = await post(Uri.parse(baseUrl + "login"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(
            {"username": phone, "password": password, "Player_id": player_id}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return loginModelFromJson(response.body);
    } else if (response.statusCode == 403) {
      throw Exception(loginModelFromJson(response.body));
    } else {
      throw Exception(loginModelFromJson(response.body));
    }
  }

  Future<bool> makeOrder(
      {String? token,
      String? name,
      String? age,
      int? labId,
      String? selectedDayType,
      required List<TenderOb> tenders,
      String? player_id}) async {
    print("in the function post .. . .. . .. . ");

    final response = await post(Uri.parse(baseUrl + "CreateNewOrder"),
        headers: {"Content-Type": "application/json", "token": token!},
        body: json.encode({
          "PatientName": name,
          "PatientAge": age,
          "Player_id": player_id,
          "MainLab": labId,
          "Tenders": tenders,
          "RequestType": selectedDayType
        }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 403) {
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<CurrentOrderModel> getCurrentOrder(String? token) async {
    final response = await get(Uri.parse(baseUrl + "ShowCurrentOrder"),
        headers: {"Content-Type": "application/json", "token": token!});
    if (response.statusCode == 200) {
      return currentOrderModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<CurrentOrderModel> getSecArchivOrder(String? token) async {
    final response = await get(Uri.parse(baseUrl + "ShowArchivedOrder"),
        headers: {"Content-Type": "application/json", "token": token!});
    if (response.statusCode == 200) {
      return currentOrderModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<ContactsModel> getContacts() async {
    final response = await get(Uri.parse(baseUrl + "GetContactUs"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      return contactsModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<MianLabOrderModel> getMainLabOrder(String? token) async {
    final response = await get(Uri.parse(baseUrl + "ShowCurrentOrderOfMainLab"),
        headers: {"Content-Type": "application/json", "token": token!});
    if (response.statusCode == 200) {
      return mianLabOrderModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<OrderGpsModel> getGpsOrder(String? token, int orderId) async {
    print("token .. . .. .. . .. .");
    print(token);
    print("orderId .. . .. .. . .. .");
    print(orderId);
    final response = await get(Uri.parse(baseUrl + "GetGps?OrderId=$orderId"),
        headers: {"Content-Type": "application/json", "token": token!});
    if (response.statusCode == 200) {
      return orderGpsModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<void> setOrderGps(
      String? token, int orderId, String lat, String log) async {
    final response = await post(Uri.parse(baseUrl + "SetGps"),
        headers: {"Content-Type": "application/json", "token": token!},
        body: json.encode({
          "OrderId": orderId,
          "lat": lat,
          "log": log,
        }));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<OrderTenderModel> getOrderDetails(String? token, int orderId) async {
    final response = await post(Uri.parse(baseUrl + "ShowTendOrder"),
        headers: {"Content-Type": "application/json", "token": token!},
        body: json.encode({
          "OrderId": orderId,
        }));
    if (response.statusCode == 200) {
      return orderTenderModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<PublicSearchModel> serchItem(
    String? token,
    String? query,
  ) async {
    final response = await post(Uri.parse(baseUrl + "SearchGeneralTender"),
        headers: {"Content-Type": "application/json", "token": token!},
        body: json.encode({
          "tenderName": query,
        }));
    if (response.statusCode == 200) {
      return publicSearchModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<void> sendRating(
      {String? token,
      String? player_id,
      int? rating,
      int? orderId,
      int? mainLabId}) async {
    final response = await post(Uri.parse(baseUrl + "CreateRatingOrder"),
        headers: {"Content-Type": "application/json", "token": token!},
        body: json.encode({
          "Rating": rating,
          "Player_id": player_id,
          "MainLabId": mainLabId,
          "OrderId": orderId
        }));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<void> makeOrderHome(
      {String? token,
      String? player_id,
      String? name,
      String? patientAge,
      String? sampleType}) async {
    final response = await post(Uri.parse(baseUrl + "CreatePillBloodRequest"),
        headers: {"Content-Type": "application/json", "token": token!},
        body: json.encode({
          "PatientName": name,
          "Player_id": player_id,
          "PatientAge": patientAge,
          "SampleType": sampleType
        }));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<void> addFavourite(String? token, int mainLabId) async {
    final response = await post(Uri.parse(baseUrl + "CreateNewLiker"),
        headers: {"Content-Type": "application/json", "token": token!},
        body: json.encode({
          "MainLab": mainLabId,
        }));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<void> deleteFavourite(String? token, int mainLabId) async {
    final response = await post(Uri.parse(baseUrl + "DeleteCurrentLiker"),
        headers: {"Content-Type": "application/json", "token": token!},
        body: json.encode({
          "MainLab": mainLabId,
        }));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<FavouriteModel> getFavourite(String? token) async {
    final response = await get(
      Uri.parse(baseUrl + "CurrentLiker"),
      headers: {"Content-Type": "application/json", "token": token!},
    );

    if (response.statusCode == 200) {
      return favouriteModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<TermsModel> getTerms() async {
    final response = await get(
      Uri.parse(baseUrl + "GetAboutTerms"),
      // headers: {"Content-Type": "application/json", "token": token!},
      // body: json.encode({
      //   "OrderId": orderId,
      // })
    );
    if (response.statusCode == 200) {
      return termsModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<DriverOrderModel> getDriverNearOrder(String? token) async {
    final response = await get(
      Uri.parse(baseUrl + "ShowCurrentNearOrder"),
      headers: {"Content-Type": "application/json", "token": token!},
    );
    if (response.statusCode == 200) {
      return driverOrderModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<DriverOrderModel> getDriverOrder(String? token) async {
    final response = await get(
      Uri.parse(baseUrl + "ShowMyOrder"),
      headers: {"Content-Type": "application/json", "token": token!},
    );
    if (response.statusCode == 200) {
      return driverOrderModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<void> approveByDriver(String? token, int orderId) async {
    final response = await post(Uri.parse(baseUrl + "ApproveOrderById"),
        headers: {"Content-Type": "application/json", "token": token!},
        body: json.encode({
          "OrderId": orderId,
        }));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<void> handelOrderByDriver(String? token, int orderId) async {
    final response = await post(Uri.parse(baseUrl + "HandelOrder"),
        headers: {"Content-Type": "application/json", "token": token!},
        body: json.encode({
          "OrderId": orderId,
        }));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<void> deliverOrderByDriver(String? token, int orderId) async {
    final response = await post(Uri.parse(baseUrl + "DeliverOrderToMainLab"),
        headers: {"Content-Type": "application/json", "token": token!},
        body: json.encode({
          "OrderId": orderId,
        }));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<DriverOrderModel> getDriverOrders(String? token) async {
    final response = await get(
      Uri.parse(baseUrl + "ShowArchivedMyOrder"),
      headers: {"Content-Type": "application/json", "token": token!},
    );
    if (response.statusCode == 200) {
      return driverOrderModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<int> changeOrderStatuse(
      String? token, int orderId, int status, String time) async {
    final response = await post(Uri.parse(baseUrl + "ChangeOrderStatusById"),
        headers: {"Content-Type": "application/json", "token": token!},
        body: json.encode({
          "OrderId": orderId,
          "OrderStatusAccept": status,
          "TimeToResponse": time
        }));
    if (response.statusCode == 200) {
      return 200;
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<TendersModel> getTenders(int labId) async {
    final response = await get(Uri.parse(baseUrl + "GetTendersById/$labId"));
    if (response.statusCode == 200) {
      return tendersModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<BannersModel> getMainBanners() async {
    final response = await get(Uri.parse(baseUrl + "GetPromotions"));
    if (response.statusCode == 200) {
      return bannersModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }
}

class TenderOb {
  int TenderId;

  TenderOb({required this.TenderId});
  Map<String, dynamic> toJson() {
    return {
      "TenderId": this.TenderId,
    };
  }
}
