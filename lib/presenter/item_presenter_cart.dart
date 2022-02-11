import 'package:csi5112_project/data/item_data.dart';
import 'package:csi5112_project/injection/dependency_injection.dart';

abstract class ItemsListViewContractCart {
  void onLoadItemsComplete(List<Item> items);

  void onLoadItemsError();
}

class ItemsListPresenterCart {
  ItemsListViewContractCart view;
  late ItemRepository repository;

  ItemsListPresenterCart(this.view) {
    repository = Injector().itemRepository;
  }

  void loadItems() {
    assert(view != null);

    repository
        .fetch()
        .then((items) => view.onLoadItemsComplete(items))
        .catchError((onError) => view.onLoadItemsError());
  }
}
