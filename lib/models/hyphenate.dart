String hyphenate(String word) {

  final vowelsSet = {'а', 'е', 'ё', 'и', 'о', 'у', 'ы', 'э', 'ю', 'ә', 'і', 'ү', 'ұ', 'ө', 'я'};
  final specialsSet = {'й', 'ь', 'ъ'};

  word = word.toLowerCase();

  var prevVowel = word.length;
  for (var i = 0; i < word.length; i++) {
    if (vowelsSet.contains(word[i])) {
      prevVowel = i;
      break;
    }
  }

  if (word[0] == 'у') prevVowel++;

  var pos = 0;
  final result = StringBuffer();

  for (var i = prevVowel + 1; i < word.length; i++) {
    if (vowelsSet.contains(word[i]) && word[i] != 'у') {
      final a = prevVowel;
      final b = i;
      if (b - a == 1) {
        result.write('${word.substring(pos, b)}-');
        pos = b;
      } else {
        for (var j = b - 1; j > a; j--) {
          if (specialsSet.contains(word[j])) {
            result.write('${word.substring(pos, j + 1)}-');
            pos = j + 1;
            break;
          }
        }
        if (b - a == 2) {
          result.write('${word.substring(pos, b - 1)}-');
          pos = b - 1;
        } else {
          result.write('${word.substring(pos, a + 2)}-');
          pos = a + 2;
        }
      }
      prevVowel = i;
    }
  }

  result.write(word.substring(pos));
  return result.toString();
}
