import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/services/backend/data_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/products/entities/product_entity.dart';
import 'package:fruit_hub/features/products/models/product_model.dart';
import 'package:fruit_hub/features/products/repos/products_repo/products_repo.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =
          await databaseService.getData(
                path: BackendEndpoint.getProducts,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseService.getData(path: BackendEndpoint.getProducts)
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }
}

// import 'package:dartz/dartz.dart';
// import 'package:fruit_hub/core/errors/failures.dart';
// import 'package:fruit_hub/core/services/backend/data_service.dart';
// import 'package:fruit_hub/core/utils/backend_endpoint.dart';
// import 'package:fruit_hub/features/products/entities/product_entity.dart';
// import 'package:fruit_hub/features/products/models/product_model.dart';
// import 'package:fruit_hub/features/products/repos/products_repo/products_repo.dart';

// class ProductsRepoImpl extends ProductsRepo {
//   final DatabaseService databaseService;

//   ProductsRepoImpl(this.databaseService);
//   @override
//   Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
//     try {
//       var data =
//           await databaseService.getData(
//                 path: BackendEndpoint.getProducts,
//                 query: {
//                   'limit': 10,
//                   'orderBy': 'sellingCount',
//                   'descending': true,
//                 },
//               )
//               as List<Map<String, dynamic>>;
//       List<ProductEntity> products = data
//           .map((e) => ProductModel.fromJson(e).toEntity())
//           .toList();
//       return right(products);
//     } catch (e) {
//       return left(ServerFailure('Failed to get products'));
//     }
//   }

//   @override
//   Future<Either<Failure, List<ProductEntity>>> getProducts() async {
//     try {
//       var data =
//           await databaseService.getData(path: BackendEndpoint.getProducts)
//               as List<Map<String, dynamic>>;

//       List<ProductEntity> products = data
//           .map((e) => ProductModel.fromJson(e).toEntity())
//           .toList();
//       return right(products);
//     } catch (e) {
//       return left(ServerFailure('Failed to get products'));
//     }
//   }
// }
