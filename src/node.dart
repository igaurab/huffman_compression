class Node {
  Node left;
  Node right;

  String char;
  double prob;

  Node({String char, double prob}) {
    this.char = char;
    this.prob = prob;
  }
}