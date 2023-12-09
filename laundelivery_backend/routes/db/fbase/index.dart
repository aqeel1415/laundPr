import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:firedart/firestore/firestore.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch(context.request.method){
    HttpMethod.get => _getLists(context),
    HttpMethod.post => _createList(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed))
  };
}

//collection like table in sql
// value is a page which is an array of documents
//document is a like a json object with key value

Future<Response> _getLists(RequestContext context) async{
  final lists = <Map<String, dynamic>>[];
  await Firestore.instance.collection("tasklists").get().then((event){
    //loop in the page
    for(final doc in event){
      lists.add(doc.map);
    }
  });

  return Response.json(body: lists.toString());
}

Future<Response> _createList(RequestContext context) async{
  final body = await context.request.json() as Map<String,dynamic>;
  final name = body['name'] as String?;


  final list = <String,dynamic>{'name': name};

  final id = Firestore.instance.collection('tasklists').add(list).then((doc){
    return doc.id;                           // we just want the id when creating the document
  });

  return Response.json(body: {'id': id});
}