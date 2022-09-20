import 'package:flutter/material.dart';
import 'package:flutter_third/models/TourismPlace.dart';

import '../components/favorite.dart';

class DetailPage extends StatefulWidget {
  final TourismPlace place;
  const DetailPage({Key? key, required this.place}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    final place = widget.place;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.asset(place.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black38,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavoriteButtonWidget()
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Staatliches",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0, right: 16.0, left: 16.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.calendar_today_outlined),
                      const SizedBox(height: 8.0),
                      Text(
                        place.openDays,
                        style: const TextStyle(fontFamily: 'Oxygen'),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.access_time_outlined),
                      const SizedBox(height: 8.0),
                      Text(
                        place.openTime,
                        style: const TextStyle(fontFamily: 'Oxygen'),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.account_balance_wallet_outlined),
                      const SizedBox(height: 8.0),
                      Text(
                        place.ticketPrice,
                        style: const TextStyle(fontFamily: 'Oxygen'),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 152.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(e)
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      )
    );
  }
}
