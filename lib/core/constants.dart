import 'package:flutter_neumorphic/flutter_neumorphic.dart';

const double horizontalPadding = 25;

// Asset Constants
const String userPlaceholder = 'assets/images/user_placeholder.png';

// Neumorphic Constants
NeumorphicStyle neumorphicStyleWithoutBorder = NeumorphicStyle(
  shape: NeumorphicShape.flat,
  color: Colors.grey,
  depth: 5,
  intensity: 0.8,
  lightSource: LightSource.topLeft,
  shadowLightColor: Colors.grey.shade300,
  shadowDarkColor: Colors.grey.shade800,
  //boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
);

NeumorphicStyle neumorphicStyleWithBorder = NeumorphicStyle(
  shape: NeumorphicShape.flat,
  color: Colors.grey,
  depth: 5,
  intensity: 0.8,
  lightSource: LightSource.topLeft,
  shadowLightColor: Colors.grey.shade300,
  shadowDarkColor: Colors.grey.shade800,

  border: NeumorphicBorder(
    color: Colors.grey.shade600,
  ),
  //boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
);

NeumorphicStyle neumorphicStyleWithBorderCustomized(bColor) => NeumorphicStyle(
      shape: NeumorphicShape.flat,
      color: bColor,
      depth: 5,
      intensity: 0.8,
      lightSource: LightSource.topLeft,
      shadowLightColor: Colors.grey.shade300,
      shadowDarkColor: Colors.grey.shade800,
      border: NeumorphicBorder(
        color: Colors.grey.shade600,
      ),
    );
