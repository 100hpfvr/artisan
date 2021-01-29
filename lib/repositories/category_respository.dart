import 'package:artisan/repositories/table_keys.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class CategoryRepository {
  getList() async{
 final queryBuilder = QueryBuilder(ParseObject(keyCategoryTable))..orderByAscending(keyCategoryDescription);

 final response = await queryBuilder.query();

 if(response.success){


 }

  }

}