/// 複数のクラスを継承できる
/// mixin元のクラスはフィールドを持たない

mixin Swimming {
  void swim() {
    print('swimming');
  }
}

class Dolphin with Swimming {}

mixin Bird {
  void fly() {
    print('flying');
  }
}

class FlyingFish extends Dolphin with Bird {}

void whatMixinMain() {
  var dolphin = Dolphin();
  dolphin.swim();

  var flyingFish = FlyingFish();
  flyingFish.swim();
  flyingFish.fly();
}
