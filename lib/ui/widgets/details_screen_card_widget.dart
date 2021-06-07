import 'package:flutter/material.dart';

class DetailsScreenCardWidget extends StatelessWidget {
  const DetailsScreenCardWidget(
      {Key? key, required this.controller, required this.name, required this.icon})
      : super(key: key);

  final String name;
  final int controller;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: 135,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                name,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${controller.toString()} $name',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
