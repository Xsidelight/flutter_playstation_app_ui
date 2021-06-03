import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playstation_app/ui/widgets/custom_favorite_icon.dart';
import 'package:flutter_playstation_app/ui/widgets/details_screen_card_widget.dart';
import 'package:intl/intl.dart';

class DetailsScreen extends StatefulWidget {
  final int controller;
  final String title;
  final String description;
  final int games;
  final int reviews;
  final int price;

  DetailsScreen(
      {required this.controller,
      required this.title,
      required this.description,
      required this.games,
      required this.reviews,
      required this.price});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String dateFrom = 'Choose From';
  String dateTo = 'Choose To';

  var firstDate = DateTime.now();
  var lastDate = DateTime.now().add(Duration(days: 3));
  var dateTimeFrom = DateTime.now();
  var dateTimeTo = DateTime.now().add(Duration(days: 3));
  DateTimeRange? dateTimeRange;

  Future<void> _showDatePicker() async {
    dateTimeRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2021, 01, 01),
      lastDate: DateTime(2025, 01, 01),
      initialDateRange: DateTimeRange(start: firstDate, end: lastDate),
      currentDate: firstDate,
    );
    setState(() {
      dateTimeFrom = dateTimeRange!.start;
      dateTimeTo = dateTimeRange!.end;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 20.0),
            child: CustomFavoriteIcon(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Column(
                  children: [
                    DetailsScreenCardWidget(
                      controller: widget.controller,
                      name: 'Controller',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DetailsScreenCardWidget(
                      controller: widget.games,
                      name: 'Games',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DetailsScreenCardWidget(
                        controller: widget.reviews, name: 'Reviews'),
                  ],
                ),
                Container(),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Description',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            //TODO: Make Read More expandable tile or something
            Text(
              widget.description,
              style: TextStyle(color: Colors.white60),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Duration',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: _showDatePicker,
                    child: Container(
                      height: 75,
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            color: Colors.white54,
                          ),
                          VerticalDivider(
                            color: Colors.white54,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'From',
                                style: TextStyle(color: Colors.white54),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                DateFormat.yMMMd().format(dateTimeFrom),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 75,
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: Colors.white54,
                        ),
                        VerticalDivider(
                          color: Colors.white54,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'To',
                              style: TextStyle(color: Colors.white54),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              DateFormat.yMMMd().format(dateTimeTo),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
