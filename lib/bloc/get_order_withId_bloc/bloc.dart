import 'package:bir_qadam_pos/core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/models.dart';
import '../../provider/ordering_provider.dart';
import '../../services/services.dart';
part 'event.dart';
part 'state.dart';

class GetOrdersWithIdBloc
    extends Bloc<GetOrdersWithIdEvent, GetOrdersWithIdState> {
  final BuildContext context;

  GetOrdersWithIdBloc(this.context) : super(GetOrdersWithIdInitial()) {
    on<StartGetOrdersWithIdEvent>(getAllOrdersWithId);
  }

  Future<void> getAllOrdersWithId(
    StartGetOrdersWithIdEvent event,
    Emitter<GetOrdersWithIdState> emit,
  ) async {
    emit(GetAllOrdersWithIdProccess());
    print(event.id);
    HttpResult result = await ApiService.getOrdersWithId(event.id);

    if (result.isSuccess) {
      Map<String, dynamic> parsedJson = jsonDecode(jsonEncode(result.result));
      OrderModel orders = OrderModel.fromJson(parsedJson);
      print(orders.items?.length);
      Provider.of<OrderingProvider>(context, listen: false).addClient();

      orders.items?.forEach((e) {
        Provider.of<OrderingProvider>(context, listen: false).addProduct(
          item: e,
        );
      });
      Provider.of<OrderingProvider>(context, listen: false).addOrderId(
        id: orders.id ?? 0,
      );
      emit(GetAllOrdersWithIdSuccess(ordersesList: orders, id: orders.id!));
    } else {
      emit(GetAllOrdersWithIdFailure(msg: result.result));
    }
  }
}


