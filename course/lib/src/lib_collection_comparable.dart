/* 
  sort collections by providing a collection-compare function via a comparator or an object-compare method via the Comparable interface.
*/

class LibCollectionComparable{
  static sortUseComparable(){     
     var list = <Entity>[Entity(2) , Entity(1)];
     print('Before sort :');
     print("${list[0].index}  ${list[1].index}");
     list.sort();
     print('After sort :');
     print("${list[0].index}  ${list[1].index}");
  }

  static sortUseComparator(){
     
     List<Entity2> list = <Entity2>[Entity2(2) , Entity2(1)];
     print('Before sort :');
     print("${list[0].index}  ${list[1].index}");
     /*
     list.sort( (Entity2 a,Entity2 b){
       if(a.index > b.index) return 1;
       else if( a.index < b.index) return -1;
       return 0;
     });*/

     list.sort((x,y){
       return x.index.compareTo(y.index);
     });
     print('After sort');
     print("${list[0].index}  ${list[1].index}");
     
  }
}







//要讓 Entity集合可以被排序,Entity必須實作 Comparable
class Entity implements Comparable {

  final int index;
  Entity(this.index);

  @override
  int compareTo(other) {
    // when return
    //  negative integer , if ordered before 'other'
    //  positive integer , if ordered after 'other' element
    //  zero , if the class and 'other' element are ordered otgether
    return index.compareTo((other as Entity).index);
  }

}

//對於沒實作 Comparable的類別, 可透過 Comparator typedef
class Entity2 {
  final int index;
  Entity2(this.index);  
}











