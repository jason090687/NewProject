import 'package:flutter/material.dart';
import 'package:tanle/components/boarding_list.dart';

class BoardingTile extends StatelessWidget {
  final BoardingHouse boarding;
  final void Function()? onTap;
  const BoardingTile({super.key, required this.boarding, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(26, 202, 199, 199)),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 226, 225, 225).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 5),
              )
            ]),
        width: 200,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(boarding.imageUrl,
                    height: 120, width: 200, fit: BoxFit.cover),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(boarding.discount),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.yellow,
                  ),
                  const SizedBox(width: 5),
                  Text(boarding.rating),
                ],
              ),
              const SizedBox(height: 5),
              Column(
                children: [
                  Text(
                    boarding.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 20,
                  ),
                  Text(boarding.location),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                boarding.price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
