import 'package:booking_app/models/hotel_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:booking_app/network/config.dart';

class RatingScreen extends StatefulWidget {
  final int initialRating;
  final Hotel accommodation;

  const RatingScreen(
      {Key? key, required this.initialRating, required this.accommodation})
      : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  late Hotel _accommodation;
  late TextEditingController ratingNumberController;
  late TextEditingController commentTextController;

  @override
  void initState() {
    super.initState();
    _accommodation = widget.accommodation;
    ratingNumberController = TextEditingController();
    commentTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    int initialRatingAsInt = widget.initialRating.toInt();
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(5, (index) {
                      return IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RatingScreen(
                                  initialRating: index + 1,
                                  accommodation: _accommodation),
                            ),
                          );
                          setState(() {
                            initialRatingAsInt = index + 1;
                          });
                        },
                        icon: Icon(
                          index < initialRatingAsInt
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                        ),
                      );
                    }),
                  ),
                  const Text(
                    'Bình luận của bạn',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xffF8F9FA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: commentTextController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.comment),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xffE5E5E5),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xff4361EE),
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    decoration: BoxDecoration(
                      color: const Color(0xff4361EE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        handleRating(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Xác nhận',
                        style: TextStyle(
                          color: Color(0xffADADAD),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleRating(BuildContext context) async {
    try {
      final result = await ApiService.reviewHotel(
          comment: commentTextController.text,
          rating: widget.initialRating,
          hotelId: _accommodation.id);

      // In log để kiểm tra kết quả
      print(result);
    } catch (error) {
      print(error);
    }
  }
}

class ApiService {
  static final Dio _dio = Dio(BaseOptions(baseUrl: NetworkConfig.baseUrl));

  static Future<Map<String, dynamic>> reviewHotel({
    required String comment,
    required int rating,
    required String hotelId,
  }) async {
    try {
      final response = await _dio.post(
        '/review/comment-review/$hotelId',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: {
          'comment': comment,
          'rating': rating,
          'hotelId': hotelId,
        },
      );

      print('Response: ${response.data}');

      if (response.statusCode == 201) {
        Map<String, dynamic> data = response.data;
        return {'success': true, 'data': data};
      } else {
        Map<String, dynamic> error = {'message': 'Rating unsuccessful'};
        return {'success': false, 'error': error};
      }
    } catch (error) {
      print('Error: $error');
      return {
        'success': false,
        'error': {'message': error.toString()}
      };
    }
  }
}
