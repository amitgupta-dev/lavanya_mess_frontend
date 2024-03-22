import 'package:flutter/material.dart';

void toast(BuildContext context, String heading, String message, Color color,
    {IconData? icon}) {
  // final screenHeight = MediaQuery.of(context).size.height;
  final snackbar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    behavior: SnackBarBehavior.fixed,
    dismissDirection: DismissDirection.up,
    content: Container(
        padding: const EdgeInsets.all(8),
        // margin: EdgeInsets.only(bottom: screenHeight - 250),

        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          border: BorderDirectional(
            end: BorderSide(
              width: 8,
              color: color,
            ),
            bottom: BorderSide(
              width: 1,
              color: color,
            ),
            top: BorderSide(
              width: 1,
              color: color,
            ),
            start: BorderSide(
              width: 1,
              color: color,
            ),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              offset: Offset(0, 0),
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: icon == null
              ? MainAxisAlignment.end
              : MainAxisAlignment.spaceBetween,
          children: [
            icon != null ? Icon(icon as IconData?, color: color) : Container(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(heading.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(message.toUpperCase(),
                      maxLines: 1,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 12)),
                ),
              ],
            ),
          ],
        )),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
