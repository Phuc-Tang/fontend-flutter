import 'package:flutter/material.dart';
import 'package:booking_app/models/phone_nation_model.dart';
import 'package:booking_app/data/phone_nation_data.dart';
import 'package:booking_app/data/card_data.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late DateTimeRange dateRange;
  late CountryInfo? selectedCountry;
  late DateTime start;
  late DateTime end;
  var selectedCard = card.isNotEmpty ? card[0] : null;

  @override
  void initState() {
    super.initState();
    dateRange = DateTimeRange(start: DateTime.now(), end: DateTime.now());
    selectedCountry =
        countryList.firstWhere((country) => country.dialCode == '+1');
    start = dateRange.start;
    end = dateRange.end;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              'Phương thức thanh toán',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 330,
            child: card.isEmpty
                ? const Center(
                    child: Text(
                      'Không có thẻ thanh toán',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: card.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCard = card[index];
                          });
                        },
                        child: Container(
                          height: 70,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: card[index] == selectedCard
                                ? const Color(0xff4361EE)
                                : const Color(0xffADADAD).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 50,
                                child: Image.asset(card[index].imageUrl),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    card[index].numberCard,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: card[index] == selectedCard
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Text(
                                    ' Hết hạn: ${card[index].expires}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: card[index] == selectedCard
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          const Spacer(),
          Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Thêm thẻ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xff4361EE),
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_card_outlined),
                  color: const Color(0xff4361EE),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Color(0xff4361EE),
            thickness: 1.0,
            height: 20.0,
          ),
          Column(
            children: [
              Container(
                height: 100,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                  color: const Color(0xffADADAD).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/hotel_example.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Imperial Hotel Gold Coast',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '4217 Gold Coast, Úc',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xff4361EE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Thanh toán:',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$180',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
