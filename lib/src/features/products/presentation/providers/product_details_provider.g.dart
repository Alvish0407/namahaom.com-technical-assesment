// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productDetailsHash() => r'8f087951ea39d1600ae7e90a7e34021d91600594';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ProductDetails
    extends BuildlessAutoDisposeAsyncNotifier<Product> {
  late final int id;

  FutureOr<Product> build({
    required int id,
  });
}

/// See also [ProductDetails].
@ProviderFor(ProductDetails)
const productDetailsProvider = ProductDetailsFamily();

/// See also [ProductDetails].
class ProductDetailsFamily extends Family<AsyncValue<Product>> {
  /// See also [ProductDetails].
  const ProductDetailsFamily();

  /// See also [ProductDetails].
  ProductDetailsProvider call({
    required int id,
  }) {
    return ProductDetailsProvider(
      id: id,
    );
  }

  @override
  ProductDetailsProvider getProviderOverride(
    covariant ProductDetailsProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productDetailsProvider';
}

/// See also [ProductDetails].
class ProductDetailsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductDetails, Product> {
  /// See also [ProductDetails].
  ProductDetailsProvider({
    required int id,
  }) : this._internal(
          () => ProductDetails()..id = id,
          from: productDetailsProvider,
          name: r'productDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productDetailsHash,
          dependencies: ProductDetailsFamily._dependencies,
          allTransitiveDependencies:
              ProductDetailsFamily._allTransitiveDependencies,
          id: id,
        );

  ProductDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<Product> runNotifierBuild(
    covariant ProductDetails notifier,
  ) {
    return notifier.build(
      id: id,
    );
  }

  @override
  Override overrideWith(ProductDetails Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductDetailsProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProductDetails, Product>
      createElement() {
    return _ProductDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductDetailsRef on AutoDisposeAsyncNotifierProviderRef<Product> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProductDetailsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductDetails, Product>
    with ProductDetailsRef {
  _ProductDetailsProviderElement(super.provider);

  @override
  int get id => (origin as ProductDetailsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
