import 'dart:async';

//使用非同步簡潔語法

Future usesAwait(Future lager) async {
  print(await lager);
}

Future asyncError() async {
  throw 'Error';
}

Future asyncValue() async => 'value';

Future afterTwoThings(Future first, Future second) async{
 // return Future.await([first,second]);
}


/****************************************************************************************************************************************** */
var port = 8990;   
   var server = await HttpServer.bind(InternetAddress.loopbackIPv4 , port);
   await for(var request in server) {  

      //request.method
      //request.headers.contentType
      //request.uri
      //request.header


       Map<String,String> queryParameters = request.uri.queryParameters;
      if(queryParameters != null) {
        print('Receive query parameters :');
        queryParameters.forEach((key,val)=>print(" $key = $val"));
      }

      var json = await request.transform(utf8.decoder).join();
      var dartObj = jsonDecode(json) as Map;

        request.response.headers.add('Access-Control-Allow-Origin', '*');
        request.response.headers.add('Access-Control-Allow-Methods', 'POST, OPTIONS');
        request.response.headers.add('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
        request.response.headers.add(HttpHeaders.contentTypeHeader, 'applicaion/json');

        //Response加上 ContentType
        request.response.headers.contentType = ContentType('text','plain');

      request.response ..statusCode = HttpStatus.ok
                      .. write('hello world');

      //重要
      if(request.uri.queryParameters['quit'] != null) {
        await server.close(); //關閉
        }
   } 

   var server1 = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
   server1.forEach((socket) async{
     
   });

   var server3 = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
   server3.listen( handleRequest, onError: (e)=> print(e));
   












/********************************************************************************************************************************************************************************************************************************** */

Choosing the right collection : 
  1. List , Set (LinkedHashSet) , Map (LinkedHashMap) classes are perfect choices for general purposes .
  2. Choosing a class implements the minimum functionality that you require. Don`t choose a class that supports sorting if you don`t actually need it .UnsupportedError


  order :  The Iterator follows the fail-fast principles to immediately report whether the iterating collection was modified. If you plan to create your own implementation of the Iterable interface, you need to extend IterableBase or IterableMixin. BidirectionalIterator helps to iterate over collections
of elements in both directions.
  sort  : We can also sort collections by providing a collection-compare function via a Comparator or an object-compare method via the Comparable interface.


LinkedList does not extend the List class.
HashSet, LinkedHashSet, and SplayTreeSet are implementations of the Set interface.
ListQueue is the implementation of the Queue interface.
HasMap, LinkedHasMap, and SplayTreeMap are implementations of the Map interface.



  CLASS        ORDER   SORT  Random-access   KeyValue   Duplicates   Null
  -----------------------------------------------------------------------------------
  List          yes    yes       yes           no          yes         yes
  LinkedList    yes    no        no            no          yes         yes

  Set           yes    no        no            no          no          no
  LinkedHashSet yes    no        no            no          no          no

  HashSet       no     no        no            no          no          no 

  Queue         yes    yes       no            no          yes         yes
  ListQueue     yes    yes       no            no          yes         yes

  Map           yes    no        yes           yes          no         yes
  LinkedHashMap yes    no        yes           yes          no         yes

  HashMap       no     no        yes           yes          no         yes

























































