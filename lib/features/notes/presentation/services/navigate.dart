import 'package:flutter/material.dart';

navigateTo(context, route) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));

navigateAndReplacement(context, route) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => route),
      (route) => false,
    );
