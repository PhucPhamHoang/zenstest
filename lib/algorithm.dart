String miniMaxSum(List<num> input) {
  String res = 'Input: ${input} \nResult: ';

  num minSum = 0;
  num maxSum = 0;
  int inputLength = input.length;

  for(int i = 0; i < inputLength; i++) {
    if(i == 0) {
      minSum += input[i];
    }
    else if(i == inputLength - 1) {
      maxSum += input[i];
    }
    else {
      minSum += input[i];
      maxSum += input[i];
    }
  }
  res += '${minSum}  ${maxSum}';
  return res;
}

bool isInputValid(List<num> input) {
  if(input.length != 5) {
    return false;
  }

  for(num val in input) {
    if(val < 0 || val is! int) {
      return false;
    }
  }
  return true;
}

void main() {
  List<num> input = [2,5,1,3,4];
  if(isInputValid(input)) {
    print('The size of input list must contain 5 positive integer');
  }
  input.sort((num1, num2) => num1.compareTo(num2));

  print(miniMaxSum(input));
}