import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/nutrition/ui/widgets/nutrition_expanded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Nutrition in pregnancy',
            style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                Text(
                  'Healthy eating during pregnancy',
                  style: getBoldStyle(color: Colors.black, fontSize: 16.sp),
                ),
                verticalSpace(20),
                Text(
                  '●  Following a healthy dietary pattern:',
                  style: getMediumStyle(
                      color: ColorManger.darkPrimary, fontSize: 16.sp),
                ),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Vegetables',
                    icon: 'vegetable',
                    description:
                        'Dark green, red, and orange vegetables; beans, peas, and lentils, starchy vegetables, other vegetables'),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Fruits',
                    icon: 'fruits',
                    description: 'Especially whole fruits'),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Grains',
                    icon: 'wheat-sack',
                    description:
                        'At least half of which should be whole grains'),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Dairy',
                    icon: 'dairy-products',
                    description:
                        'Including fat-free or low-fat milk, yogurt, and cheese, and/or lactose-free versions and fortified soy beverages and yogurt as alternatives'),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Protein foods',
                    icon: 'protein',
                    description:
                        'Including lean meats, poultry, and eggs; seafood; beans, peas, and lentils; and nuts, seeds, and soy products'),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Oils',
                    icon: 'frying-pan',
                    description:
                        'Including vegetable oils and oils in food, such as in seafood and nuts'),
                verticalSpace(30),
                Text(
                  '●  Limiting consumption of added sugars, saturated fat, and sodium:',
                  style: getMediumStyle(
                      color: ColorManger.darkPrimary, fontSize: 16.sp),
                ),
                verticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/sugar-free.png',
                          width: 55.w,
                          height: 55.h,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/trans-fat.png',
                          width: 55.w,
                          height: 55.h,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/no-salt.png',
                          width: 55.w,
                          height: 55.h,
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpace(5),
                Text(
                  'Pregnant people (and others) typically exceed recommended limits for these substances, and this may have negative health consequences. They should focus on increasing intake of high-quality, nutrient-dense foods and attempt to limit intake of processed "empty-calorie" foods and beverages. Avoiding or limiting consumption of highly processed foods is an important means of decreasing consumption of sugar, saturated fat, and sodium',
                  style: getRegularStyle(
                      color: Colors.black, fontSize: 12.sp, textHeight: 1.2.h),
                ),
                verticalSpace(30),
                Text(
                  '●  Appropriate gestational weight gain:',
                  style: getMediumStyle(
                      color: ColorManger.darkPrimary, fontSize: 16.sp),
                ),
                verticalSpace(20),
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/gain-weight.png',
                        width: 55.w,
                        height: 55.h,
                      ),
                    ),
                  ],
                ),
                verticalSpace(5),
                Text(
                  'Weight gain is routinely monitored throughout pregnancy Prepregnancy body mass index (BMI) and gestational weight gain have independent, but cumulative, effects on birth weight, maternal weight retention long after delivery, and possibly gestational duration and risk of childhood obesity; BMI is considered to have the stronger effect. The incidence of pregnancy complications is higher at the upper and lower extremes of weight gain.',
                  style: getRegularStyle(
                      color: Colors.black, fontSize: 12.sp, textHeight: 1.2.h),
                ),
                verticalSpace(20),
                Text(
                  '●  Avoiding alcohol and other known or potential harmful substances (eg, mercury)',
                  style: getMediumStyle(
                      color: ColorManger.darkPrimary, fontSize: 16.sp),
                ),
                verticalSpace(20),
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/no-drinking.png',
                        width: 55.w,
                        height: 55.h,
                      ),
                    ),
                  ],
                ),
                verticalSpace(30),
                Text(
                  '● Limiting caffeine intake:',
                  style: getMediumStyle(
                      color: ColorManger.darkPrimary, fontSize: 16.sp),
                ),
                verticalSpace(20),
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/no-caffeine.png',
                        width: 55.w,
                        height: 55.h,
                      ),
                    ),
                  ],
                ),
                verticalSpace(10),
                Text(
                  'to less than 200 to 300 mg per day',
                  style: getRegularStyle(
                      color: Colors.black, fontSize: 12.sp, textHeight: 1.2.h),
                ),
                verticalSpace(20),
                Text(
                  '●  Safe food handling',
                  style: getMediumStyle(
                      color: ColorManger.darkPrimary, fontSize: 16.sp),
                ),
                verticalSpace(20),
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/food-safety.png',
                        width: 55.w,
                        height: 55.h,
                      ),
                    ),
                  ],
                ),
                verticalSpace(30),
                Text(
                  'DIETARY REQUIREMENTS',
                  style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
                ),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Water and other fluids',
                    icon: 'water-bottle',
                    description:
                        'During pregnancy, adequate fluid intake from consumption of beverages (water and other liquids) is estimated to be approximately 2.3 L/day (76 fluid ounces or approximately 10 cups)'),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Energy intake',
                    icon: 'renewable-energy',
                    description:
                        'Additional energy requirements for pregnancy differ by body mass index (BMI) class:\n●  Normal BMI range: An additional 340 and 450 kcal/day is suggested for the second and third trimesters, respectively , or a total of between 2200 and 2900 kcal/day .\n●  Underweight BMI range: An additional intake above 340 and 450 kcal/day is suggested to support adequate weight gain, individualized depending on the patients baseline BMI .\n●  Overweight BMI range: An additional 260 to 360 kcal/day is suggested, which is less than the 340 and 450 kcal/day suggested for those with a normal BMI .\n●  Obese BMI range: These patients may not need any additional calories'),
                verticalSpace(20),
                Text(
                  'Macronutrients:',
                  style: getMediumStyle(
                      color: ColorManger.darkPrimary, fontSize: 16.sp),
                ),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Protein',
                    icon: 'protein',
                    description:
                        '●  Recommended intake:\nThe Dietary Guidelines for Americans recommend a minimum daily nutritional goal of 71 g/day (1.1 g/kg/day)\n●  Sources : Healthy protein sources include lean meats, poultry and eggs, seafood, beans, peas, lentils, nuts, seeds, and soy products. Highly processed meats are not recommended'),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Carbohydrate and fiber',
                    icon: 'carbohydrates',
                    description:
                        '●  Recommended intake:\nCarbohydrate requirements increase to 175 g/day in pregnancy\n●  Sources :The focus should be on consuming several servings of whole foods: fruits, vegetables, and whole grains. Highly processed carbohydrates should be minimized to help manage weight gain and avoid high postprandial blood glucose levels, particularly among those with or at high risk of diabetes'),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Fat',
                    icon: 'trans-fat (1)',
                    description:
                        '●  Recommended intake:\nThe Dietary Guidelines for Americans set daily nutritional goals for pregnant individuals as 20 to 35 percent of total energy intake from fats, <10 percent of total energy from saturated fat, and daily goals for essential fatty acids of 13 g/day of linoleic acid (18:2) and 1.4 g/day of linolenic acid\n●  Sources :The Dietary Guidelines for Americans set daily nutritional goals for pregnant individuals as 20 to 35 percent of total energy intake from fats, <10 percent of total energy from saturated fat, and daily goals for essential fatty acids of 13 g/day of linoleic acid (18:2) and 1.4 g/day of linolenic acid'),
                verticalSpace(20),
                Text(
                  'Micronutrients:',
                  style: getMediumStyle(
                      color: ColorManger.darkPrimary, fontSize: 16.sp),
                ),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Iron',
                    icon: 'symbol',
                    description:
                        '●  Recommended intake:\nDietary reference values for iron in pregnancy vary  worldwide . The CDC recommend iron intake of 27 mg/day during pregnancy (up from 18 mg/day in nonpregnant/non-lactating people) to prevent iron deficiency anemia\n●  Sources : The most bioavailable form is heme iron, which is found in meat, poultry, and fish. Non-heme iron, which comprises 60 percent of iron in animal foods and all of the iron in plant foods, fortified grains, and supplements, is less bioavailable. Absorption of non-heme iron is enhanced by vitamin-C-rich foods or muscle tissue (meats, poultry, and seafood) , and inhibited by consumption of dairy products and coffee/tea/cocoa'),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Calcium',
                    icon: 'calcium',
                    description:
                        '●  Recommended intake:\nIn the United States, the recommended daily allowance for calcium is 1000 to 1300 mg/day in pregnant and lactating individuals, depending on age\n●  Sources :\n• Dairy products like milk, cheese and yogurt\n• Seafood\n• Leafy greens like kale, spinach, and collard greens\n• Legumes\n• Dried fruit\n• Tofu\n• Various foods that are fortified with calcium, such as orange juice and cereals'),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Vitamin-d',
                    icon: 'vitamin-d',
                    description:
                        '●  Recommended intake:\nThe Dietary Guidelines for Americans recommend daily intake of 600 international units per day during pregnancy [18]. Vitamin D deficiency is estimated to affect between 40 and 98 percent of pregnant individuals worldwide\n●  Sources :\nDermal synthesis after exposure to sunlight is the major natural source of the vitamin. Very few foods naturally contain vitamin D (fatty fish livers are the exception).\nSupplements often specify the type of vitamin D they contain. Most prescription prenatal vitamins contain cholecalciferol (D3), but some contain ergocalciferol (D2), and some contain a mixture. Many commercial nonprescription products labeled "vitamin D" (multivitamin supplements, fortified milk, and bread) contain D2 rather than D3. D3 is more readily converted to active forms of vitamin D and is more effective at increasing serum 25-hydroxyvitamin D.'),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Folic acid',
                    icon: 'symbol',
                    description:
                        '●  Recommended intake:\nDietary reference values for iron in pregnancy vary  worldwide . The CDC recommend iron intake of 27 mg/day during pregnancy (up from 18 mg/day in nonpregnant/non-lactating people) to prevent iron deficiency anemia\n●  Sources : The most bioavailable form is heme iron, which is found in meat, poultry, and fish. Non-heme iron, which comprises 60 percent of iron in animal foods and all of the iron in plant foods, fortified grains, and supplements, is less bioavailable. Absorption of non-heme iron is enhanced by vitamin-C-rich foods or muscle tissue (meats, poultry, and seafood) , and inhibited by consumption of dairy products and coffee/tea/cocoa'),
                verticalSpace(30),
                Text(
                  'Other micronutrients:',
                  style: getMediumStyle(
                      color: ColorManger.darkPrimary, fontSize: 16.sp),
                ),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Choline',
                    icon: 'Choline',
                    description:
                        '●  Recommended intake:\nThe Dietary Guidelines for Americans recommend daily intake of 600 international units per day during pregnancy [18]. Vitamin D deficiency is estimated to affect between 40 and 98 percent of pregnant individuals worldwide\n●  Sources :\nDermal synthesis after exposure to sunlight is the major natural source of the vitamin. Very few foods naturally contain vitamin D (fatty fish livers are the exception).\nSupplements often specify the type of vitamin D they contain. Most prescription prenatal vitamins contain cholecalciferol (D3), but some contain ergocalciferol (D2), and some contain a mixture. Many commercial nonprescription products labeled "vitamin D" (multivitamin supplements, fortified milk, and bread) contain D2 rather than D3. D3 is more readily converted to active forms of vitamin D and is more effective at increasing serum 25-hydroxyvitamin D.'),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Iodine',
                    icon: 'iodine',
                    description:
                        '●  Recommended intake:\n the WHO recommends daily iodine intake of 250 mcg for both pregnant and lactating people\n●  Sources :\nMany prenatal vitamins contain no iodine since requirements are often met with dietary sources, such as iodized salt. In the United States, data suggest that 23 to 56 percent of pregnant people have intake below recommended levels based on urinary iodine concentrations . Similar findings have been reported in the United Kingdom and in Sweden . Declining intakes of iodine may be related to increased intake of non-iodized salt from processed foods and in the home (such as sea salt, which contains less iodine than iodized salt). Although pregnant individuals should not be encouraged to start using table salt if they do not already do so, pregnant people should be encouraged to use iodized salt (contains 95 mcg iodine per one-quarter teaspoon) rather than non-iodized, and/or consume cooked seafood that is naturally rich in iodine to attain adequate intake.'),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Zinc',
                    icon: 'zinc',
                    description:
                        '●  Recommended intake:\n In the United States, the recommended daily allowance for zinc is 11 to 12 mg/day during pregnancy\n●  Sources :\nFood sources of zinc include meat, poultry, and certain types of seafood (oysters, crab, lobster). Whole grains, cereals, and legumes are also good sources of zinc, but bioavailability is lower due to phytates that bind to and decrease its absorption'),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Vitamin B12',
                    icon: 'vitamin',
                    description:
                        '●  Recommended intake:\n In the United States, the recommended daily allowance for vitamin B12 is 2.6 mcg/day in pregnancy and 2.8 mcg/day during lactation\n●  Sources :\nOnly animal source foods, such as fish, meat, poultry, eggs, and dairy products, contain vitamin B12; thus, individuals who consume a vegetarian or vegan diet are at higher risk of B12 deficiency and should take a supplement .'),
                verticalSpace(20),
                NutritionExpandedWidget(
                    choice: 'Vitamin A',
                    icon: 'multivitamin',
                    description:
                        '●  Recommended intake:\n Vitamin A utilization increases slightly during pregnancy; thus, recommended intake is increased to 750 to 770 mcg retinol equivalents (2500 to 2560 international units) per day in pregnancy\n●  Sources :\n Vitamin A is found in moderate amounts (300 to 770 mcg retinol equivalents) in many prenatal vitamins, often in the form of betacarotene (provitamin A).\n Vitamin A is present in a variety of foods, and requirements can be met by consuming foods such as milk, fish, eggs, carrots, leafy greens, broccoli, cantaloupe, and squash. Some groups recommend avoiding liver because of its high vitamin A content.'),
                verticalSpace(20),
              ],
            ),
          ),
        ));
  }
}
