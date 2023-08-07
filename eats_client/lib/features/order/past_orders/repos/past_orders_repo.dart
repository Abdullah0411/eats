import 'package:eats_client/features/cart/domain/cart.dart';
import 'package:eats_client/features/delivery_apps/domain/delivery_apps_prices.dart';
import 'package:eats_client/features/meal/domain/meal/meal.dart';
import 'package:eats_client/features/meal/domain/meal_price/meal_price.dart';
import 'package:eats_client/features/order/domain/order.dart';
import 'package:eats_client/features/restaurants/domain/restaurant/restaurant.dart';
import 'package:eats_client/utils/enums/delivery_app.dart';
import 'package:eats_core/enums/order_status.dart';

class PastOrdersRepo {
  // static Future<List<Order>> get dummyOrders {
  //   final Order order = Order(
  //     restaurantId: '123',
  //     deliveryApp: DeliveryApp.jahez,
  //     id: '1234',
  //     orderDate: DateTime.now(),
  //     status: OrderStatus.completed,
  //     uid: '1234',
  //     cart: const Cart(
  //       orderedMeals: [
  //         Meal(
  //           name: 'San Sabastian',
  //           category: 'Cakes',
  //           imageUrl:
  //               'https://jahez.net/eRestaurant-services/m_getMenuLogos?menuId=1100560&width=980&height=450&_=1666459787694',
  //           id: '123',
  //           isAvailable: true,
  //           price: MealPrice(jahez: 18.0, toYou: 15.0),
  //           skuNumber: '',
  //         ),
  //         Meal(
  //           name: 'French Toast nutella',
  //           category: 'Desserts',
  //           imageUrl:
  //               'https://jahez.net/eRestaurant-services/m_getMenuLogos?menuId=813196&width=980&height=450&_=1649901482646',
  //           id: '1234',
  //           isAvailable: true,
  //           price: MealPrice(jahez: 40.25),
  //           skuNumber: '',
  //         ),
  //         Meal(
  //           name: 'Iced Irish Latte',
  //           category: 'Hot  Drinks',
  //           imageUrl:
  //               'https://res.cloudinary.com/dglgkomis/image/upload/v1667258903/products/product-c225f998-45ed-455c-9037-eeaa4e9baf6c/byzz8mr5wkdlrkdo273p.jpg',
  //           id: '12345',
  //           isAvailable: true,
  //           price: MealPrice(jahez: 18.0),
  //           skuNumber: '',
  //         ),
  //       ],
  //       restaurant: Restaurant(
  //         longitude: 0,
  //         latitude: 0,
  //         deliveryAppsPrices: DeliveryAppsPrices(Jahez: 20),
  //         deliveryAppRestaurantId: '',
  //         categories: ['Salads', 'Bakery'],
  //         deliveryAppsList: [],
  //         id: 'A',
  //         logo:
  //             'https://jahez.net/ShowRestaurantLogo.htm?lang=en&restaurantId=14305&lastUpdate=1665566270',
  //         name: 'Crafter Café',
  //         rating: 4.3,
  //       ),
  //     ),
  //   );
  //   final Order order2 = Order(
  //     restaurantId: '123',
  //     deliveryApp: DeliveryApp.shgardi,
  //     id: '1234',
  //     orderDate: DateTime.now(),
  //     status: OrderStatus.completed,
  //     uid: '1234',
  //     cart: const Cart(
  //       orderedMeals: [
  //         Meal(
  //           name: 'Cold Pumpkin',
  //           category: 'New Winter Drinks',
  //           imageUrl:
  //               'https://catalog.cdn.shgardi.app/ProductImages/a868381f-7cce-47c0-8c3f-cc26bd333f5a_2023-04-02_12-39-16-PM.jpeg',
  //           id: '123',
  //           isAvailable: true,
  //           price: MealPrice(shgardi: 24.0),
  //           skuNumber: '',
  //         ),
  //         Meal(
  //           name: 'Bounty Coconut Bunz',
  //           category: 'Desserts',
  //           imageUrl:
  //               'https://catalog.cdn.shgardi.app/ProductImages/855b5305-a858-4a3d-a1cb-c6615104b5c3_2023-04-02_12-41-26-PM.jpeg',
  //           id: '1234',
  //           isAvailable: true,
  //           price: MealPrice(shgardi: 21.0),
  //           skuNumber: '',
  //         ),
  //       ],
  //       restaurant: Restaurant(
  //         longitude: 0,
  //         latitude: 0,
  //         deliveryAppsPrices: DeliveryAppsPrices(Shgardi: 15),
  //         deliveryAppRestaurantId: '',
  //         categories: ['Beverages', 'Desserts'],
  //         deliveryAppsList: [],
  //         id: 'A',
  //         logo:
  //             'https://jahez.net/ShowRestaurantLogo.htm?lang=en&restaurantId=3892&lastUpdate=1680788938',
  //         name: 'Veloce Café',
  //         rating: 5.0,
  //       ),
  //     ),
  //   );

