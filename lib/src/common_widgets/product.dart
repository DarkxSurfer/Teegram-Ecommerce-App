import 'package:flutter/material.dart';
import 'package:hackathon/src/constants/colors.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    this.goTo,
    required this.onFavoriteToggle,
    required this.isFavorite,
  });

  final String name;
  final String image;
  final String price;
  final Widget? goTo;
  final Function(bool isFavorite) onFavoriteToggle;
  final bool isFavorite;

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    widget.onFavoriteToggle(_isFavorite);
  }

  void _navigateToDetail(BuildContext context) {
    if (widget.goTo != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget.goTo!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToDetail(context);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor.withOpacity(0.4)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: _toggleFavorite,
                    icon: _isFavorite
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_border),
                  ),
                ],
              ),
              SizedBox(
                height: 122,
                width: 175,
                child: Image.asset(widget.image),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text("(715 reviews)",
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    Text(widget.price,
                        style: const TextStyle(
                            fontSize: 18, color: Color(0xffAA14F0))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
