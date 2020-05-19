import 'package:flutter/material.dart';

import '../pages/alert_page.dart';
import '../pages/avatar_page.dart';
import '../pages/home_page.dart';

//metodo map que regresa un string y el widget builder
Map<String, WidgetBuilder> getApplicationRoutes(){

return <String,WidgetBuilder>{
        '/'      :(BuildContext context) => HomePage(),
        'alert'  :(BuildContext context) => AlertPage(),
        'avatar' :(BuildContext context) => AvatarPage(),
      };

}