  //   final Order order3 = Order(
  //     restaurantId: '123',
  //     deliveryApp: DeliveryApp.toYou,
  //     id: '1234',
  //     orderDate: DateTime.now(),
  //     status: OrderStatus.completed,
  //     uid: '1234',
  //     cart: const Cart(
  //       orderedMeals: [
  //         Meal(
  //           name: 'Asian Chicken',
  //           category: 'Soup',
  //           imageUrl:
  //               'https://res.cloudinary.com/dglgkomis/image/upload/v1655016953/products/product-b30cb956-872a-45cb-abc4-7b79242f8844/udek9tijsfi7r01kijf8.jpg',
  //           id: '123',
  //           isAvailable: true,
  //           price: MealPrice(toYou: 39.0),
  //           skuNumber: '',
  //         ),
  //         Meal(
  //           name: 'Chicken Kale Caesar',
  //           category: 'Main Course',
  //           imageUrl:
  //               'https://res.cloudinary.com/dglgkomis/image/upload/v1654450861/products/product-b6283476-8206-4563-9e8f-2d73bdbbe66c/mwjm35mptwuhkkotpqvg.jpg',
  //           id: '12345',
  //           isAvailable: true,
  //           price: MealPrice(toYou: 42.0),
  //           skuNumber: '',
  //         ),
  //         Meal(
  //           name: 'Chicken Musakhan',
  //           category: 'Main Course',
  //           imageUrl:
  //               'https://res.cloudinary.com/dglgkomis/image/upload/v1654450897/products/product-fabd8fba-454e-49ab-9986-971296587cd1/vkhwlxrjd3lnnamv1iic.jpg',
  //           id: '1234',
  //           isAvailable: true,
  //           price: MealPrice(toYou: 28),
  //           skuNumber: '',
  //         ),
  //       ],
  //       restaurant: Restaurant(
  //         longitude: 0,
  //         latitude: 0,
  //         deliveryAppsPrices: DeliveryAppsPrices(ToYou: 10),
  //         deliveryAppRestaurantId: '',
  //         categories: ['Asian', 'Salad'],
  //         deliveryAppsList: [],
  //         id: 'A',
  //         logo:
  //             'https://res.cloudinary.com/dglgkomis/image/upload/v1654599568/merchants/oriz0we4ured8uor4wc4.jpg',
  //         name: 'Soul Bowl',
  //         rating: 4.3,
  //       ),
  //     ),
  //   );

  //   return Future.value([order, order2, order3]);
  // }

  static String getDeliverAppIconURL(DeliveryApp app) {
    // TODO: Refactor
    switch (app) {
      case DeliveryApp.jahez:
        return 'https://play-lh.googleusercontent.com/vo3LYx5f9xGcGD_23tnXYLtbShsTveRpKslOiB14QOu95I9A2OkB2wTB_ORd2-RB1E4=w480-h960-rw';
      case DeliveryApp.shgardi:
        return 'https://play-lh.googleusercontent.com/724QD7vRv8UEEtFZZLqviOD4SPHRi9PeVWCUUfRECfBScSK0qME8KDr8vEX8M5JCtys=w480-h960-rw';
      case DeliveryApp.toYou:
        return 'https://play-lh.googleusercontent.com/kpsFwUFQNVUNvG4EgOw06N_wOBjuUIiiYa04fhFQftLCkmWU0lww8ERMhSOfO_akDo8=w480-h960-rw';
      case DeliveryApp.hungerStation:
        return 'https://play-lh.googleusercontent.com/lxqIY6ukgrD2T6pVzGL9W7851Vll4xKrADJOl8gLOTVps9ZGUa3Z88DPrCXgAJ7TrZ8Y=w480-h960-rw';
    }
  }
}
