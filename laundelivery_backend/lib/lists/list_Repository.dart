import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:laundelivery_backend/hash_extention.dart';
import 'package:meta/meta.dart';

part 'list_Repository.g.dart';

@visibleForTesting
Map<String, TaskList> listDb = {};

@JsonSerializable()
// Tasklist Class
class TaskList extends Equatable {
// data source - in memory cache

// Constructor
  const TaskList({required this.id, required this.name});

//list ids'
  final String id;

//list items
  final String name;

// deserialtion
  factory TaskList.fromJson(Map<String, dynamic> json) =>
      _$TaskListFromJson(json);

//serlization
  Map<String, dynamic> toJson() => _$TaskListToJson(this);

// used to update value withen the object instead of updating the whole object

//copywith method
  TaskList copyWith({
    String? id,
    String? name,
  }) {
    return TaskList(
        id: id ?? this.id,
        name: name ?? this.name); // ?? means if not passed return this.id etc..
  }

// get the values
  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}


//repository class for tasklist
class TaskListRepository {
  //check in internal data source for a list with a given id
  Future<TaskList?> listById(String id) async {
    return listDb[id];
  }

//get all the list from the data Source
  Map<String, dynamic> getAllLists() {
    final formattedLists = <String, dynamic>{};

    if (listDb.isNotEmpty) {
      listDb.forEach(
        (String id) {
          final currentList = listDb[id];
          formattedLists?[id] = currentList?.toJson();
        } as void Function(String key, TaskList value),
      );
    }
    return formattedLists;
  }

  //Creating a new list with a given [Name]
  String createList({required String name}) {
    //dynamically generats the id
    final id = name.hashValue;

    //create our new Tasklist object and pass our two parameter
    final list = TaskList(id: id, name: name);

    // add a new tasklist object to our data source
    listDb[id] = list;
    return id;
  }

  //delete the tasklist object with a given [id]
  void deleteList(String id) {
    listDb.remove(id);
  }

  //Update operation 
  //note because the return of type future we set this to type future
  Future<void> updateList({required String id, required String name}) async{
    final currentList = listDb[id];

    if(currentList == null){
      return Future.error(Exception('List is not found'));
    }
    listDb[id] = TaskList(id: id, name: name);
  }
}
