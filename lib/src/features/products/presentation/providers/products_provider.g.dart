// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesHash() => r'019d35e1b468089831a44381dc5e6b10ef3a78e9';

/// See also [Categories].
@ProviderFor(Categories)
final categoriesProvider =
    AutoDisposeAsyncNotifierProvider<Categories, List<Category>>.internal(
  Categories.new,
  name: r'categoriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$categoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Categories = AutoDisposeAsyncNotifier<List<Category>>;
String _$productsHash() => r'5cc5df72e759a008b8da6e0aaec35c669b365fb1';

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

abstract class _$Products
    extends BuildlessAutoDisposeAsyncNotifier<List<Product>> {
  late final Category? category;

  FutureOr<List<Product>> build({
    Category? category,
  });
}

/// See also [Products].
@ProviderFor(Products)
const productsProvider = ProductsFamily();

/// See also [Products].
class ProductsFamily extends Family<AsyncValue<List<Product>>> {
  /// See also [Products].
  const ProductsFamily();

  /// See also [Products].
  ProductsProvider call({
    Category? category,
  }) {
    return ProductsProvider(
      category: category,
    );
  }

  @override
  ProductsProvider getProviderOverride(
    covariant ProductsProvider provider,
  ) {
    return call(
      category: provider.category,
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
  String? get name => r'productsProvider';
}

/// See also [Products].
class ProductsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Products, List<Product>> {
  /// See also [Products].
  ProductsProvider({
    Category? category,
  }) : this._internal(
          () => Products()..category = category,
          from: productsProvider,
          name: r'productsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productsHash,
          dependencies: ProductsFamily._dependencies,
          allTransitiveDependencies: ProductsFamily._allTransitiveDependencies,
          category: category,
        );

  ProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final Category? category;

  @override
  FutureOr<List<Product>> runNotifierBuild(
    covariant Products notifier,
  ) {
    return notifier.build(
      category: category,
    );
  }

  @override
  Override overrideWith(Products Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductsProvider._internal(
        () => create()..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Products, List<Product>>
      createElement() {
    return _ProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductsProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductsRef on AutoDisposeAsyncNotifierProviderRef<List<Product>> {
  /// The parameter `category` of this provider.
  Category? get category;
}

class _ProductsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Products, List<Product>>
    with ProductsRef {
  _ProductsProviderElement(super.provider);

  @override
  Category? get category => (origin as ProductsProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
