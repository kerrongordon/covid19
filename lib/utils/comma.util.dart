class CommaUtil {
  static final RegExp _reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  static final Function _mathFunc = (Match match) => '${match[1]},';

  static String use(int num) =>
      num.toString().replaceAllMapped(_reg, _mathFunc);
}
