mixin CommaUtil {
  static final RegExp _reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  static String mathFunc(Match match) => '${match[1]},';

  static String use(int num) => num.toString().replaceAllMapped(_reg, mathFunc);
}
