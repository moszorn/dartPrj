import 'dart:async';
import 'dart:io';




 int lib_sortFun(int a, int b) {
  if (a > b) return 1;
  if (a < b) return -1;
  return 0;
}

//用了typedef 
//typedef只是簡單的別名，通過用來檢查函數類型。
typedef int Compare(Object a, Object b);

class LibFunction {

  Function sortFunction;
  Compare compare;

  LibFunction(this.sortFunction);
  LibFunction.setCompare(this.compare);

  sortIntList(List<int> tosorted) {
    tosorted.sort(sortFunction);
  }
  sortObjectList(List<Object> tosorted) {
    tosorted.sort(compare);
  }
}
