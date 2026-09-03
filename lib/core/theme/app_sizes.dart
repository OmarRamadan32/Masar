import 'package:flutter/material.dart';

abstract class AppSizes {
  static const double s4 = 4.0;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s16 = 16.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s32 = 32.0;


  //-- Heights
  static const SizedBox h4 = SizedBox(height: s4);
  static const SizedBox h8 = SizedBox(height: s8);
  static const SizedBox h10 = SizedBox(height: s10);
  static const SizedBox h12 = SizedBox(height: s12);
  static const SizedBox h16 = SizedBox(height: s16);
  static const SizedBox h20 = SizedBox(height: s20);
  static const SizedBox h24 = SizedBox(height: s24);
  static const SizedBox h32 = SizedBox(height: s32);

  //-- Widths
  static const SizedBox w4 = SizedBox(width: s4);
  static const SizedBox w8 = SizedBox(width: s8);
  static const SizedBox w10 = SizedBox(width: s10);
  static const SizedBox w12 = SizedBox(width: s12);
  static const SizedBox w16 = SizedBox(width: s16);
  static const SizedBox w20 = SizedBox(width: s20);
  static const SizedBox w24 = SizedBox(width: s24);
  static const SizedBox w32 = SizedBox(width: s32);

  static final BorderRadius r8 = BorderRadius.circular(s8);
  static final BorderRadius r12 = BorderRadius.circular(s12);
  static final BorderRadius r16 = BorderRadius.circular(s16);
  static final BorderRadius r20 = BorderRadius.circular(s20);
  static final BorderRadius r24 = BorderRadius.circular(s24);
  static final BorderRadius r30 = BorderRadius.circular(30.0);
}