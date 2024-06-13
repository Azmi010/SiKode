import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final EdgeInsetsGeometry padding;

  const CustomCard({
    super.key,
    required this.imagePath,
    required this.title,
    this.padding = const EdgeInsets.symmetric(horizontal: 30),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: padding,
      child: SizedBox(
        width: 151,
        height: 182,
        child: Card(
          color: const Color.fromRGBO(1, 188, 177, 1),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Image.network(
                      imagePath,
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
