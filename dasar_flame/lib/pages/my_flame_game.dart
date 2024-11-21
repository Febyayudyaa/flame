import 'dart:async';
import 'dart:ui';

//import 'package:dasar_flame/component/asteroid.dart';
import 'package:dasar_flame/component/asteroid_spawner.dart';
import 'package:dasar_flame/component/bgParallaxComponent.dart';
import 'package:dasar_flame/component/ship.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
//import 'package:flame/src/components/core/component.dart';

class MyFlameGame extends FlameGame with PanDetector {
  late Ship s;
  late Bgparallaxcomponent bgparallax;
  late AsteroidSpawner asp;
  

  @override
  FutureOr<void> onLoad() async {
    bgparallax = Bgparallaxcomponent();
    add(bgparallax);

    s = Ship();
    add(s);

    asp = AsteroidSpawner();
    add(asp);
  }

 @override
  void onPanUpdate(DragUpdateInfo info) {
    
   s.setTujuan(info);
  }
  @override
  void update(double dt) {
    bgparallax.changeSpeedBasedShip(s);
    super.update(dt);
  }
  

  @override
  Color backgroundColor() {
    return const Color(0xFF000045); 
  }

}