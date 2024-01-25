import 'package:dio/dio.dart';
import 'package:booking_app/network/config.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: NetworkConfig.baseUrl));

  Future<Map<String, dynamic>> bookRoom(
      String hotelId, Map<String, dynamic> bookingData) async {
    try {
      final response = await _dio.post(
        '/booking/booking-room/$hotelId',
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: bookingData,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to book room');
      }
    } catch (e) {
      throw Exception('Failed to book room: $e');
    }
  }
}