/*{
  "id": 18963,
  "customer": {
    "id": 4572,
    "phone": "+998339540690",
    "full_name": "Asadbek Abdumajidov"
  },
  "customer_address": {
    "id": 2546,
    "location": {
      "latitude": 40.52247720789082,
      "longitude": 70.97040429711342
    },
    "created_at": "2024-08-30T19:50:52.076040+05:00",
    "updated_at": "2024-10-11T17:23:37.381108+05:00",
    "name": "2wqewqe",
    "address": "Oʻzbekiston, Fargʻona viloyati, Qoʻqon",
    "type": "home",
    "apartment": "2",
    "entrance": "22",
    "floor": "2",
    "target": "ad",
    "street_name": null,
    "is_deliverable": true,
    "has_deliverable_request": false,
    "is_default": false,
    "is_delete": false,
    "_created_by": null,
    "_modified_by": null,
    "customer": 4572
  },
  "deliverer": null,
  "created_at": "2024-09-18T15:53:12.872689+05:00",
  "updated_at": "2024-10-02T12:28:22.518561+05:00",
  "status": "collected",
  "payment_type": "cash",
  "chosen_deliverer": "male",
  "deliver_in_the_shortest_time": false,
  "delivery_date": "2024-09-18",
  "delivery_datetime_from": "2024-09-18T18:00:00+05:00",
  "delivery_datetime_to": "2024-09-18T18:30:00+05:00",
  "delivery_cost": "0.00",
  "qr_url": null,
  "fiscal_sign": null,
  "receipt_seq": null,
  "terminal_id": null,
  "virtual_number": null,
  "price": "73000.00",
  "actual_price": null,
  "source": "mobile",
  "note": "",
  "canceled_by": "",
  "payment_status": "not_paid",
  "pay_online": "0.00",
  "pay_cash": "73000.00",
  "pay_from_balance": "0.00",
  "pay_with_card": "0.00",
  "received_online": "0.00",
  "received_cash": "0.00",
  "received_from_balance": "0.00",
  "received_from_card": "0.00",
  "_created_by": 4572,
  "_modified_by": 4550,
  "client_order": 667,
  "branch": {
    "id": 1,
    "name": "Asosiy filial - Qo'qon",
    "name_uz": "Asosiy filial - Qo'qon",
    "name_ru": "Основной филиал - Коканд",
    "name_en": "Main branch - Kokand"
  },
  "warehouse": {
    "id": 1,
    "name": "Do'kon zali",
    "name_uz": "Do'kon zali",
    "name_ru": "Зал магазина",
    "name_en": "Shop hall"
  },
  "operation_type": null,
  "items": [
    {
      "id": 98990,
      "product": {
        "id": 580,
        "name": "Yong'oqli shokoladli pasta nonushta va desert uchun \"Chococream\"",
        "name_uz": "Yong'oqli shokoladli pasta nonushta va desert uchun \"Chococream\"",
        "name_ru": "Шоколадная паста с орехами на завтрак и десерт \"Chococream\" 900г",
        "name_en": "Chocolate spread with nuts for breakfast and dessert “Chococream” 900g",
        "ordering_number": 117,
        "ikpu": "01806001001004009",
        "package_code": "1324151",
        "barcode": "4780033020133",
        "is_active": true,
        "has_series": false,
        "is_set": false,
        "is_sold": false,
        "is_recommended": false,
        "is_promo": false,
        "crosssell_products": [],
        "regular_price": "62500.00",
        "has_discount": false,
        "discounted_price": null,
        "discount_type": "fixed",
        "discount_percentage": null,
        "discount_start_date": null,
        "discount_end_date": null,
        "active_time_from": null,
        "active_time_to": null,
        "is_weight": false,
        "is_pieces": false,
        "is_mobile_visible": true,
        "category": {
          "id": 450,
          "name": "Nonushta uchun shirinliklar",
          "name_uz": "Nonushta uchun shirinliklar",
          "name_ru": "Десерты на завтрак",
          "name_en": "Desserts for breakfast",
          "short_name": "",
          "short_name_uz": null,
          "short_name_ru": null,
          "short_name_en": null,
          "is_active": true,
          "show_on_mainpage": false,
          "image": {
            "id": 6041,
            "normal": "https://api.bir-qadam.thinkland.uz/media/images/2023/10/29/images_6_normal.jpg",
            "small": "https://api.bir-qadam.thinkland.uz/media/images/2023/10/29/images_6_small.jpg",
            "icon": "https://api.bir-qadam.thinkland.uz/media/images/2023/10/29/images_6_icon.jpg",
            "original": null
          },
          "ordering_number": null,
          "home_page_ordering_number": null
        },
        "unit_type": {
          "id": 1,
          "created_at": "2023-03-04T08:50:16.925539+05:00",
          "updated_at": "2024-06-30T15:47:47.555320+05:00",
          "name": "Dona",
          "name_uz": "Dona",
          "name_en": "Piece",
          "name_ru": "Штук",
          "symbol": "dona",
          "symbol_uz": "dona",
          "symbol_en": "pcs",
          "symbol_ru": "шт",
          "_created_by": null,
          "_modified_by": 8
        },
        "measure": {
          "id": 3,
          "created_at": "2024-06-23T12:43:51.771724+05:00",
          "updated_at": "2024-06-23T12:43:51.771749+05:00",
          "name": "Gramm",
          "name_uz": "Gramm",
          "name_en": "gramme",
          "name_ru": "грамм",
          "symbol": "gr",
          "symbol_uz": "gr",
          "symbol_en": "gr",
          "symbol_ru": "гр",
          "_created_by": 4444,
          "_modified_by": 4444
        },
        "trademark": null,
        "unit_type_value": 1,
        "measure_size_value": null,
        "measure_value": 900,
        "size_weight": null,
        "size_height": null,
        "size_length": null,
        "size_width": null,
        "vat": 0,
        "limit": null,
        "main_image": {
          "id": 15402,
          "normal": "https://api.bir-qadam.thinkland.uz/media/images/2024/07/15/900g_2024-07-15_21-06-48_normal.webp",
          "small": "https://api.bir-qadam.thinkland.uz/media/images/2024/07/15/900g_2024-07-15_21-06-48_small.webp",
          "icon": "https://api.bir-qadam.thinkland.uz/media/images/2024/07/15/900g_2024-07-15_21-06-48_icon.webp",
          "is_main": true
        }
      },
      "product_variant": null,
      "series": null,
      "quantity": "1.000",
      "price": "62500.00",
      "actual_quantity": null,
      "actual_price": null,
      "created_at": "2024-09-18T15:53:12.958530+05:00",
      "updated_at": "2024-09-18T15:53:12.958565+05:00",
      "_created_by": 4572,
      "_modified_by": null,
      "warehouse": 1,
      "branch": 1,
      "final_sum": 62500,
      "commissioner": null
    },
    {
      "id": 98989,
      "product": {
        "id": 6132,
        "name": "\"Crafers\" Florida cookies dark",
        "name_uz": "\"Crafers\" Florida cookies dark",
        "name_ru": "\"Crafers\" Florida cookies dark",
        "name_en": "\"Crafers\" Florida cookies dark",
        "ordering_number": 191,
        "ikpu": "01806001001000001",
        "package_code": "1326228",
        "barcode": "4780111071088",
        "is_active": true,
        "has_series": false,
        "is_set": false,
        "is_sold": true,
        "is_recommended": true,
        "is_promo": true,
        "crosssell_products": [],
        "regular_price": "10500.00",
        "has_discount": false,
        "discounted_price": null,
        "discount_type": "fixed",
        "discount_percentage": null,
        "discount_start_date": null,
        "discount_end_date": null,
        "active_time_from": null,
        "active_time_to": null,
        "is_weight": false,
        "is_pieces": false,
        "is_mobile_visible": true,
        "category": {
          "id": 442,
          "name": "Pechene va vafli",
          "name_uz": "Pechene va vafli",
          "name_ru": "Печенье и вафли",
          "name_en": "Cookies and waffles",
          "short_name": "",
          "short_name_uz": null,
          "short_name_ru": null,
          "short_name_en": null,
          "is_active": true,
          "show_on_mainpage": false,
          "image": {
            "id": 5183,
            "normal": "https://api.bir-qadam.thinkland.uz/media/images/2023/10/06/images_1_normal.jpg",
            "small": "https://api.bir-qadam.thinkland.uz/media/images/2023/10/06/images_1_small.jpg",
            "icon": "https://api.bir-qadam.thinkland.uz/media/images/2023/10/06/images_1_icon.jpg",
            "original": null
          },
          "ordering_number": null,
          "home_page_ordering_number": null
        },
        "unit_type": {
          "id": 1,
          "created_at": "2023-03-04T08:50:16.925539+05:00",
          "updated_at": "2024-06-30T15:47:47.555320+05:00",
          "name": "Dona",
          "name_uz": "Dona",
          "name_en": "Piece",
          "name_ru": "Штук",
          "symbol": "dona",
          "symbol_uz": "dona",
          "symbol_en": "pcs",
          "symbol_ru": "шт",
          "_created_by": null,
          "_modified_by": 8
        },
        "measure": {
          "id": 3,
          "created_at": "2024-06-23T12:43:51.771724+05:00",
          "updated_at": "2024-06-23T12:43:51.771749+05:00",
          "name": "Gramm",
          "name_uz": "Gramm",
          "name_en": "gramme",
          "name_ru": "грамм",
          "symbol": "gr",
          "symbol_uz": "gr",
          "symbol_en": "gr",
          "symbol_ru": "гр",
          "_created_by": 4444,
          "_modified_by": 4444
        },
        "trademark": null,
        "unit_type_value": 1,
        "measure_size_value": null,
        "measure_value": 158,
        "size_weight": null,
        "size_height": null,
        "size_length": null,
        "size_width": null,
        "vat": 12,
        "limit": null,
        "main_image": {
          "id": 15252,
          "normal": "https://api.bir-qadam.thinkland.uz/media/images/2024/07/10/dark-2_IU7yFWk_normal.webp",
          "small": "https://api.bir-qadam.thinkland.uz/media/images/2024/07/10/dark-2_IU7yFWk_small.webp",
          "icon": "https://api.bir-qadam.thinkland.uz/media/images/2024/07/10/dark-2_IU7yFWk_icon.webp",
          "is_main": true
        }
      },
      "product_variant": null,
      "series": null,
      "quantity": "1.000",
      "price": "10500.00",
      "actual_quantity": null,
      "actual_price": null,
      "created_at": "2024-09-18T15:53:12.912499+05:00",
      "updated_at": "2024-09-18T15:53:12.912529+05:00",
      "_created_by": 4572,
      "_modified_by": null,
      "warehouse": 1,
      "branch": 1,
      "final_sum": 10500,
      "commissioner": null
    }
  ],
  "bonus_items": [],
  "bonus": null,
  "status_display": "Collected",
  "final_sum": 73000
}
*/