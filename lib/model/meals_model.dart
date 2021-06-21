class MealModel{
  String mealName;
  String mealId;

  MealModel({
    required this.mealId,
    required this.mealName,
    required this.mealImg,
    required this.mealLikeCount});

  String mealImg;
  String mealLikeCount;
}

var listMeal = [
  MealModel(
      mealId: "52928",
      mealName: "BeaverTails",
      mealImg: "https://www.themealdb.com/images/media/meals/ryppsv1511815505.jpg",
      mealLikeCount: "2304"
  ),
  MealModel(
      mealId: "52965",
      mealName: "Breakfast Potatoes",
      mealImg: "https://www.themealdb.com/images/media/meals/1550441882.jpg",
      mealLikeCount: "1043"
  ),
  MealModel(
      mealId: "52923",
      mealName: "Canadian Butter Tarts",
      mealImg: "https://www.themealdb.com/images/media/meals/wpputp1511812960.jpg",
      mealLikeCount: "1243"
  ),
  MealModel(
      mealId: "52924",
      mealName: "Nanaimo Bars",
      mealImg: "https://www.themealdb.com/images/media/meals/vwuprt1511813703.jpg",
      mealLikeCount: "1330"
  ),
  MealModel(
      mealId: "52930",
      mealName: "Pate Chinois",
      mealImg: "https://www.themealdb.com/images/media/meals/yyrrxr1511816289.jpg",
      mealLikeCount: "1330"
  ),
  MealModel(
      mealId: "52932",
      mealName: "Pouding chomeur",
      mealImg: "https://www.themealdb.com/images/media/meals/yqqqwu1511816912.jpg",
      mealLikeCount: "12330"
  ),
  MealModel(
      mealId: "52804",
      mealName: "Poutine",
      mealImg: "https://www.themealdb.com/images/media/meals/uuyrrx1487327597.jpg",
      mealLikeCount: "1332"
  ),
  MealModel(
      mealId: "52933",
      mealName: "Rappie Pie",
      mealImg: "https://www.themealdb.com/images/media/meals/ruwpww1511817242.jpg",
      mealLikeCount: "13431"
  ),
  MealModel(
      mealId: "52925",
      mealName: "Split Pea Soup",
      mealImg: "https://www.themealdb.com/images/media/meals/xxtsvx1511814083.jpg",
      mealLikeCount: "52925"
  ),
  MealModel(
      mealId: "52931",
      mealName: "Sugar Pie",
      mealImg: "https://www.themealdb.com/images/media/meals/yrstur1511816601.jpg",
      mealLikeCount: "32309"
  ),
  MealModel(
      mealId: "52929",
      mealName: "Timbits",
      mealImg: "https://www.themealdb.com/images/media/meals/txsupu1511815755.jpg",
      mealLikeCount: "21039"
  ),
  MealModel(
      mealId: "52926",
      mealName: "Tourtiere",
      mealImg: "https://www.themealdb.com/images/media/meals/ytpstt1511814614.jpg",
      mealLikeCount: "32102"
  ),

];