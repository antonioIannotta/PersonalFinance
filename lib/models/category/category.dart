enum Category {
  grocery,
  eatOut,
  savings,
  salary,
  clothes,
  gift,
  travel,
  house,
  technology,
  condom,
  rent,
  laundry,
  car,
  dentistry,
  medicalCheck,
  workFood,
  carWashing,
  barberShop,
  medicine,
  entertainment,
  energy
}

extension CategoryExtension on Category {
  String get name {
    switch (this) {
      case Category.grocery:
        return "Grocery";
        break;
      case Category.eatOut:
        return "Eat out";
        break;
      case Category.clothes:
        return "Clothes";
      case Category.gift:
        return "Gift";
      case Category.travel:
        return "Travel";
      case Category.house:
        return "House";
      case Category.technology:
        return "Technology";
      case Category.condom:
        return "Condom";
      case Category.rent:
        return "Rent";
      case Category.laundry:
        return "Laundry";
      case Category.car:
        return "Car";
      case Category.dentistry:
        return "Dentistry";
      case Category.medicalCheck:
        return "Medical Check";
      case Category.workFood:
        return "Work food";
      case Category.carWashing:
        return "Car Washing";
      case Category.barberShop:
        return "Barber Shop";
      case Category.medicine:
        return "Medicine";
      case Category.entertainment:
        return "Entertainment";
      case Category.energy:
        return "Energy";
      default:
        return "Extra";
    }
  }
}