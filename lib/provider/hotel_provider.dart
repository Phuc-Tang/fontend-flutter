import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/models/hotel_model.dart';
import 'package:logger/logger.dart';
import 'package:booking_app/network/config.dart';

class HotelProvider with ChangeNotifier {
  final Logger logger = Logger();

  List<Hotel> _hotels = [];
  bool _isLoading = true;

  List<Hotel> get hotels => _hotels;
  bool get isLoading => _isLoading;

  Future<void> fetchHotels() async {
    print('Fetching hotels...');

    _isLoading = true;
    notifyListeners();

    try {
      final response = await Dio().get('${NetworkConfig.baseUrl}/hotel');

      logger.i('API Response: ${response.statusCode}');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        _hotels = data.map((json) => Hotel.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load hotels');
      }
    } catch (e) {
      // Xử lý lỗi nếu có
      logger.e('Error fetching hotels: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
