import 'package:flutter/material.dart';

const mobileMaxWidth = 450.0;

bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < mobileMaxWidth;