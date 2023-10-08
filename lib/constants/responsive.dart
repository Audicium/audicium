import 'package:flutter/material.dart';

const mobileMaxWidth = 500.0;

bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < mobileMaxWidth;