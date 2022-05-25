abstract class Validators {
  static bool isDouble(String world) {
    try {
      world = world.replaceAll(',', '.');
      double.parse(world);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isInt(String world) {
    try {
      int.parse(world);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isEmpty(String? world) {
    return world == null || world.isEmpty;
  }
}
