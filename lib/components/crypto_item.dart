import 'package:flutter/cupertino.dart';

import '../domain/models/Crypto.dart';
import '../utils.dart';

class CryptoItem extends StatefulWidget {
  const CryptoItem({
    super.key, required this.item,
  });

  final Crypto item;

  @override
  State<CryptoItem> createState() => _CryptoItemState();
}

class _CryptoItemState extends State<CryptoItem> {

  late final Color color;

  @override
  void initState() {
    super.initState();
    color = generateRandomColor().withAlpha(25);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(18)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                overflow: TextOverflow.ellipsis,
                widget.item.name,
                style: TextStyle(
                  color: Color(0xFF17171A),
                  letterSpacing: -0.41,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 12,),
          Text(
            '\$${formatNumber(widget.item.priceUsd)}',
            style: TextStyle(
              color: Color(0xFF17171A),
              letterSpacing: -0.41,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}