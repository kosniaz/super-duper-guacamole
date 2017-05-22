; Fri May 19 17:31:02 CEST 2017
; 
;+ (version "3.4.8")
;+ (build "Build 629")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(multislot Season
;+		(comment "The seasons of the year in which the ingredient is available.")
		(type SYMBOL)
		(allowed-values Winter Summer Spring Autumn)
		(cardinality 1 4)
		(create-accessor read-write))
	(single-slot SecondDish
;+		(comment "Second recommendation for the menu; main dish")
		(type INSTANCE)
;+		(allowed-classes Second)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot FamilyEventType
;+		(comment "Describes the type of family event")
		(type SYMBOL)
		(allowed-values Marriage Baptism Communion)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot IsInDish
		(type INSTANCE)
;+		(allowed-classes Dish)
		(create-accessor read-write))
	(single-slot Disponibility
		(type INSTANCE)
;+		(allowed-classes Dish)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot IngredientName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot DrinkPrice
		(type FLOAT)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot IncompatibilityW2
;+		(comment "Exprime la incompatibilidad de un primero respecto al segundo")
		(type INSTANCE)
;+		(allowed-classes Second)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot DishName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Period
		(type INSTANCE)
;+		(allowed-classes)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot DessertDish
;+		(comment "Recommended dessert for the menu")
		(type INSTANCE)
;+		(allowed-classes Dessert)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot RicoRicoProject_Class27
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot IngredientType
		(type SYMBOL)
		(allowed-values Fruit Vegetable Fish Dairy Meat Other)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Style
		(type SYMBOL)
		(allowed-values Classic Modern Regional Gourmet Experimental Fun)
		(create-accessor read-write))
	(single-slot DishPrice
		(type FLOAT)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot DrinkName
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot Ingredients
		(type INSTANCE)
;+		(allowed-classes Ingredient)
		(create-accessor read-write))
	(single-slot RicoRicoProject_Class20024
		(type SYMBOL)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot FirstDish
;+		(comment "First plate of the menu;starter, appetizer")
		(type INSTANCE)
;+		(allowed-classes First)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot RicoRicoProject_Class0
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot DishInfo
;+		(comment "A brief (or detailed) description of the dish")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot Compatibility
		(type INSTANCE)
;+		(allowed-classes Dish)
		(create-accessor read-write))
	(single-slot Friendliness
		(type SYMBOL)
		(allowed-values Low High Average)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot DrinkType
		(type SYMBOL)
		(allowed-values Water Wine Refreshment Juice Other Beer)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot MenuDrink
;+		(comment "The drink/s selected for the menu")
		(type INSTANCE)
;+		(allowed-classes Drink)
		(cardinality 1 3)
		(create-accessor read-write))
	(single-slot DishType
		(type SYMBOL)
		(allowed-values Vegetarian Vegan)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot IncompatibilityDW2
		(type INSTANCE)
;+		(allowed-classes Second)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot RicoRicoProject_Class10005
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot MaxNum
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot IncompatibilityWDish
;+		(comment "Relacion que describe la incompatibilidad de las bebidas con los platos")
		(type INSTANCE)
;+		(allowed-classes Dish)
		(create-accessor read-write))
	(single-slot GuestsAmount
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Menu "Clase que describe los menus"
	(is-a USER)
	(role concrete)
	(single-slot DessertDish
;+		(comment "Recommended dessert for the menu")
		(type INSTANCE)
;+		(allowed-classes Dessert)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot FirstDish
;+		(comment "First plate of the menu;starter, appetizer")
		(type INSTANCE)
;+		(allowed-classes First)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot SecondDish
;+		(comment "Second recommendation for the menu; main dish")
		(type INSTANCE)
;+		(allowed-classes Second)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot MenuDrink
;+		(comment "The drink/s selected for the menu")
		(type INSTANCE)
;+		(allowed-classes Drink)
		(cardinality 1 3)
		(create-accessor read-write)))

(defclass Dish "Describe los platos"
	(is-a USER)
	(role abstract)
	(multislot Style
		(type SYMBOL)
		(allowed-values Classic Modern Regional Gourmet Experimental Fun)
		(create-accessor read-write))
	(single-slot DishInfo
;+		(comment "A brief (or detailed) description of the dish")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot DishName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot DishPrice
		(type FLOAT)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot MaxNum
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot Ingredients
		(type INSTANCE)
;+		(allowed-classes Ingredient)
		(create-accessor read-write))
	(single-slot DishType
		(type SYMBOL)
		(allowed-values Vegetarian Vegan)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Friendliness
		(type SYMBOL)
		(allowed-values Low High Average)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass First
	(is-a Dish)
	(role concrete)
	(multislot IncompatibilityW2
;+		(comment "Exprime la incompatibilidad de un primero respecto al segundo")
		(type INSTANCE)
;+		(allowed-classes Second)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write)))

(defclass Second
	(is-a Dish)
	(role concrete))

(defclass Dessert
	(is-a Dish)
	(role concrete)
	(multislot IncompatibilityDW2
		(type INSTANCE)
;+		(allowed-classes Second)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write)))

(defclass Drink "Describe las babidas"
	(is-a USER)
	(role concrete)
	(single-slot DrinkType
		(type SYMBOL)
		(allowed-values Water Wine Refreshment Juice Other Beer)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot DrinkPrice
		(type FLOAT)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot IncompatibilityWDish
;+		(comment "Relacion que describe la incompatibilidad de las bebidas con los platos")
		(type INSTANCE)
;+		(allowed-classes Dish)
		(create-accessor read-write))
	(single-slot DrinkName
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Ingredient
	(is-a USER)
	(role concrete)
	(single-slot IngredientName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Season
;+		(comment "The seasons of the year in which the ingredient is available.")
		(type SYMBOL)
		(allowed-values Winter Summer Spring Autumn)
		(cardinality 1 4)
		(create-accessor read-write))
	(single-slot IngredientType
		(type SYMBOL)
		(allowed-values Fruit Vegetable Fish Dairy Meat Other)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(definstances menu 

([RicoRicoProject_Class10000] of  First

	(DishInfo "Good one")
	(DishName "Cesar Salad")
	(DishPrice 2.0)
	(Friendliness High)
	(Ingredients
		[RicoRicoProject_Class20003]
		[RicoRicoProject_Class40019])
	(Style Modern))

([RicoRicoProject_Class10001] of  First

	(DishInfo "Sooo simple")
	(DishName "Simple Salad")
	(DishPrice 3.0)
	(DishType Vegetarian)
	(Friendliness High)
	(Ingredients [RicoRicoProject_Class20003])
	(Style Classic))

([RicoRicoProject_Class20000] of  Second

	(DishInfo "Pasta de origen Romana, en Italia, con huevos, bacon y  Parmigiano")
	(DishName "Pasta Alla Carbonara")
	(DishPrice 10.0)
	(Friendliness High)
	(Ingredients
		[RicoRicoProject_Class40]
		[RicoRicoProject_Class37]
		[RicoRicoProject_Class36]
		[RicoRicoProject_Class39]
		[RicoRicoProject_Class38])
	(Style Classic))

([RicoRicoProject_Class20003] of  Ingredient

	(IngredientName "Lechuga")
	(IngredientType Vegetable)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class20004] of  Ingredient

	(IngredientName "Chicken")
	(IngredientType Meat)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class20005] of  Second

	(DishInfo "Italian dish with tomato souce and bacon")
	(DishName "Pasta Alla Amatriciana")
	(DishPrice 9.0)
	(Friendliness Average)
	(Ingredients
		[RicoRicoProject_Class37]
		[RicoRicoProject_Class38]
		[RicoRicoProject_Class40]
		[RicoRicoProject_Class20007])
	(Style Classic Regional))

([RicoRicoProject_Class20006] of  Second

	(DishName "Pizza Margherita")
	(DishPrice 6.0)
	(DishType Vegetarian)
	(Friendliness High)
	(Ingredients
		[RicoRicoProject_Class20008]
		[RicoRicoProject_Class20007])
	(MaxNum 1000)
	(Style Classic))

([RicoRicoProject_Class20007] of  Ingredient

	(IngredientName "Salsa de Tomate")
	(IngredientType Vegetable)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class20008] of  Ingredient

	(IngredientName "Mozzarella")
	(IngredientType Dairy)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class20009] of  Dessert

	(DishInfo "Ice cream with many tastes")
	(DishName "Helado")
	(DishPrice 2.0)
	(Friendliness High)
	(Style Classic))

([RicoRicoProject_Class20010] of  Dessert

	(DishInfo "Tipical italian dessert")
	(DishName "Tiramisù")
	(DishPrice 4.0)
	(Friendliness Average)
	(IncompatibilityDW2
		[RicoRicoProject_Class50059]
		[RicoRicoProject_Class50070]
		[RicoRicoProject_Class30011])
	(Style Regional Gourmet))

([RicoRicoProject_Class20011] of  Second

	(DishInfo "Tipical greek dish")
	(DishName "Moussakà")
	(DishPrice 10.0)
	(Friendliness Average)
	(Ingredients
		[RicoRicoProject_Class20012]
		[RicoRicoProject_Class40003]
		[RicoRicoProject_Class20014]
		[RicoRicoProject_Class20013]
		[RicoRicoProject_Class30004])
	(MaxNum 2000)
	(Style Regional))

([RicoRicoProject_Class20012] of  Ingredient

	(IngredientName "Berenjena")
	(IngredientType Vegetable)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class20013] of  Ingredient

	(IngredientName "Carne de Cerdo")
	(IngredientType Meat)
	(Season Autumn Winter Summer Spring))

([RicoRicoProject_Class20014] of  Ingredient

	(IngredientName "Patata")
	(IngredientType Vegetable)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class20015] of  First

	(DishName "Tabla de queso y jamon")
	(DishPrice 12.0)
	(Friendliness High)
	(Ingredients
		[RicoRicoProject_Class40003]
		[RicoRicoProject_Class20026])
	(Style Gourmet Fun))

([RicoRicoProject_Class20016] of  First

	(DishInfo "Tipical spanish dish")
	(DishName "Tortilla")
	(DishPrice 3.0)
	(DishType Vegetarian)
	(Friendliness High)
	(Ingredients
		[RicoRicoProject_Class36]
		[RicoRicoProject_Class20014])
	(MaxNum 1000)
	(Style Classic Regional))

([RicoRicoProject_Class20017] of  Dessert

	(DishInfo "Tipical french dessert")
	(DishName "Crepes")
	(DishPrice 3.0)
	(DishType Vegetarian)
	(Friendliness High)
	(IncompatibilityDW2
		[RicoRicoProject_Class50017]
		[RicoRicoProject_Class50021])
	(MaxNum 1150)
	(Style Regional Classic))

([RicoRicoProject_Class20018] of  Drink

	(DrinkName "Vino Tarragona")
	(DrinkPrice 2.0)
	(DrinkType Wine))

([RicoRicoProject_Class20019] of  Drink

	(DrinkName "Lambrusco Mantovano")
	(DrinkPrice 2.0)
	(DrinkType Wine)
	(IncompatibilityWDish
		[RicoRicoProject_Class20011]
		[RicoRicoProject_Class40013]
		[RicoRicoProject_Class50057]))

([RicoRicoProject_Class20020] of  Drink

	(DrinkName "Coca Cola")
	(DrinkPrice 2.0)
	(DrinkType Refreshment))

([RicoRicoProject_Class20021] of  Drink

	(DrinkName "Agua Natural")
	(DrinkPrice 1.0)
	(DrinkType Water))

([RicoRicoProject_Class20022] of  Drink

	(DrinkName "Fanta")
	(DrinkPrice 2.0)
	(DrinkType Refreshment))

([RicoRicoProject_Class20023] of  Drink

	(DrinkName "Ice Tea")
	(DrinkPrice 2.0)
	(DrinkType Refreshment))

([RicoRicoProject_Class20025] of  First

	(DishInfo "Tipical spanish dish")
	(DishName "Croquetas de Patatas")
	(DishPrice 6.0)
	(Friendliness High)
	(IncompatibilityW2 [RicoRicoProject_Class30011])
	(Ingredients [RicoRicoProject_Class20014])
	(MaxNum 800)
	(Style Regional Classic))

([RicoRicoProject_Class20026] of  Ingredient

	(IngredientName "Jamon")
	(IngredientType Meat)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class20027] of  Ingredient

	(IngredientName "Cheese")
	(IngredientType Dairy)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class30000] of  First

	(DishInfo "TIpical french tartar")
	(DishName "Tartar de tierna")
	(DishPrice 5.0)
	(Friendliness Low)
	(IncompatibilityW2 [RicoRicoProject_Class30008])
	(Ingredients [RicoRicoProject_Class30001])
	(MaxNum 2000)
	(Style Regional Gourmet))

([RicoRicoProject_Class30001] of  Ingredient

	(IngredientName "Carne de Vaca")
	(IngredientType Meat)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class30002] of  Second

	(DishInfo "Plato experimental creado por la RicoRico")
	(DishName "Plato Combinado de la casa")
	(DishPrice 12.0)
	(DishType Vegan)
	(Friendliness Low)
	(Ingredients
		[RicoRicoProject_Class30003]
		[RicoRicoProject_Class30004]
		[RicoRicoProject_Class30001]
		[RicoRicoProject_Class30005])
	(Style Experimental))

([RicoRicoProject_Class30003] of  Ingredient

	(IngredientName "Aguacate")
	(IngredientType Vegetable)
	(Season Autumn Winter))

([RicoRicoProject_Class30004] of  Ingredient

	(IngredientName "Cebolla")
	(IngredientType Vegetable)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class30005] of  Ingredient

	(IngredientName "Garbanzos")
	(IngredientType Vegetable)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class30006] of  Dessert

	(DishInfo "Tarta ideal para los ninos")
	(DishName "Tarta de Nata con Dibujos")
	(DishPrice 4.0)
	(DishType Vegetarian)
	(Friendliness High)
	(MaxNum 200)
	(Style Fun))

([RicoRicoProject_Class30007] of  First

	(DishInfo "Sushi tipico de Japon ideal para charlar")
	(DishName "Sushi de Salmon")
	(DishPrice 6.0)
	(Friendliness Average)
	(IncompatibilityW2
		[RicoRicoProject_Class30011]
		[RicoRicoProject_Class20011])
	(Ingredients
		[RicoRicoProject_Class30010]
		[RicoRicoProject_Class40018]
		[RicoRicoProject_Class40017])
	(MaxNum 400)
	(Style Modern Regional))

([RicoRicoProject_Class30008] of  Second

	(DishName "Filete de Merluza y Arroz")
	(DishPrice 5.0)
	(Friendliness Average)
	(Ingredients
		[RicoRicoProject_Class30010]
		[RicoRicoProject_Class30009])
	(Style Classic))

([RicoRicoProject_Class30009] of  Ingredient

	(IngredientName "Merluza")
	(IngredientType Fish)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class30010] of  Ingredient

	(IngredientName "Arroz")
	(IngredientType Vegetable)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class30011] of  Second

	(DishInfo "Experimental dish with insects")
	(DishName "Hamburguesa con Grillos")
	(DishPrice 15.0)
	(Friendliness Low)
	(Ingredients
		[RicoRicoProject_Class30001]
		[RicoRicoProject_Class40016])
	(MaxNum 500)
	(Style Modern Experimental))

([RicoRicoProject_Class30012] of  Dessert

	(DishName "Crema Catalana")
	(DishPrice 3.0)
	(DishType Vegetarian)
	(Friendliness High)
	(IncompatibilityDW2 [RicoRicoProject_Class50015])
	(Ingredients
		[RicoRicoProject_Class36]
		[RicoRicoProject_Class50030])
	(Style Classic Fun Regional))

([RicoRicoProject_Class36] of  Ingredient

	(IngredientName "Huevo")
	(IngredientType Dairy)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class37] of  Ingredient

	(IngredientName "Bacon")
	(IngredientType Meat)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class38] of  Ingredient

	(IngredientName "Pimienta Negra")
	(IngredientType Other)
	(Season Winter Summer Autumn Spring))

([RicoRicoProject_Class39] of  Ingredient

	(IngredientName "Parmigiano Reggiano")
	(IngredientType Dairy)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class40] of  Ingredient

	(IngredientName "Pasta")
	(IngredientType Other)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class40000] of  First

	(DishInfo "Plato de gastronomia moleculàr")
	(DishName "Gofres de Parmigiano y Apionabos")
	(DishPrice 8.0)
	(DishType Vegetarian)
	(Friendliness Average)
	(IncompatibilityW2
		[RicoRicoProject_Class40006]
		[RicoRicoProject_Class30002])
	(Ingredients
		[RicoRicoProject_Class40005]
		[RicoRicoProject_Class39])
	(Style Experimental))

([RicoRicoProject_Class40002] of  First

	(DishInfo "Plato de gastronomia molecular")
	(DishName "Bignè de harina de castañas y queso")
	(DishPrice 6.0)
	(DishType Vegetarian)
	(Friendliness Low)
	(IncompatibilityW2
		[RicoRicoProject_Class20005]
		[RicoRicoProject_Class50021]
		[RicoRicoProject_Class50061])
	(Ingredients
		[RicoRicoProject_Class40004]
		[RicoRicoProject_Class40003])
	(MaxNum 500)
	(Style Experimental Gourmet))

([RicoRicoProject_Class40003] of  Ingredient

	(IngredientName "Queso")
	(IngredientType Dairy)
	(Season Autumn Winter Spring Summer))

([RicoRicoProject_Class40004] of  Ingredient

	(IngredientName "Castaña")
	(IngredientType Vegetable)
	(Season Autumn))

([RicoRicoProject_Class40005] of  Ingredient

	(IngredientName "Apionabos")
	(IngredientType Vegetable)
	(Season Autumn))

([RicoRicoProject_Class40006] of  Second

	(DishName "Arroz con Curry y Pasas")
	(DishPrice 6.0)
	(DishType Vegan)
	(Friendliness Average)
	(Ingredients
		[RicoRicoProject_Class30010]
		[RicoRicoProject_Class40007]
		[RicoRicoProject_Class40020])
	(Style Experimental))

([RicoRicoProject_Class40007] of  Ingredient

	(IngredientName "Pasa")
	(IngredientType Fruit)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class40008] of  Dessert

	(DishName "Ensalada de fruta")
	(DishPrice 2.0)
	(DishType Fruitarian)
	(Friendliness High)
	(Ingredients
		[RicoRicoProject_Class40011]
		[RicoRicoProject_Class40009]
		[RicoRicoProject_Class40010]
		[RicoRicoProject_Class50014])
	(Style Classic))

([RicoRicoProject_Class40009] of  Ingredient

	(IngredientName "Fresa")
	(IngredientType Fruit)
	(Season Summer Spring))

([RicoRicoProject_Class40010] of  Ingredient

	(IngredientName "Melocotón")
	(IngredientType Fruit)
	(Season Summer))

([RicoRicoProject_Class40011] of  Ingredient

	(IngredientName "Banana")
	(IngredientType Fruit)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class40013] of  Second

	(DishInfo "Ideal para niños, la forma de la comida será la de Chuewbecca, famoso personaje de Star Wars")
	(DishName "Noodles Chewbecca")
	(DishPrice 6.0)
	(DishType Vegetarian)
	(Friendliness High)
	(Ingredients
		[RicoRicoProject_Class40014]
		[RicoRicoProject_Class30010]
		[RicoRicoProject_Class37])
	(MaxNum 200)
	(Style Fun))

([RicoRicoProject_Class40014] of  Ingredient

	(IngredientName "Noodle")
	(IngredientType Other)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class40016] of  Ingredient

	(IngredientName "Grillos")
	(IngredientType Other)
	(Season Summer Winter Spring Autumn))

([RicoRicoProject_Class40017] of  Ingredient

	(IngredientName "Salmon")
	(IngredientType Fish)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class40018] of  Ingredient

	(IngredientName "Alga")
	(IngredientType Vegetable)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class40019] of  Ingredient

	(IngredientName "Pollo")
	(IngredientType Meat)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class40020] of  Ingredient

	(IngredientName "Curry")
	(IngredientType Other)
	(Season Autumn Winter Summer Spring))

([RicoRicoProject_Class40021] of  Second

	(DishName "Pasta con Cuatro Quesos")
	(DishPrice 5.0)
	(DishType Vegetarian)
	(Friendliness Average)
	(Ingredients
		[RicoRicoProject_Class40]
		[RicoRicoProject_Class40003])
	(Style Experimental))

([RicoRicoProject_Class40022] of  Drink

	(DrinkName "Champagne")
	(DrinkPrice 12.0)
	(DrinkType Wine)
	(IncompatibilityWDish
		[RicoRicoProject_Class40002]
		[RicoRicoProject_Class20025]
		[RicoRicoProject_Class50062]
		[RicoRicoProject_Class30011]
		[RicoRicoProject_Class20011]
		[RicoRicoProject_Class40013]
		[RicoRicoProject_Class50038]))

([RicoRicoProject_Class50000] of  First

	(DishInfo "Plato tipico Español")
	(DishName "Gazpacho")
	(DishPrice 6.0)
	(Friendliness Average)
	(IncompatibilityW2 [RicoRicoProject_Class20011])
	(Ingredients
		[RicoRicoProject_Class20007]
		[RicoRicoProject_Class50001]
		[RicoRicoProject_Class36]
		[RicoRicoProject_Class50002])
	(MaxNum 500)
	(Style Regional))

([RicoRicoProject_Class50001] of  Ingredient

	(IngredientName "Pimiento")
	(IngredientType Vegetable)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50002] of  Ingredient

	(IngredientName "Pan")
	(IngredientType Other)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50003] of  First

	(DishInfo "Plato tipico de Galizia")
	(DishName "Polipo a feira")
	(DishPrice 9.0)
	(Friendliness Average)
	(IncompatibilityW2
		[RicoRicoProject_Class50048]
		[RicoRicoProject_Class50009])
	(Ingredients
		[RicoRicoProject_Class50004]
		[RicoRicoProject_Class30004]
		[RicoRicoProject_Class50005])
	(MaxNum 250)
	(Style Classic Regional Gourmet))

([RicoRicoProject_Class50004] of  Ingredient

	(IngredientName "Polipo")
	(IngredientType Fish)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50005] of  Ingredient

	(IngredientName "Paprika")
	(IngredientType Other)
	(Season Summer Spring))

([RicoRicoProject_Class50006] of  Second

	(DishName "Paella")
	(DishPrice 10.0)
	(Friendliness High)
	(Ingredients
		[RicoRicoProject_Class30010]
		[RicoRicoProject_Class40019]
		[RicoRicoProject_Class50007]
		[RicoRicoProject_Class50008])
	(Style Classic Regional))

([RicoRicoProject_Class50007] of  Ingredient

	(IngredientName "Conejo")
	(IngredientType Meat)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50008] of  Ingredient

	(IngredientName "Frijoles")
	(IngredientType Vegetable)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50009] of  Second

	(DishName "Cordero a la Parrilla")
	(DishPrice 11.0)
	(Friendliness Low)
	(Ingredients [RicoRicoProject_Class50010])
	(MaxNum 1000)
	(Style Classic Gourmet))

([RicoRicoProject_Class50010] of  Ingredient

	(IngredientName "Cordero")
	(IngredientType Meat)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50011] of  Dessert

	(DishName "Churros")
	(DishPrice 4.0)
	(DishType Vegan)
	(Friendliness High)
	(Ingredients [RicoRicoProject_Class50012])
	(MaxNum 90000)
	(Style Classic Regional))

([RicoRicoProject_Class50012] of  Ingredient

	(IngredientName "Harina")
	(IngredientType Other)
	(Season Winter Spring Summer Autumn))

([RicoRicoProject_Class50013] of  Dessert

	(DishName "Tarta de Santiago")
	(DishPrice 5.0)
	(Friendliness Average)
	(Ingredients
		[RicoRicoProject_Class50012]
		[RicoRicoProject_Class36]
		[RicoRicoProject_Class50014])
	(MaxNum 150)
	(Style Gourmet Regional))

([RicoRicoProject_Class50014] of  Ingredient

	(IngredientName "Almendra")
	(IngredientType Fruit)
	(Season Summer Spring))

([RicoRicoProject_Class50015] of  Second

	(DishName "Cocido Madrileño")
	(DishPrice 8.0)
	(Friendliness Low)
	(Ingredients
		[RicoRicoProject_Class30005]
		[RicoRicoProject_Class30001]
		[RicoRicoProject_Class50016])
	(MaxNum 99000)
	(Style Classic Gourmet))

([RicoRicoProject_Class50016] of  Ingredient

	(IngredientName "Chorizo")
	(IngredientType Meat)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50017] of  Second

	(DishInfo "Plato tipico italiano")
	(DishName "Lasagne")
	(DishPrice 9.0)
	(Friendliness High)
	(Ingredients
		[RicoRicoProject_Class40]
		[RicoRicoProject_Class20007]
		[RicoRicoProject_Class50018])
	(MaxNum 15000)
	(Style Regional))

([RicoRicoProject_Class50018] of  Ingredient

	(IngredientName "Bechamel")
	(IngredientType Dairy)
	(Season Winter Spring Autumn))

([RicoRicoProject_Class50019] of  First

	(DishName "Tabla de Chorizo")
	(DishPrice 6.0)
	(Friendliness High)
	(Ingredients [RicoRicoProject_Class50016])
	(Style Classic Regional Gourmet))

([RicoRicoProject_Class50021] of  Second

	(DishInfo "Plato tipico Italiano")
	(DishName "Pasta Boloñesa")
	(DishPrice 9.0)
	(Friendliness Average)
	(Ingredients
		[RicoRicoProject_Class30001]
		[RicoRicoProject_Class30003]
		[RicoRicoProject_Class40]
		[RicoRicoProject_Class20007])
	(MaxNum 30000)
	(Style Classic Regional))

([RicoRicoProject_Class50023] of  Second

	(DishInfo "Plato de Milano")
	(DishName "Arroz con Azafran")
	(DishPrice 7.0)
	(Friendliness High)
	(Ingredients
		[RicoRicoProject_Class50024]
		[RicoRicoProject_Class30010])
	(Style Gourmet Regional Experimental))

([RicoRicoProject_Class50024] of  Ingredient

	(IngredientName "Azafran")
	(IngredientType Other)
	(Season Summer Spring))

([RicoRicoProject_Class50025] of  First

	(DishName "Patata Fritas")
	(DishPrice 3.0)
	(DishType Vegan)
	(Friendliness High)
	(Ingredients [RicoRicoProject_Class20014])
	(Style Classic))

([RicoRicoProject_Class50027] of  First

	(DishName "Alitas de Pollo")
	(DishPrice 4.0)
	(Friendliness High)
	(IncompatibilityW2
		[RicoRicoProject_Class40006]
		[RicoRicoProject_Class30011])
	(Ingredients [RicoRicoProject_Class40019])
	(Style Classic))

([RicoRicoProject_Class50029] of  Dessert

	(DishName "Profitterol")
	(DishPrice 6.0)
	(Friendliness Average)
	(IncompatibilityDW2
		[RicoRicoProject_Class50059]
		[RicoRicoProject_Class50048]
		[RicoRicoProject_Class30011])
	(Ingredients
		[RicoRicoProject_Class50030]
		[RicoRicoProject_Class50031])
	(Style Gourmet Experimental))

([RicoRicoProject_Class50030] of  Ingredient

	(IngredientName "Crema")
	(IngredientType Dairy))

([RicoRicoProject_Class50031] of  Ingredient

	(IngredientName "Chocolate")
	(IngredientType Other)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50032] of  Drink

	(DrinkName "Frantziskaner")
	(DrinkPrice 3.0)
	(DrinkType Beer)
	(IncompatibilityWDish
		[RicoRicoProject_Class50054]
		[RicoRicoProject_Class50011]
		[RicoRicoProject_Class30012]
		[RicoRicoProject_Class20017]
		[RicoRicoProject_Class40008]
		[RicoRicoProject_Class20009]
		[RicoRicoProject_Class50029]
		[RicoRicoProject_Class30006]
		[RicoRicoProject_Class50013]
		[RicoRicoProject_Class20010]))

([RicoRicoProject_Class50035] of  First

	(DishName "Anchoa con Huevas de Erizo")
	(DishPrice 9.0)
	(Friendliness Low)
	(IncompatibilityW2
		[RicoRicoProject_Class50059]
		[RicoRicoProject_Class50057])
	(Ingredients
		[RicoRicoProject_Class50036]
		[RicoRicoProject_Class50037])
	(Style Gourmet Experimental))

([RicoRicoProject_Class50036] of  Ingredient

	(IngredientName "Anchoa")
	(IngredientType Fish)
	(Season Winter Summer Spring))

([RicoRicoProject_Class50037] of  Ingredient

	(IngredientName "Huevas de Erizo")
	(IngredientType Fish)
	(Season Summer Spring Winter Autumn))

([RicoRicoProject_Class50038] of  Second

	(DishName "Pescaito Frito")
	(DishPrice 7.0)
	(Friendliness Average)
	(Ingredients [RicoRicoProject_Class50039])
	(Style Classic Regional))

([RicoRicoProject_Class50039] of  Ingredient

	(IngredientName "Pescado")
	(IngredientType Fish)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50040] of  First

	(DishName "Alcachofas Fritas")
	(DishPrice 4.0)
	(DishType Vegetarian)
	(Friendliness Low)
	(IncompatibilityW2
		[RicoRicoProject_Class50059]
		[RicoRicoProject_Class40013])
	(Ingredients [RicoRicoProject_Class50041])
	(MaxNum 80000)
	(Style Classic Experimental))

([RicoRicoProject_Class50041] of  Ingredient

	(IngredientName "Alcachofas")
	(IngredientType Vegetable)
	(Season Winter Autumn))

([RicoRicoProject_Class50042] of  First

	(DishName "Carro de Quesos de Santceloni")
	(DishPrice 6.0)
	(DishType Vegetarian)
	(Friendliness Average)
	(Ingredients [RicoRicoProject_Class40003])
	(Style Classic))

([RicoRicoProject_Class50043] of  First

	(DishName "Patatas Bravas")
	(DishPrice 4.0)
	(DishType Vegetarian)
	(Friendliness High)
	(Ingredients
		[RicoRicoProject_Class20014]
		[RicoRicoProject_Class50044])
	(Style Classic))

([RicoRicoProject_Class50044] of  Ingredient

	(IngredientName "Salsa Brava")
	(IngredientType Other)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50045] of  Second

	(DishName "Tagliatelle con Trufa Negra")
	(DishPrice 12.0)
	(DishType Vegetarian)
	(Friendliness Low)
	(Ingredients
		[RicoRicoProject_Class50046]
		[RicoRicoProject_Class50047])
	(Style Gourmet Experimental))

([RicoRicoProject_Class50046] of  Ingredient

	(IngredientName "Tagliatelle")
	(IngredientType Other)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50047] of  Ingredient

	(IngredientName "Trufa Negra")
	(IngredientType Vegetable)
	(Season Winter Spring))

([RicoRicoProject_Class50048] of  Second

	(DishName "Chuleta de Buey")
	(DishPrice 10.0)
	(Friendliness Average)
	(Ingredients [RicoRicoProject_Class50049])
	(MaxNum 3000)
	(Style Classic))

([RicoRicoProject_Class50049] of  Ingredient

	(IngredientName "Carne de Buey")
	(IngredientType Meat)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50050] of  First

	(DishName "Ensaladilla Rusa")
	(DishPrice 3.0)
	(DishType Vegetarian)
	(Friendliness Average)
	(Ingredients
		[RicoRicoProject_Class50051]
		[RicoRicoProject_Class20014]
		[RicoRicoProject_Class50001])
	(MaxNum 50000)
	(Style Modern))

([RicoRicoProject_Class50051] of  Ingredient

	(IngredientName "Maionesa")
	(IngredientType Other)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50052] of  First

	(DishName "Gamba Roja de Dénia")
	(DishPrice 8.0)
	(Friendliness Low)
	(IncompatibilityW2
		[RicoRicoProject_Class50048]
		[RicoRicoProject_Class50009]
		[RicoRicoProject_Class50057])
	(Ingredients [RicoRicoProject_Class50053])
	(Style Classic))

([RicoRicoProject_Class50053] of  Ingredient

	(IngredientName "Gambas")
	(IngredientType Fish)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50054] of  Dessert

	(DishName "Cheescake")
	(DishPrice 4.0)
	(DishType Vegetarian)
	(Friendliness High)
	(IncompatibilityDW2
		[RicoRicoProject_Class40013]
		[RicoRicoProject_Class50063])
	(Ingredients
		[RicoRicoProject_Class50031]
		[RicoRicoProject_Class40009]
		[RicoRicoProject_Class40003])
	(Style Classic))

([RicoRicoProject_Class50055] of  First

	(DishName "Ensalada de Flores")
	(DishPrice 3.0)
	(DishType Vegan)
	(Friendliness Low)
	(IncompatibilityW2
		[RicoRicoProject_Class50023]
		[RicoRicoProject_Class40006])
	(Ingredients
		[RicoRicoProject_Class20003]
		[RicoRicoProject_Class50056])
	(Style Experimental))

([RicoRicoProject_Class50056] of  Ingredient

	(IngredientName "Flores")
	(IngredientType Vegetable)
	(Season Summer Spring))

([RicoRicoProject_Class50057] of  Second

	(DishName "Paloma con Flores")
	(DishPrice 11.0)
	(Friendliness Average)
	(Ingredients
		[RicoRicoProject_Class30004]
		[RicoRicoProject_Class50056]
		[RicoRicoProject_Class50058])
	(MaxNum 60000)
	(Style Experimental Gourmet))

([RicoRicoProject_Class50058] of  Ingredient

	(IngredientName "Paloma")
	(IngredientType Meat)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50059] of  Second

	(DishName "Arroz Ceniza de Quique Dacosta")
	(DishPrice 11.0)
	(DishType Vegan)
	(Friendliness Low)
	(Ingredients
		[RicoRicoProject_Class30010]
		[RicoRicoProject_Class50047]
		[RicoRicoProject_Class50056])
	(Style Modern Experimental Gourmet))

([RicoRicoProject_Class50060] of  First

	(DishName "Nigiri de Pez Mantequilla con Trufa")
	(DishPrice 7.0)
	(Friendliness Low)
	(IncompatibilityW2
		[RicoRicoProject_Class50070]
		[RicoRicoProject_Class50017]
		[RicoRicoProject_Class20005]
		[RicoRicoProject_Class20000]
		[RicoRicoProject_Class50021])
	(Ingredients
		[RicoRicoProject_Class30010]
		[RicoRicoProject_Class50039]
		[RicoRicoProject_Class50047])
	(MaxNum 800)
	(Style Modern Experimental Fun))

([RicoRicoProject_Class50061] of  Second

	(DishName "Tuétano a la Brasa con Salsa de Jitomate")
	(DishPrice 12.0)
	(Friendliness Average)
	(Ingredients [RicoRicoProject_Class50039])
	(Style Gourmet Modern))

([RicoRicoProject_Class50062] of  First

	(DishName "Empanadas de Carne")
	(DishPrice 5.0)
	(Friendliness High)
	(Ingredients [RicoRicoProject_Class30001])
	(Style Classic Regional))

([RicoRicoProject_Class50063] of  Second

	(DishName "Rossetjat de Bogavante y Verduras")
	(DishPrice 10.0)
	(Friendliness Average)
	(Ingredients
		[RicoRicoProject_Class50064]
		[RicoRicoProject_Class50065])
	(MaxNum 20000)
	(Style Classic))

([RicoRicoProject_Class50064] of  Ingredient

	(IngredientName "Bogavante")
	(IngredientType Fish)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50065] of  Ingredient

	(IngredientName "Verduras")
	(IngredientType Vegetable)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50066] of  Second

	(DishName "Arroz con Judías y Nabos")
	(DishPrice 8.0)
	(DishType Vegan)
	(Friendliness Average)
	(Ingredients
		[RicoRicoProject_Class50068]
		[RicoRicoProject_Class50069]
		[RicoRicoProject_Class30010])
	(Style Classic))

([RicoRicoProject_Class50068] of  Ingredient

	(IngredientName "Judias")
	(IngredientType Vegetable)
	(Season Summer Spring Autumn))

([RicoRicoProject_Class50069] of  Ingredient

	(IngredientName "Nabos")
	(IngredientType Vegetable)
	(Season Autumn))

([RicoRicoProject_Class50070] of  Second

	(DishName "Arroz con Vino Tinto de Monastrell")
	(DishPrice 7.0)
	(DishType Vegan)
	(Friendliness High)
	(Ingredients
		[RicoRicoProject_Class30010]
		[RicoRicoProject_Class30004]
		[RicoRicoProject_Class50071]
		[RicoRicoProject_Class50072])
	(Style Regional Experimental Fun))

([RicoRicoProject_Class50071] of  Ingredient

	(IngredientName "Vino Tinto de Monastrell")
	(IngredientType Other)
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class50072] of  Ingredient

	(IngredientName "Uva")
	(IngredientType Fruit)
	(Season Autumn))

([RicoRicoProject_Class50073] of  Drink

	(DrinkName "Carajillo")
	(DrinkPrice 3.0)
	(DrinkType Other)
	(IncompatibilityWDish
		[RicoRicoProject_Class50040]
		[RicoRicoProject_Class40002]
		[RicoRicoProject_Class50060]))

([RicoRicoProject_Class50074] of  Drink

	(DrinkName "Cafè")
	(DrinkPrice 1.0)
	(DrinkType Other))

([RicoRicoProject_Class50075] of  Drink

	(DrinkName "Estrella")
	(DrinkPrice 2.5)
	(DrinkType Beer)
	(IncompatibilityWDish
		[RicoRicoProject_Class50054]
		[RicoRicoProject_Class50011]
		[RicoRicoProject_Class30012]
		[RicoRicoProject_Class20017]
		[RicoRicoProject_Class40008]
		[RicoRicoProject_Class20009]
		[RicoRicoProject_Class50029]
		[RicoRicoProject_Class30006]
		[RicoRicoProject_Class50013]
		[RicoRicoProject_Class20010]))

([RicoRicoProject_Class50076] of  Drink

	(DrinkName "Agua con Gas")
	(DrinkPrice 1.5)
	(DrinkType Water))

([RicoRicoProject_Class50078] of  First

	(DishName "Tostadas de Platano")
	(DishPrice 4.0)
	(DishType Fruitarian)
	(Friendliness Average)
	(IncompatibilityW2
		[RicoRicoProject_Class50066]
		[RicoRicoProject_Class50017]
		[RicoRicoProject_Class50038])
	(Ingredients [RicoRicoProject_Class40011])
	(Style Experimental Fun))

([RicoRicoProject_Class50079] of  Drink

	(DrinkName "Guinnes")
	(DrinkPrice 3.0)
	(DrinkType Beer)
	(IncompatibilityWDish
		[RicoRicoProject_Class50054]
		[RicoRicoProject_Class50011]
		[RicoRicoProject_Class30012]
		[RicoRicoProject_Class20017]
		[RicoRicoProject_Class40008]
		[RicoRicoProject_Class20009]
		[RicoRicoProject_Class50029]
		[RicoRicoProject_Class30006]
		[RicoRicoProject_Class50013]
		[RicoRicoProject_Class20010]))

([RicoRicoProject_Class60000] of  Second

	(DishName "Empanadas de Carne")
	(DishPrice 5.0)
	(Friendliness High)
	(Ingredients [RicoRicoProject_Class30001])
	(Style Classic Regional))

([RicoRicoProject_Class60001] of  Second

	(DishInfo "Plato tipico de Galizia")
	(DishName "Polipo a feira")
	(DishPrice 9.0)
	(Friendliness Average)
	(Ingredients
		[RicoRicoProject_Class50004]
		[RicoRicoProject_Class30004]
		[RicoRicoProject_Class50005])
	(MaxNum 250)
	(Style Classic Regional Gourmet))

([RicoRicoProject_Class60002] of  Second

	(DishInfo "Tipical spanish dish")
	(DishName "Tortilla")
	(DishPrice 3.0)
	(DishType Vegetarian)
	(Friendliness High)
	(Ingredients
		[RicoRicoProject_Class36]
		[RicoRicoProject_Class20014])
	(MaxNum 1000)
	(Style Classic Regional))

([RicoRicoProject_Class60003] of  Second

	(DishInfo "Sushi tipico de Japon ideal para charlar")
	(DishName "Sushi de Salmon")
	(DishPrice 6.0)
	(Friendliness Average)
	(Ingredients
		[RicoRicoProject_Class30010]
		[RicoRicoProject_Class40018]
		[RicoRicoProject_Class40017])
	(MaxNum 400)
	(Style Modern Regional))

([RicoRicoProject_Class60004] of  Drink

	(DrinkName "Zumo de Manzana")
	(DrinkPrice 2.0)
	(DrinkType Juice)
	(IncompatibilityWDish
		[RicoRicoProject_Class50040]
		[RicoRicoProject_Class50027]
		[RicoRicoProject_Class50035]
		[RicoRicoProject_Class40002]
		[RicoRicoProject_Class50042]
		[RicoRicoProject_Class10000]
		[RicoRicoProject_Class20025]
		[RicoRicoProject_Class50062]
		[RicoRicoProject_Class50055]
		[RicoRicoProject_Class50050]
		[RicoRicoProject_Class50052]
		[RicoRicoProject_Class50000]
		[RicoRicoProject_Class40000]
		[RicoRicoProject_Class50060]
		[RicoRicoProject_Class50025]
		[RicoRicoProject_Class50043]
		[RicoRicoProject_Class50003]
		[RicoRicoProject_Class10001]
		[RicoRicoProject_Class30007]
		[RicoRicoProject_Class50019]
		[RicoRicoProject_Class20015]
		[RicoRicoProject_Class30000]
		[RicoRicoProject_Class20016]
		[RicoRicoProject_Class50078]
		[RicoRicoProject_Class50059]
		[RicoRicoProject_Class50023]
		[RicoRicoProject_Class40006]
		[RicoRicoProject_Class50066]
		[RicoRicoProject_Class50070]
		[RicoRicoProject_Class50048]
		[RicoRicoProject_Class50015]
		[RicoRicoProject_Class50009]
		[RicoRicoProject_Class60000]
		[RicoRicoProject_Class30008]
		[RicoRicoProject_Class30011]
		[RicoRicoProject_Class50017]
		[RicoRicoProject_Class20011]
		[RicoRicoProject_Class40013]
		[RicoRicoProject_Class50006]
		[RicoRicoProject_Class50057]
		[RicoRicoProject_Class20005]
		[RicoRicoProject_Class20000]
		[RicoRicoProject_Class50021]
		[RicoRicoProject_Class40021]
		[RicoRicoProject_Class50038]
		[RicoRicoProject_Class20006]
		[RicoRicoProject_Class30002]
		[RicoRicoProject_Class60001]
		[RicoRicoProject_Class50063]
		[RicoRicoProject_Class60003]
		[RicoRicoProject_Class50045]
		[RicoRicoProject_Class60002]
		[RicoRicoProject_Class50061]))

([RicoRicoProject_Class60005] of  Drink

	(DrinkName "Zumo de Naranja")
	(DrinkPrice 2.0)
	(DrinkType Juice)
	(IncompatibilityWDish
		[RicoRicoProject_Class50040]
		[RicoRicoProject_Class50027]
		[RicoRicoProject_Class50035]
		[RicoRicoProject_Class40002]
		[RicoRicoProject_Class50042]
		[RicoRicoProject_Class10000]
		[RicoRicoProject_Class20025]
		[RicoRicoProject_Class50062]
		[RicoRicoProject_Class50055]
		[RicoRicoProject_Class50050]
		[RicoRicoProject_Class50052]
		[RicoRicoProject_Class50000]
		[RicoRicoProject_Class40000]
		[RicoRicoProject_Class50060]
		[RicoRicoProject_Class50025]
		[RicoRicoProject_Class50043]
		[RicoRicoProject_Class50003]
		[RicoRicoProject_Class10001]
		[RicoRicoProject_Class30007]
		[RicoRicoProject_Class50019]
		[RicoRicoProject_Class20015]
		[RicoRicoProject_Class30000]
		[RicoRicoProject_Class20016]
		[RicoRicoProject_Class50078]
		[RicoRicoProject_Class50059]
		[RicoRicoProject_Class50023]
		[RicoRicoProject_Class40006]
		[RicoRicoProject_Class50066]
		[RicoRicoProject_Class50070]
		[RicoRicoProject_Class50048]
		[RicoRicoProject_Class50015]
		[RicoRicoProject_Class50009]
		[RicoRicoProject_Class60000]
		[RicoRicoProject_Class30008]
		[RicoRicoProject_Class30011]
		[RicoRicoProject_Class50017]
		[RicoRicoProject_Class20011]
		[RicoRicoProject_Class40013]
		[RicoRicoProject_Class50006]
		[RicoRicoProject_Class50057]
		[RicoRicoProject_Class20005]
		[RicoRicoProject_Class20000]
		[RicoRicoProject_Class50021]
		[RicoRicoProject_Class40021]
		[RicoRicoProject_Class50038]
		[RicoRicoProject_Class20006]
		[RicoRicoProject_Class30002]
		[RicoRicoProject_Class60001]
		[RicoRicoProject_Class50063]
		[RicoRicoProject_Class60003]
		[RicoRicoProject_Class50045]
		[RicoRicoProject_Class60002]
		[RicoRicoProject_Class50061]))
)








;Que estilo te gusta?
;preguntas tipo test de psicología (con respuestas de 1 a 10)
;religion!

;begin


;;**********************
;;* message handlers
;;**********************
(defmodule MAIN
    (export ?ALL)
)
(defglobal ?*firsts* = FALSE)
(defglobal ?*seconds* = FALSE )
(defglobal ?*desserts* = FALSE )
(defglobal ?*drinks* = FALSE )
(defglobal ?*guests* = 0)

(defmessage-handler Menu printInfo primary ()
  (printout t "First Dish: " )
  (send ?self:FirstDish printName)
  (send ?self:FirstDish printPrice)
  (printout t "Second Dish: " )
  (send ?self:SecondDish printName)
  (send ?self:SecondDish printPrice)
  (printout t "Dessert: " )
  (send ?self:DessertDish printName) 
  (send ?self:DessertDish printPrice) 
  (printout t "Drink : ") 
  (send (nth$ 1 ?self:MenuDrink) printName) 
  (send (nth$ 1 ?self:MenuDrink) printPrice) ;TODO: fix this multislot shit
  (printout t "Total Price : ") 
  (bind ?sum (+ (send ?self:FirstDish get-DishPrice)  (send ?self:SecondDish get-DishPrice)
  (send ?self:DessertDish get-DishPrice)(send (nth$ 1 ?self:MenuDrink) get-DrinkPrice)))
  (printout t ?sum)
  (printout t crlf)

)
(defmessage-handler Menu get-Price primary ()
  (bind ?sum (+ (send ?self:FirstDish get-DishPrice)  (send ?self:SecondDish get-DishPrice)
  (send ?self:DessertDish get-DishPrice)(send (nth$ 1 ?self:MenuDrink) get-DrinkPrice)))
  (return ?sum)
)


(defmessage-handler Drink printPrice primary ()
  (printout t "Price: ")
  (bind ?name ?self:DrinkPrice)
  (printout t ?name) 
  (printout t crlf)
)

(defmessage-handler Drink printName primary ()
  (printout t "Drink Name: ")
  (bind ?name ?self:DrinkName)
  (printout t ?name) 
  (printout t crlf)
)
(defmessage-handler Dish printPrice primary ()
  (printout t "Price: ")
  (bind ?name ?self:DishPrice)
  (printout t ?name) 
  (printout t crlf)
)

(defmessage-handler Dish printName primary ()
  (printout t "Dish Name: ")
  (bind ?name ?self:DishName)
  (printout t ?name) 
  (printout t crlf)
)

(defmessage-handler Dish get-DishPricee primary ()
  (bind ?price ?self:DishPrice)
  (return ?price)
)


;;****************
;;* DEFFUNCTIONS *
;;****************


(deffunction fail-with-message (?message) 
	(printout t "FAIL: " ?message crlf)
	(halt)
)


(deffunction minimum-slot (?li ?sl ?init)
 (bind ?min ?init) 
 (if (eq ?li FALSE) then (halt))
	(if (neq ?li FALSE) then	
		(bind ?li (create$ ?li))) ;use this structure to check if list is empty...
 (if (eq (length$ ?li) 0) then (fail-with-message "Not enough plates"))
 (loop-for-count (?i 1 (length$ ?li))
   (bind ?curr (send (nth$ ?i ?li) ?sl))
   (bind ?minim (send ?min ?sl))
   (if (< ?curr ?minim)
     then 
          (bind ?min (nth$ ?i ?li))
   )
  )
  (return ?min)
)
(deffunction maximum-slot (?li ?sl ?init)
 (bind ?min ?init)
 (if (eq ?li FALSE) then (halt))
 (loop-for-count (?i 1 (length$ ?li))
   (bind ?curr (send (nth$ ?i ?li) ?sl))
   (bind ?minim (send ?min ?sl))
   (if (> ?curr ?minim)
     then 
          (bind ?min (nth$ ?i ?li))
   )
  )
  (return ?min)
)
(deffunction findminprice () "" 
	(bind ?min1 (send (minimum-slot ?*firsts* get-DishPrice (nth$ 1 ?*firsts*)) get-DishPrice)) 
	(bind ?min2 (send (minimum-slot ?*seconds* get-DishPrice (nth$ 1 ?*seconds*)) get-DishPrice)) 
	(bind ?min3 (send (minimum-slot ?*desserts* get-DishPrice(nth$ 1 ?*desserts*)) get-DishPrice)) 
	(bind ?min4 (send (minimum-slot ?*drinks* get-DrinkPrice(nth$ 1 ?*drinks*)) get-DrinkPrice)) 
	(bind ?min (+ ?min1 ?min2 ?min3 ?min4))
	(printout t "Found menu cant cost less than" ?min " euros per person" crlf)
	(return ?min)
)

(deffunction findmaxprice () "" 
	(bind ?max1 (send (maximum-slot ?*firsts* get-DishPrice (nth$ 1 ?*firsts*)) get-DishPrice)) 
	(bind ?max2 (send (maximum-slot ?*seconds* get-DishPrice (nth$ 1 ?*seconds*)) get-DishPrice)) 
	(bind ?max3 (send (maximum-slot ?*desserts* get-DishPrice(nth$ 1 ?*desserts*)) get-DishPrice)) 
	(bind ?max4 (send (maximum-slot ?*drinks* get-DrinkPrice(nth$ 1 ?*drinks*)) get-DrinkPrice)) 
	(bind ?max (+ ?max1 ?max2 ?max3 ?max4))
	(printout t "Found menu cant cost more than " ?max "euros per person"crlf)
	(return ?max)
)

(deffunction eliminar-incompatible-dishes(?li ?sl ?const)
	(bind ?encontrado FALSE)
	(if (neq ?li FALSE) then	
		(bind ?li (create$ ?li))

		(if (> (length ?li) 0) then
			(loop-for-count (?i 1 (length ?li))
				(bind $?v (send (nth$ ?i ?li) ?sl))
				(bind ?name (send (nth$ ?i ?li) get-DishName))
				(bind ?name2 (send ?const get-DishName))
				;dish incompatibility: we have to check they are not the same dish.
				(if (and (not (member$ ?const $?v)) (not (eq (str-compare ?name ?name2) 0)))then
				 (if (eq ?encontrado FALSE) then
				   (bind ?encontrado TRUE)
				   (bind ?ins (nth$ ?i ?li))
				  else
				   (bind ?ins (create$ ?ins (nth$ ?i ?li)))
				 )
				)
			)
		)
	)
	(if (eq ?encontrado FALSE) then
		(bind ?ins FALSE)
	)
	(return ?ins)
)

(deffunction keep-drinks-cheaper-than (?drinks ?price) 
	(bind ?encontrado FALSE)
	(if (neq ?drinks FALSE) then	
		(bind ?drinks (create$ ?drinks))
		;(printout t "Entrado" crlf)
		(if (> (length ?drinks) 0) then
			(loop-for-count (?i 1 (length ?drinks))
				(if (< (send (nth$ ?i ?drinks) get-DrinkPrice) ?price) then ;if the condition is true, we keep the plate
				 (if (eq ?encontrado FALSE) then
				   (bind ?encontrado TRUE)
				   (bind ?ins (nth$ ?i ?drinks))
				  else
				   (bind ?ins (create$ ?ins (nth$ ?i ?drinks)))
				 )
				)
			)
		)
	)
	(if (eq ?encontrado FALSE) then
		(bind ?ins FALSE)
	)
	;(printout t "Salido" crlf)
	(return ?ins)
)
(deffunction keep-plates-for-more-than (?plates ?guests) 
	(bind ?encontrado FALSE)
	(if (neq ?plates FALSE) then	
		(bind ?plates (create$ ?plates))
		;(printout t "Entrado" crlf)
		(if (> (length ?plates) 0) then
			(loop-for-count (?i 1 (length ?plates))
				(bind ?maxnum (send (nth$ ?i ?plates) get-MaxNum))
				(if (neq ?maxnum FALSE) then
				(if (> ?maxnum ?guests) then ;if the condition is true, we keep the plate
					 (if (eq ?encontrado FALSE) then
					   (bind ?encontrado TRUE)
					   (bind ?ins (nth$ ?i ?plates))
					  else
					   (bind ?ins (create$ ?ins (nth$ ?i ?plates)))
					 )
				)
				else
				(if (eq ?encontrado FALSE) then
				   (bind ?encontrado TRUE)
				   (bind ?ins (nth$ ?i ?plates))
				  else
				   (bind ?ins (create$ ?ins (nth$ ?i ?plates)))
				 )

				)
		        ) 
		)
	)
	(if (eq ?encontrado FALSE) then
		(bind ?ins FALSE)
	)
	(if (eq ?ins FALSE) then (printout t "JODER TIO PORQUE??" crlf))
	(return ?ins)
)

(deffunction is-list-empty(?list)
	(bind ?ret TRUE)	
	(if (neq ?list FALSE) then	
		(bind ?list (create$ ?list))
		(if (> (length ?list) 0) then 
			(bind ?ret FALSE) 
		)
	)
	(return ?ret)
)

(deffunction keep-cheaper-than (?plates ?price) 
	(bind ?encontrado FALSE)
	(if (neq ?plates FALSE) then	
		(bind ?plates (create$ ?plates))
		;(printout t "Entrado" crlf)
		(if (> (length ?plates) 0) then
			(loop-for-count (?i 1 (length ?plates))
				(if (< (send (nth$ ?i ?plates) get-DishPrice) ?price) then ;if the condition is true, we keep the plate
				 (if (eq ?encontrado FALSE) then
				   (bind ?encontrado TRUE)
				   (bind ?ins (nth$ ?i ?plates))
				  else
				   (bind ?ins (create$ ?ins (nth$ ?i ?plates)))
				 )
				)
			)
		)
	)
	(if (eq ?encontrado FALSE) then
		(bind ?ins FALSE)
	)
	(return ?ins)
)
(deffunction check-plate-for-season (?plate ?epoch) " "
  (bind $?ing (send ?plate get-Ingredients) );?
  (if (> (length $?ing) 0 ) then
   (loop-for-count (?i 1 (length $?ing)) 
 	 (bind ?current (nth$ ?i $?ing))
         (if (not (member$ ?epoch (send ?current get-Season))) then 
	   (return FALSE)
	 )
   )
   (return TRUE)
  else 
   (return FALSE)
  )
)

(deffunction return-plates-of-season (?plates ?epoch) 
	(bind ?encontrado FALSE)
	(if (neq ?plates FALSE) then	
		(bind ?plates (create$ ?plates))

		(if (> (length ?plates) 0) then
			(loop-for-count (?i 1 (length ?plates))
				(if (check-plate-for-season (nth$ ?i ?plates) ?epoch) then
				 (if (eq ?encontrado FALSE) then
				   (bind ?encontrado TRUE)
				   (bind ?ins (nth$ ?i ?plates))
				  else
				   (bind ?ins (create$ ?ins (nth$ ?i ?plates)))
				 )
				)
			)
		)
	)
	(if (eq ?encontrado FALSE) then
		(bind ?ins FALSE)
	)
	(return ?ins)
)


(deffunction filtrar-multi-por (?li ?sl ?const )
	(bind ?encontrado FALSE)
	(if (neq ?li FALSE) then	
		(bind ?li (create$ ?li))

		(if (> (length ?li) 0) then
			(loop-for-count (?i 1 (length ?li))
				(bind $?v (send (nth$ ?i ?li) ?sl))
				(if (member$ ?const $?v) then
				 (if (eq ?encontrado FALSE) then
				   (bind ?encontrado TRUE)
				   (bind ?ins (nth$ ?i ?li))
				  else
				   (bind ?ins (create$ ?ins (nth$ ?i ?li)))
				 )
				)
			)
		)
	)
	(if (eq ?encontrado FALSE) then
		(bind ?ins FALSE)
	)
	(return ?ins)
)

(deffunction filtrar-single-por (?li ?sl ?const)
	(bind ?encontrado FALSE)
	(if (neq ?li FALSE) then	
		(bind ?li (create$ ?li))

		(if (> (length ?li) 0) then
			(loop-for-count (?i 1 (length ?li))
				(bind $?v (send (nth$ ?i ?li) ?sl))
				(if (eq ?const $?v) then
				 (if (eq ?encontrado FALSE) then
				   (bind ?encontrado TRUE)
				   (bind ?ins (nth$ ?i ?li))
				  else
				   (bind ?ins (create$ ?ins (nth$ ?i ?li)))
				 )
				)
			)
		)
	)
	(if (eq ?encontrado FALSE) then
		(bind ?ins FALSE)
	)
	(return ?ins)
)

(deffunction filtrar-single-por-group (?li ?sl $?const)
	(bind ?result (create$))
	(loop-for-count (?i 1 (length $?const))
		(bind ?current (nth$ ?i $?const))
		(bind ?lista (filtrar-single-por ?li ?sl ?current))
		(bind ?result (insert$ ?result 1 ?lista))
	)
	(return ?result)
)

(deffunction filtrar-multi-por-group (?li ?sl $?const)
	(bind ?result (create$))
	(loop-for-count (?i 1 (length $?const))
		(bind ?current (nth$ ?i $?const))
		(bind ?lista (filtrar-multi-por ?li ?sl ?current))
		(bind ?result (insert$ ?result 1 ?lista))
	)
	(return ?result)
)

(deffunction random-slot ( ?li )
(bind ?li (create$ ?li))
(bind ?max (length ?li))
(bind ?r (random 1 ?max))
(bind ?ins (nth$ ?r ?li))
(return ?ins)
)

(deffunction list-contains (?lista ?style) 
(bind ?answer FALSE)
(bind ?list ?lista)
(loop-for-count (?i 1 (length ?list))
   (bind ?v (nth$ ?i ?list))
   (if (eq ?v ?style)then 
          (bind ?answer TRUE)
   )
   (return ?answer)
)
) 

(deffunction create-most-expensive-menu() "" 
	(bind ?list ?*seconds*)
	(bind ?max (random-slot ?list))

	(bind ?possiblefirsts ?*firsts*)
	(bind ?possiblefirsts (eliminar-incompatible-dishes ?possiblefirsts get-IncompatibilityW2 ?max))
	(bind ?max1 (maximum-slot ?possiblefirsts get-DishPrice (nth$ 1 ?possiblefirsts)))
		
	(bind ?possibledesserts ?*desserts*)
	(bind ?possibledesserts (eliminar-incompatible-dishes ?possibledesserts get-IncompatibilityDW2 ?max))
	(bind ?maxDe (maximum-slot ?possibledesserts get-DishPrice (nth$ 1 ?possibledesserts)))

	(bind ?maxDr (maximum-slot ?*drinks* get-DrinkPrice (nth$ 1 ?*drinks*)))
	
        (bind ?ins (make-instance [expensive-menu] of Menu))		
	(send ?ins put-FirstDish ?max1 )
	(send ?ins put-SecondDish ?max) 
	(send ?ins put-DessertDish ?maxDe)
        (send ?ins put-MenuDrink (create$ ?maxDr))
	
	;(printout t "Proudly announcing our random menu!!" crlf)
	;(send ?ins printInfo)
        ;(printout t crlf)
	(return ?ins)
)

(deffunction create-cheapest-menu() "" 
	(bind ?list ?*seconds*)
	(bind ?min (random-slot ?list))

	(bind ?possiblefirsts ?*firsts*)
	(bind ?possiblefirsts (eliminar-incompatible-dishes ?possiblefirsts get-IncompatibilityW2 ?min))
	(bind ?min1 (minimum-slot ?possiblefirsts get-DishPrice (nth$ 1 ?possiblefirsts)))
		
	(bind ?possibledesserts ?*desserts*)
	(bind ?possibledesserts (eliminar-incompatible-dishes ?possibledesserts get-IncompatibilityDW2 ?min))
	(bind ?minDe (minimum-slot ?possibledesserts get-DishPrice (nth$ 1 ?possibledesserts)))

	(bind ?minDr (minimum-slot ?*drinks* get-DrinkPrice (nth$ 1 ?*drinks*)))
	
        (bind ?ins (make-instance [cheap-menu] of Menu))		
	(send ?ins put-FirstDish ?min1 )
	(send ?ins put-SecondDish ?min) 
	(send ?ins put-DessertDish ?minDe)
        (send ?ins put-MenuDrink (create$ ?minDr))
	
	;(printout t "Proudly announcing our random menu!!" crlf)
	;(send ?ins printInfo)
        ;(printout t crlf)
	(return ?ins)
)

(deffunction create-random-menu () "" 
	(bind ?list ?*seconds*)
	(bind ?min (random-slot ?list))

	(bind ?possiblefirsts ?*firsts*)
	(bind ?possiblefirsts (eliminar-incompatible-dishes ?possiblefirsts get-IncompatibilityW2 ?min))
	(bind ?min1 (random-slot ?possiblefirsts))
		
	(bind ?possibledesserts ?*desserts*)
	(bind ?possibledesserts (eliminar-incompatible-dishes ?possibledesserts get-IncompatibilityDW2 ?min))
        
	(bind ?minDe (random-slot ?possibledesserts))
	
	(bind ?minDr (random-slot ?*drinks*))
	
        (bind ?ins (make-instance [random-menu] of Menu))		
	(send ?ins put-FirstDish ?min1 )
	(send ?ins put-SecondDish ?min) 
	(send ?ins put-DessertDish ?minDe)
        (send ?ins put-MenuDrink (create$ ?minDr))
	
	(printout t "Proudly announcing our random menu!!" crlf)
	(send ?ins printInfo)
        (printout t crlf)
	(assert (cheap-menu-created))
)


(deffunction imprime-todo (?v)
(if (> (length$ ?v) 0) then
(loop-for-count (?i 1 (length ?v))
(send (nth$ ?i ?v) print)
(printout t crlf)
)
)
)

(deffunction print-plates-list(?v)
(if (eq (is-list-empty ?v) FALSE) then
(bind ?v (create$ ?v))
(loop-for-count (?i 1 (length ?v))
(bind ?name (send (nth$ ?i ?v) get-DishName))
(printout t ?name)	
(printout t crlf)
)
)
)

;; The following functions are used to parse the users' replies to questions.


(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer)  
       then (bind ?answer (lowcase ?answer))
	    (if (eq ?answer d) then (bind ?answer (nth$ 1 ?allowed-values)))
   )
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction yes-or-no-p (?question)
   (bind ?response (ask-question ?question yes no y n))
   (if (or (eq ?response yes) (eq ?response y))
       then TRUE 
       else FALSE))


(deffunction ask-integer-question (?pregunta ?rangini ?rangfi)
    (format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
    (bind ?respuesta (read))
    (while (not(and(> ?respuesta ?rangini)(< ?respuesta ?rangfi))) do
    (format t "¿%s? [%d, %d] " ?pregunta ?rangini ?rangfi)
    (bind ?respuesta (read))
    )
    ?respuesta
)

;;;**********************
;;;* PROGRAM STATE RULES *
;;;**********************

;;Until now, we have two states: info-gathering and done.
;;The idea of using states might not be good, I am just experimenting.



;;;****************************
;;;* STARTUP AND END RULES *
;;;****************************

;; First message (hello world!)
(defrule system-banner ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t "The Menu Proposal System")
  (printout t crlf crlf)
  (set-strategy random)
  (printout t "********************************************************************************************************" crlf)
  (printout t "****************************************PHASE 1 - READ CONCRETE INPUT DATA******************************" crlf)
  (printout t "********************************************************************************************************" crlf)
  (focus module-event-info-gathering)
)

;;;*************
;;;* TEMPLATES *
;;;*************
(deftemplate target-event "Event for which the recommendation shall be done"
    (slot budget-per-person)
    (slot type)
    (slot subtype)
    (slot guests)
    (slot season)
    (slot children)
)

(deftemplate menu-restrictions "Event for which the recommendation shall be done"
    (slot isVeganVegetarian)
    (slot experimental)
    (slot classic)
)

(deftemplate abstract-info
	(slot poor-or-rich )
	(slot impressive-event)
 	(slot  guests )
 	(slot  children)
	(slot  season )
	(slot  experimental )
	(slot  classic)
)

;;;*******************************
;;;* MODULE EVENT INFO GATHERING *
;;;*******************************

(defmodule module-event-info-gathering "Module that makes questions about the event"
    (import MAIN ?ALL)
    (export ?ALL)
)

;;; Initial fact



(deffacts initial-facts
    (target-event
	(budget-per-person unknown)
        (type unknown)
        (season unknown)
	(guests unknown)
	(subtype unknown)
        (children unknown)
    )

    (menu-restrictions 
	(isVeganVegetarian unknown)
        (experimental unknown)
	(classic unknown)
    )

    (abstract-info 
	(poor-or-rich unknown)
 	(impressive-event unknown)
 	(guests unknown)
 	(children unknown)
	(season unknown)
	(experimental unknown)
	(classic unknown)
    )
)
;;;***************
;;;* QUERY RULES *
;;;***************

;get budget
(defrule determine-budget ""
    (guests-determined)
    (not (budget-determined))
    ?e <-(target-event (budget-per-person unknown))
    (target-event (guests ?num))
=>
    (bind ?res (ask-integer-question "What is your budget in total, in euros? (between 1 and 1000000) " 1 1000000))
    (assert (budget-determined))
    (bind ?bpp (div ?res ?num))
    (modify ?e (budget-per-person ?bpp))
    (printout t "DEBUG: Budget per person is ")
    (printout t ?bpp )
    (printout t " euros" crlf)
)


;;; Get the season in which the event is going to be done

;;; Get the generic type of the event
(defrule determine-event-type ""
    (not (type-determined))
    ?e <-(target-event (type unknown))
=>
    (bind ?res (ask-question "What kind of event are you planning? (family/congress) " family congress))
    (assert (type-determined))
    (modify ?e (type ?res))
)

;;; Get the amount of guests that will assist to the event, this will classify the amount in one of three categories: few/medium/many
(defrule determine-event-guests ""
    (not (guests-determined))
    ?e <-(target-event (guests unknown))
=>
    (bind ?res (ask-integer-question "How many people are we expecting? (Range of people between 1 and 1000) " 1 10000))
    (assert (guests-determined))
    (bind ?*guests* ?res)
    (modify ?e (guests ?res))
)

;;; Get the "subtype" of event which depends on the type, this is for Family
(defrule determine-event-subtype-family ""
    (not (subtype-determined))
    ?e <- (target-event (type family) (subtype unknown))
=>
    (bind ?res (ask-question "What family event are you organizing? (wedding/baptism/communion)" wedding baptism communion))
    (assert  (subtype-determined))
    (modify ?e (subtype ?res))
    )

;;; Subtype definition for Congress
(defrule determine-event-subtype-congress "" 
    (not (subtype-determined))
    ?e <- (target-event (type congress) (subtype unknown))
=>
    (bind ?res (ask-question "Is it going to be a lunch or a dinner?" lunch dinner))
    (assert  (subtype-determined))
    (modify ?e (subtype ?res))
)

(defrule determine-children-amount
        (not (determined-children))
	?e <- (target-event (children unknown))
=>
	(bind ?res (ask-question "How many children are coming to the event? (none/few/medium/many)......." none few medium many))
	(assert (determined-children))
	(modify ?e (children ?res))
)

;;; Once all data about the event is gathered
(defrule start-menu-questions
    (declare (salience -1))
    
=>
    (focus module-menu-info-gathering)
)

;;;******************************
;;;* MODULE MENU INFO GATHERING *
;;;******************************

(defmodule module-menu-info-gathering "Module to get specific information regarding the menus"
    (import MAIN ?ALL)
    (import module-event-info-gathering ?ALL)
    (export ?ALL)
)

(defrule determine-experimental "" 
    ?ex <- (menu-restrictions (experimental unknown) (classic unknown))
   =>

   (if (yes-or-no-p "Would you like to taste something experimental? (yes/no) ") then 
   	(modify ?ex (experimental yes)(classic no))
   else 
	( if (yes-or-no-p "So, that does mean that you would like the menus to be restricted on the classic and well known dishes? (yes/no) ")  then 
		(modify ?ex (experimental no)(classic yes))
	else 
		(modify ?ex (experimental no)(classic no))
        ))
)

;kosmas: possible question: are the guests good friends of event organizer))

(defrule determine-event-season ""
    (not (season-determined))
    ?e <-(target-event (season unknown))
=>
   (if (yes-or-no-p "Are you in favor of using only fresh food (yes/no)? ") then 
    (bind ?res (ask-question "In what season of the year are you planning to have the event? (spring/summer/autumn/winter)" spring summer autumn winter))
    (assert (season-determined))
    (modify ?e (season ?res))
   else 
    (modify ?e (season dont-care))
   )
)

(defrule determine-vegan ""
   (not (vegan-vegetarian-determined))
   ?mr <- (menu-restrictions (isVeganVegetarian unknown))
   =>
   (if (yes-or-no-p "Are you vegetarian (yes/no)? ") 
       then 
       (if (yes-or-no-p "Are you vegan too (yes/no)? ")
           then (modify ?mr (isVeganVegetarian vegan))
           else (modify ?mr (isVeganVegetarian vegetarian)))
       else 
       (modify ?mr (isVeganVegetarian no))
    )
       (assert (vegan-vegetarian-determined))
)

;;; Once all data about the dishes is gathered we can start to build a solution that will be refined later
(defrule convert-to-abstract
    (declare (salience -1))
    (target-event (guests ?g) (children ?c) (type ?t) (subtype ?st) (season ?s) (budget-per-person ?bpp))
    (menu-restrictions (isVeganVegetarian ?v) (classic ?cl) (experimental ?exp))
=>
    (printout t "Thank you for your answers. We will now proceed to create 3 menus for you!" crlf)
    (printout t "DEBUG: Data gathered until now: " crlf)
    (printout t "Guests...........:		" ?g  crlf)
    (printout t "Children.........:		" ?c crlf)
    (printout t "Type.............:		" ?t  crlf)
    (printout t "Subtype..........:		" ?st crlf)
    (printout t "Season...........:		" ?s crlf)
    (printout t "Budget-per-person:		" ?bpp crlf)
    (printout t "isVeganVegetarian:		" ?v crlf)
    (printout t "Classic..........:		" ?cl crlf)
    (printout t "Experimental.....:		" ?exp crlf)

  (printout t "********************************************************************************************************" crlf)
  (printout t "************************************PHASE 2- CONVERT TO ABSTRACT PROBLEM DATA***************************" crlf)
  (printout t "********************************************************************************************************" crlf)

    (focus module-convert-to-abstract)
)


;;;******************************
;;;* MODULE CONCRETE-TO-ABSTRACT *
;;;******************************

(defmodule module-convert-to-abstract "Module to create a stractured fact that contains the abstract data"
    (import MAIN ?ALL)
    (import module-event-info-gathering ?ALL)
    (import module-menu-info-gathering ?ALL)
    (export ?ALL)
)

;Kosmas:here we determine the value of the abstract data slot impressive-event: 
;the use of many rules is not necessary, it can be done in one. 


;3-6

;poor-or-rich unknown

(defrule determine-poor-or-rich "" 
	(not (determined-poor-or-rich))
         ?x <- (abstract-info (poor-or-rich unknown))
         (target-event (budget-per-person ?bud))
      =>
	(if (< ?bud  20) then (modify ?x (poor-or-rich poor))  
	else (modify ?x (poor-or-rich rich))) 
    	(assert (determined-poor-or-rich))
)

(defrule impressive-event ""
     (not (determined-impressive-event))
     ?x <- (abstract-info (impressive-event unknown))
     (target-event (type congress)) 
   =>
    (assert (determined-impressive-event))
    (modify ?x (impressive-event a-lot))
)
    
(defrule impressive-event-a-little 
     (not (determined-impressive-event))
     ?x <- (abstract-info (impressive-event unknown))
     (or (target-event (subtype baptism)) (target-event (subtype wedding)))
   =>
    (assert (determined-impressive-event))
    (modify ?x (impressive-event a-bit))
)

(defrule doesnt-want-to-impress
     (not (determined-impressive-event))
     ?x <- (abstract-info (impressive-event unknown))
     (or (target-event (subtype communion)))
   =>
    (assert (determined-impressive-event))
    (modify ?x (impressive-event no))
)
;Kosmas: I put here the conversion of the number of guests to a discrete value.
(defrule abstract-guests ""
     (not (determined-abstract-guests))
     ?x <- (abstract-info (guests unknown))
     (target-event (guests ?g))
    =>
    (assert (determined-abstract-guests))
    (if (< ?g 250) then
        (modify ?x (guests few))
    else
        (if (< ?g 500) then
            (modify ?x (guests medium))
        else
            (modify ?x (guests many))
        )
    )
)


;we only copy the value, no conversion is made here.
(defrule abstract-children ""
     (not (determined-abstract-children))
     ?x<- (abstract-info (children unknown))
     (target-event (children ?child))
   =>
     (assert (determined-abstract-children))
     (modify  ?x (children ?child))
) 

;we only copy the value, no conversion is made here.
(defrule abstract-season ""
     (not (determined-abstract-season))
     ?x<- (abstract-info (season unknown))
     (target-event (season ?seas))
   =>
     
     (assert (determined-abstract-season))
     (modify  ?x (season ?seas))
)



;we only copy the value, no conversion is made here.
(defrule abstract-experimental ""
     (not (determined-abstract-experimental))
     ?x<- (abstract-info (experimental unknown))
     (menu-restrictions (experimental ?exp))
   =>
     (assert (determined-abstract-experimental))
     (modify  ?x (experimental ?exp))
)

(defrule abstract-classic ""
     (not (determined-abstract-classic))
     ?x <- (abstract-info (classic unknown)) 
     (menu-restrictions (classic ?cl))
   =>
    (assert (determined-abstract-classic))
    (modify ?x (classic ?cl))
)
(defrule build-abstract-solution
    (declare (salience -2))
    (abstract-info (poor-or-rich ?poor)(impressive-event ?ev)(guests ?g)(children ?c)(season ?s)(experimental ?exp)(classic ?classic))  
=>
    (printout t "***************************************************************************************" crlf)
    (printout t "DEBUG: Done conversion from concrete to abstract input" crlf)

    (printout t  "Poor-or-rich:			" ?poor crlf) 
    (printout t  "Impressive-event:		" ?ev crlf) 
    (printout t  "Guest...........:		" ?g crlf) 
    (printout t  "Children:			" ?c crlf) 
    (printout t  "Season.........:		" ?s crlf) 
    (printout t  "Experimental:			" ?exp crlf) 
    (printout t  "Classic:			" ?classic crlf) 
  (printout t "********************************************************************************************************" crlf)
  (printout t "********************************PHASE 3 - EXECUTE RULES OF ABSTRACT PROBLEM SOLVER**********************" crlf)
  (printout t "********************************************************************************************************" crlf)
    (focus module-build-abstract-solution)
)

;;;****************************
;;;* MODULE ABSTRACT SOLUTION *
;;;****************************

;Kosmas:these rules are a cheap substitute of a Bayes Network. If there is time, we will properly implement one.

(defmodule module-build-abstract-solution "Module to build an abstract solution based on the abstract data extracted from the input"
    (import MAIN ?ALL)
    (import module-event-info-gathering ?ALL)
    (import module-menu-info-gathering ?ALL)
    (import module-convert-to-abstract ?ALL)
    (export ?ALL)
)



;to start solution build, we begin with these data structures.
(defrule initialize-data-structures ""
	(declare (salience 10))
	(not (data-structs-intialized))
	=>
	(bind ?*firsts* (find-all-instances ((?ins First)) TRUE))
	(bind ?*seconds* (find-all-instances ((?ins Second)) TRUE))
	(bind ?*desserts*(find-all-instances ((?ins Dessert)) TRUE))
	(bind ?*drinks* (find-all-instances ((?ins Drink)) TRUE))	
	(assert (data-structs-initialized))
)	


;Rules
;Rule 1: if (classic = yes ) -> only serve Classic First and Second dishes.
;Rule 2: if (experimental=yes and impressive-event=a lot)-> only serve Experimental First and Second Dishes.
;Rule 3: if (experimental=yes and impressive-event=a bit)-> second dish is Experimental 
;Rule 4: if (classic= no and experimental=no and (impressive-event= a-lot or impressive-event= a-bit)) -> first dish is Experimental
;Rules 5-8: (Season Rules): if (season = x (one of Winter, Summer, Autumn, Spring) -> only serve food that is fresh on season x
;Rule 9 -> if (children=many) -> main dish has to be highly friendly
;Rule 10: if (children=medium) or (children=few)-> main dish has to be averagely friendly
;Rule 11: if (poor-or-rich=poor) -> exclude expensive things
;Rule 12 :if guests are many -> exclude dishes for less than 500
;Rule 13: if guests are moderately many -> exclude dishes for less than 250		

(defrule classic "Rule 1: if (classic = yes ) -> only serve Classic First and Second dishes."
	(not (triggered-classic))
	(abstract-info (classic yes))
	=>
	(printout t "DEBUG: Triggered Rule 1: if (classic=yes)->Only classic dishes" crlf)
	(bind ?*firsts*(filtrar-multi-por ?*firsts* get-Style Classic))
	(bind ?*seconds* (filtrar-multi-por ?*seconds* get-Style Classic ))
	(if (eq ?*firsts* FALSE) then (printout t "Rule 4 (classic)- no more firsts" crlf) (halt))	
	(if (eq ?*seconds* FALSE) then (printout t "Rule 4 (classic)- no more seconds" crlf) (halt))	
	(assert (triggered-classic))
)

(defrule only-experimental  "Rule 2: if (impressive-event=a lot and experimental=yes)-> only serve Experimental First and Second Dishes."
	(not (triggered-only-experimental))
	(abstract-info (impressive-event a-lot))
	(abstract-info (experimental yes))
	=>

	(printout t "DEBUG: Triggered Rule 2: if (impressive-event=a lot and experimental=yes)-> only serve Experimental First and Second Dishes." crlf)
	(bind ?*seconds* (filtrar-multi-por ?*seconds* get-Style Experimental ))
	(bind ?*firsts*(filtrar-multi-por ?*firsts*    get-Style Experimental ))
	(if (eq ?*seconds* FALSE) then (printout t "Rule 1 (experimental superhigh) - no more seconds" crlf) (halt))	
	(if (eq ?*firsts* FALSE) then (printout t "Rule 1 (experimental superhigh)- no more firsts" crlf) (halt))	
	;(printout t "DEBUG: Only experimental second dishes:" crlf)
	;(imprime-todo ?*seconds*)
	(assert (triggered-only-experimental))
)
	

;Rule 3: if (impressive-event=a bit and experimental=yes)-> main dish is Experimental 
(defrule mainly-experimental ""
	(not (triggered-mainly-experimental))
	(abstract-info (impressive-event a-bit))
	(abstract-info (experimental yes))
	
	=>
	(printout t "DEBUG: Triggered Rule 3: if (impressive-event=a bit and experimental=yes)-> Experimental Second Dish." crlf)
	(bind ?*seconds*(filtrar-multi-por ?*seconds* get-Style Experimental))
	(if (eq ?*seconds* FALSE) then (printout t "Rule 3 (experimental high)- no more seconds" crlf) (halt))	
	(assert (triggered-mainly-experimental))
)

;Rule 4: if (classic=no) and (impressive-event=a bit or impressive-event= a lot) and (experimental=no)-> 
;first dish is Experimental

(defrule a-bit-experimental ""
	(not (triggered-a-bit-experimental))
	(abstract-info (classic no))
	(abstract-info (impressive-event a-bit))
	(abstract-info (experimental no))
	=>
	(printout t "DEBUG: Triggered Rule 4: if (classic=no) and (impressive-event=a bit or impressive-event= a lot) and (experimental=no)-> first dish is Experimental" crlf)
	(bind ?*firsts*(filtrar-multi-por ?*firsts* get-Style Experimental))
	(if (eq (length$ ?*firsts*) 0) then (printout t "Rule 3 (experimental)- no more firsts" crlf) (halt))	
	(assert (triggered-a-bit-experimental))
)


;Rule 5-8
(defrule season-is-x "Season Rules (5-8): if (season = x (one of Winter, Summer, Autumn, Spring) -> only serve food that is fresh on season x"
	(not (triggered-season))
	(abstract-info (season ?x))
	(not (abstract-info (season dont-care)))
	=>
	(printout t "DEBUG: Triggered one of the Season Rules (5-8): if (season = x (one of Winter, Summer, Autumn, Spring) -> only serve food that is fresh on season x" crlf)
	(switch ?x
	(case summer then (bind ?epoch Summer))
	(case winter then (bind ?epoch Winter))
	(case autumn then (bind ?epoch Autumn))
	(case spring then (bind ?epoch Spring))
	)
	(bind ?*firsts* (return-plates-of-season ?*firsts* ?epoch))
	(if (eq ?*firsts* FALSE) then (printout t "Rule 5-8  (season) - no more firsts" crlf) (halt))	
	(bind ?*seconds* (return-plates-of-season ?*seconds* ?epoch))
	(if (eq ?*seconds* FALSE) then (printout t "Rule 5-8 (season) - no more seconds" crlf) (halt))	
	(assert (triggered-season))
)

;Rule 9 -> if (children=many) -> main dish has to be highly friendly
(defrule children-are-many "Rule 9 -> if (children=many) -> main dish has to be highly friendly"
	(not (triggered-children-are-many))
	(abstract-info (children many))
	=>
	(printout t "DEBUG: Triggered Rule 9 -> if (children=many) -> main dish has to be highly friendly" crlf)
	(bind ?*seconds*(filtrar-single-por ?*seconds* get-Friendliness High))
	(if (eq ?*seconds* FALSE) then (printout t "Rule 9 (children)- no more seconds" crlf) (halt))	
	(assert (triggered-children-are-many))
)

;Rule 10: if (children=medium) or (children=few)-> main dish has to be averagely friendly
(defrule children-are-medium "Rule 10: if (children=medium) or (children=few)-> main dish has to be averagely friendly"
	(not (triggered-children-are-medium))
	(or (abstract-info (children medium)) (abstract-info (children few)))
	=>
	
	(printout t "DEBUG: Triggered Rule 10 if (children=medium) or (children=few)-> main dish has to be at least averagely friendly" crlf)
	(bind ?*seconds*(filtrar-single-por-group ?*seconds* get-Friendliness Average High ))
	(if (eq ?*seconds* FALSE) then (printout t "Rule 10 (children)- no more seconds" crlf) (halt))	
	(assert (triggered-children-are-medium))
)

;Rule 11: if (poor-or-rich=poor) -> exclude expensive things

(defrule remove-expensive-plates "Rule 11: if (poor-or-rich=poor) -> exclude expensive things"
	(not (triggered-remove-expensive-plates))
	(abstract-info (poor-or-rich poor))
	=>
	(printout t "DEBUG: Rule 11: if (poor-or-rich=poor) -> exclude expensive dishes and drinks" crlf)
	(bind ?*firsts* (keep-cheaper-than ?*firsts* 9))
	(if (eq ?*firsts* FALSE) then (printout t "Rule 11 (money) - no more firsts." crlf)(halt))
	(bind ?*seconds* (keep-cheaper-than ?*seconds* 15))
	(if (eq ?*seconds* FALSE) then (printout t "Rule 11 (money)- no more seconds" crlf) (halt))	
	(bind ?*desserts* (keep-cheaper-than ?*desserts* 8 ))
	(if (eq ?*desserts* FALSE) then (printout t "Rule 11 (money)- no more desserts" crlf) (halt))	
	(bind ?*drinks* (keep-drinks-cheaper-than ?*drinks* 6))
	(if (eq ?*drinks* FALSE) then (printout t "Rule 11 (money)- no more drinks" crlf) (halt))	
	(assert (triggered-remove-expensive-plates))
)		

;Rule 12 :if guests are many -> exclude dishes for less than 500
(defrule remove-plates-for-medium-guests  "Rule 12 :if guests are many -> exclude dishes for less than 500"
	(not (triggered-remove-plates-for-medium-guests))	
	(abstract-info (guests many))
	=>
	(printout t "DEBUG: Rule 12 :if guests are many -> exclude dishes for less than 500" crlf)
	(bind ?*seconds* (keep-plates-for-more-than ?*seconds* 500))
	(bind ?*firsts* (keep-plates-for-more-than ?*firsts* 500))
	(bind ?*desserts* (keep-plates-for-more-than ?*desserts* 500))
	(if (eq ?*firsts* FALSE) then (printout t "Rule 12 (num-guests) - no more firsts." crlf)(halt))
	(if (eq ?*seconds* FALSE) then (printout t "Rule 12 (num-guests)- no more seconds" crlf) (halt))	
	(if (eq ?*desserts* FALSE) then (printout t "Rule 12 (num-guests)- no more desserts" crlf) (halt))	
	(assert (triggered-remove-plates-for-medium-guests))	
)

;Rule 13: if guests are moderately many -> exclude dishes for less than 250		
(defrule remove-plates-for-few-guests "Rule 13: if guests are moderately many -> exclude dishes for less than 250"
	(not (triggered-remove-plates-for-few-guests))	
	(abstract-info (guests medium))
	=>
	(printout t "DEBUG: Rule 13: if guests are moderately many -> exclude dishes for less than 250" crlf)
	(bind ?*seconds* (keep-plates-for-more-than ?*seconds* 250))
	(bind ?*firsts* (keep-plates-for-more-than ?*firsts* 250))
	(bind ?*desserts* (keep-plates-for-more-than ?*desserts* 250))
	(if (eq ?*firsts* FALSE) then (printout t "Rule 13 (num-guests) - no more firsts." crlf)(halt))
	(if (eq ?*seconds* FALSE) then (printout t "Rule 13 (num-guests)- no more seconds" crlf) (halt))	
	(if (eq ?*desserts* FALSE) then (printout t "Rule 13 (num-guests)- no more desserts" crlf) (halt))	
	(assert (triggered-remove-plates-for-few-guests))	
)

(defrule print-abstract-results ""
	(declare (salience -10))
=>
	(printout t "DEBUG: Possible First Dishes, at the end of PHASE 3:" crlf)
	(if (eq (is-list-empty ?*firsts*) TRUE) then (printout t "No firsts available." crlf)(halt)
	else (print-plates-list ?*firsts*))

	(printout t "DEBUG: Possible Second Dishes, at the end of PHASE 3:" crlf)
	(if (eq (is-list-empty ?*seconds*) TRUE) then (printout t "No seconds available." crlf)(halt)
	else (print-plates-list ?*seconds*))
	(printout t "DEBUG: Possible  Dishes, at the end of PHASE 3:" crlf)
	(if (eq (is-list-empty ?*desserts*) TRUE) then (printout t "No desserts available." crlf)(halt)
	else (print-plates-list ?*desserts*))
)

;;; Once an abstract model is ready we go on to the refinement
(defrule refine-solution
    (declare (salience -20))
=>
    (printout t "Abstract problem solved, moving on to refinement." crlf)
  (printout t "********************************************************************************************************" crlf)
  (printout t "************************************PHASE 4- REFINEMENT*************************************************" crlf)
  (printout t "********************************************************************************************************" crlf)
    (focus module-refine-solution)
)

;;;*********************
;;;* MODULE REFINEMENT *
;;;*********************

(defmodule module-refine-solution "Module to refine and build a final recommendation"
    (import MAIN ?ALL)
    (import module-event-info-gathering ?ALL)
    (import module-menu-info-gathering ?ALL)
    (import module-convert-to-abstract ?ALL)
    (import module-build-abstract-solution ?ALL)
    (export ?ALL)
)


(defrule refinement-vegetarian-vegan ""
  (not (vegan-vegetarian-is-refined))
  (menu-restrictions (isVeganVegetarian ?v))
  =>
  (if (eq ?v vegetarian) then 
			      (printout t "DEBUG: Refinement pt.1: Keeping only vegetarian dishes..." crlf)	
                              (bind ?*firsts* (filtrar-single-por-group ?*firsts* get-DishType Vegan Vegetarian) )
                              (bind ?*seconds* (filtrar-single-por-group ?*seconds* get-DishType Vegan Vegetarian) )
                              (bind ?*desserts* (filtrar-single-por-group ?*desserts* get-DishType Vegan Vegetarian) )
			       
  ) 
  (if (eq ?v vegan) then
			      (printout t "DEBUG: Refinement pt.1: Keeping only vegan dishes..." crlf)	
                              (bind ?*firsts* (filtrar-single-por ?*firsts* get-DishType Vegan ) )
                              (bind ?*seconds* (filtrar-single-por ?*seconds* get-DishType Vegan) )
                              (bind ?*desserts* (filtrar-single-por ?*desserts* get-DishType Vegan) )
  ) 
  

  
  (if (eq  (is-list-empty ?*firsts*) TRUE) then (printout t "Refinement (Vegan-Vegetarian) - no more firsts... FAIL" crlf)(halt))
  (if (eq  (is-list-empty ?*seconds*) TRUE) then (printout t "Refinement (Vegan-Vegetarian)- no more seconds... FAIL" crlf) (halt))	
  (if  (eq  (is-list-empty ?*desserts*) TRUE) then (printout t "Refinement (Vegan-Vegetarian)- no more desserts... FAIL" crlf) (halt))	

  (assert (vegan-vegetarian-is-refined))
)

(defrule refinement-persons ""
  (not(persons-is-refined))
  =>
	(bind ?*seconds* (keep-plates-for-more-than ?*seconds* ?*guests*))
	(bind ?*firsts* (keep-plates-for-more-than ?*firsts* ?*guests*))
	(bind ?*desserts* (keep-plates-for-more-than ?*desserts* ?*guests*))
	(if (eq (is-list-empty ?*firsts*) TRUE) then (fail-with-message "Refinement (guests) - no more firsts..." ))
	(if (eq (is-list-empty ?*seconds*) TRUE) then (fail-with-message "Refinement (guests) - no more seconds" ))	
	(if (eq (is-list-empty ?*desserts*) TRUE) then (fail-with-message "Refinement (guests) - no more desserts" ))	
  (assert (persons-is-refined))
)


(defrule create-solution-menu "" ;;here, add the possiblility to create menus more expensive
	(not (menus-created))
	(vegan-vegetarian-is-refined)
	(persons-is-refined)
	(target-event (budget-per-person ?bud))
	=>
	(bind ?*firsts* (create$ ?*firsts*))
	(bind ?*seconds*(create$ ?*seconds*))
	(bind ?*desserts*(create$ ?*desserts*))
		
	(printout t "Creating menus. Dishes disposibles: " crlf)
		
	(printout t "DEBUG: Firsts" crlf)	
	(print-plates-list ?*firsts*)
	(printout t "DEBUG: Sconds" crlf)	
	(print-plates-list ?*seconds*)
	(printout t "DEBUG: Desserts" crlf)	
	(print-plates-list ?*desserts*)

 
	(bind ?cheapest-not-found TRUE)
	(while (and (neq ?*seconds* FALSE) (eq ?cheapest-not-found TRUE)) do
		(bind ?cheapest-not-found FALSE)	
		(bind ?list ?*seconds*)
		(bind ?list (create$ ?list))
		;(printout t "Selecting 2nd" crlf)
		(bind ?min (minimum-slot ?list get-DishPrice (nth$ 1 ?list)))

		(bind ?possiblefirsts ?*firsts*)
		(bind ?possiblefirsts (eliminar-incompatible-dishes ?possiblefirsts get-IncompatibilityW2 ?min))
		(bind ?cheapest-not-found (is-list-empty ?possiblefirsts))
		(if (eq ?cheapest-not-found TRUE) then (delete-member$ ?*seconds* ?min) else
		;(printout t "Selecting 1st" crlf)
		(bind ?possiblefirsts (create$ ?possiblefirsts))
		(bind ?min1 (minimum-slot ?possiblefirsts get-DishPrice (nth$ 1 ?possiblefirsts)))
		
		(bind ?possibledesserts ?*desserts*)
		(bind ?possibledesserts (eliminar-incompatible-dishes ?possibledesserts get-IncompatibilityDW2 ?min))
		(bind ?cheapest-not-found (is-list-empty ?possibledesserts))

		(if (eq ?cheapest-not-found TRUE) then (delete-member$ ?*seconds* ?min) else
		;(printout t "Selecting dessert" crlf)
		(bind ?possibledesserts (create$ ?possibledesserts))
		(bind ?minDe (minimum-slot ?possibledesserts get-DishPrice (nth$ 1 ?possibledesserts)))
	
			
		(bind ?minDr (minimum-slot ?*drinks* get-DrinkPrice (nth$ 1 ?*drinks*)))
		
		(bind ?cheapest (make-instance [cheapest-menu] of Menu))		
		(send ?cheapest put-FirstDish ?min1 )

		(send ?cheapest put-SecondDish ?min) 
		(send ?cheapest put-DessertDish ?minDe)
		(send ?cheapest put-MenuDrink (create$ ?minDr))
		)
		)
	)

	(bind ?most-expensive-not-found TRUE)
	(while (and (neq ?*seconds* FALSE) (eq ?most-expensive-not-found TRUE)) do
		(bind ?most-expensive-not-found FALSE)	
		(bind ?list ?*seconds*)
		(bind ?list (create$ ?list))
		;(printout t "Selecting 2nd" crlf)
		(bind ?max (maximum-slot ?list get-DishPrice (nth$ 1 ?list)))

		(bind ?possiblefirsts ?*firsts*)
		(bind ?possiblefirsts (eliminar-incompatible-dishes ?possiblefirsts get-IncompatibilityW2 ?max))
		(bind ?most-expensive-not-found (is-list-empty ?possiblefirsts))
		(if (eq ?most-expensive-not-found TRUE) then (delete-member$ ?*seconds* ?max) else
		;(printout t "Selecting 1st" crlf)
		(bind ?possiblefirsts (create$ ?possiblefirsts))
		(bind ?max1 (maximum-slot ?possiblefirsts get-DishPrice (nth$ 1 ?possiblefirsts)))
		
		(bind ?possibledesserts ?*desserts*)
		(bind ?possibledesserts (eliminar-incompatible-dishes ?possibledesserts get-IncompatibilityDW2 ?max))
		(bind ?most-expensive-not-found (is-list-empty ?possibledesserts))

		(if (eq ?most-expensive-not-found TRUE) then (delete-member$ ?*seconds* ?max) else
		;(printout t "Selecting dessert" crlf)
		(bind ?possibledesserts (create$ ?possibledesserts))
		(bind ?maxDe (maximum-slot ?possibledesserts get-DishPrice (nth$ 1 ?possibledesserts)))
	
			
		(bind ?maxDr (maximum-slot ?*drinks* get-DrinkPrice (nth$ 1 ?*drinks*)))
		
		(bind ?most-expensive (make-instance [most-expensive-menu] of Menu))		
		(send ?most-expensive put-FirstDish ?max1 )

		(send ?most-expensive put-SecondDish ?max) 
		(send ?most-expensive put-DessertDish ?maxDe)
		(send ?most-expensive put-MenuDrink (create$ ?maxDr))
		)
		)
	)

	
	(if (or (eq ?cheapest-not-found TRUE)(eq ?most-expensive-not-found TRUE)) then (fail-with-message "Your requierments are too restrictive (or our instances are currently 
						      very few. Please try again with other requirements"))

 	(bind ?minprice	(send ?cheapest get-Price))
	(bind ?maxprice (send ?most-expensive get-Price))
	(if (> ?maxprice ?bud) then (bind ?maxprice ?bud))

	(printout t ?minprice crlf)	
	(printout t ?maxprice crlf)	
	(bind ?found1 FALSE)
	(bind ?found2 FALSE)
	(bind ?found3 FALSE)
 
		
	(if (> ?minprice ?bud) then (printout t "FAIL: Your budget is too low for what you are asking.. Please try with another." crlf)(halt) else
	(if (> (+ ?minprice 5) ?bud) then (printout t "Budget is very restrictive, but let's see if we can find something for you... Perhaps you have to wait.") )
	(bind ?loops 0)	

	(while (and (or (not ?found1)(not ?found2)(not ?found3)) (not (> ?loops 1000))) do
	 (bind ?continue FALSE)
	 (bind ?loops (+ ?loops 1)) 
	 (bind ?list ?*seconds*)
	 (bind ?min (random-slot ?list))
	 (bind ?possiblefirsts ?*firsts*)
	 (bind ?possiblefirsts (eliminar-incompatible-dishes ?possiblefirsts get-IncompatibilityW2 ?min))
	 (if (eq (is-list-empty ?possiblefirsts) TRUE) then (bind ?nofirsts TRUE) else (bind ?nofirsts FALSE))
	 (if (eq ?nofirsts FALSE) then 
	  (bind ?possiblefirsts (create$ ?possiblefirsts))
          (bind ?min1 (random-slot ?possiblefirsts))
 		
	  (bind ?possibledesserts ?*desserts*)
	  (bind ?possibledesserts (eliminar-incompatible-dishes ?possibledesserts get-IncompatibilityDW2 ?min))
	  (if (eq (is-list-empty ?possibledesserts) TRUE) then (bind ?nodesserts TRUE) else (bind ?nodesserts FALSE))
	  (if (neq ?nodesserts TRUE) then  
	   (bind ?possibledesserts (create$ ?possibledesserts))
	   (bind ?minDe (random-slot ?possibledesserts))
	
	   (bind ?minDr (random-slot ?*drinks*))
	
           (bind ?menu (make-instance [random-menu] of Menu))		
	   (send ?menu put-FirstDish ?min1 )
	   (send ?menu put-SecondDish ?min) 
	   (send ?menu put-DessertDish ?minDe)
           (send ?menu put-MenuDrink (create$ ?minDr))
	   (bind ?menuprice (send ?menu get-Price))

	   (if (and (> ?bud ?menuprice) (< ?menuprice (+ ?minprice (* 0.30 (- ?maxprice ?minprice))))) then
		(if (not ?found1) then

	  	;this is considered cheap
	  	(bind ?menu1 (make-instance [menu1] of Menu))
	 	(active-duplicate-instance ?menu to ?menu1)	
		(bind ?found1 TRUE))
	   else (if (and (> ?bud ?menuprice)(not ?found3)(> ?menuprice (+ ?minprice  (* 0.80 (- ?maxprice ?minprice))))) then
		;this is considered expensive
		(if (not ?found3) then
		(bind ?menu3 (make-instance [menu3] of Menu))
	 	(active-duplicate-instance ?menu to ?menu3)	
		(bind ?thirdmenu ?menu)
		(bind ?found3 TRUE)
		)
	   else (if (and (> ?bud ?menuprice)(not ?found2)) then
		(bind ?menu2 (make-instance [menu2] of Menu))
	 	(active-duplicate-instance ?menu to ?menu2)	
		(bind ?secondmenu ?menu)
		(bind ?found2 TRUE))
	  ))
	  ))
          )
	
	  (if (or (not ?found1)(not ?found2)(not ?found3)) then (fail-with-message "We could not create 3 menus with the given restrictions, please try again with more loose ones. However, we print any suggestions that we might have been able to find."))

	  (printout t "********************************************************************************************" crlf)	
	  (printout t "*****************************************RESULTS********************************************" crlf)	

	  (printout t "****************************************OPTION 1: ECONOMY MENU*******************************" crlf)	
	  (if (eq ?found1 TRUE) then
	  (send ?menu1 printInfo)	
	  )	

	  (printout t "****************************************OPTION 2: GOLD MENU*********************************" crlf)	
	
	  (if (eq ?found2 TRUE) then
	  (send ?menu2 printInfo)		
	  )
	  (printout t "****************************************OPTION 3: PLATINUM MENU***************************" crlf)	
	  (if (eq ?found3 TRUE) then
	  (send ?menu3 printInfo)		
	  )
	  (assert (menus-created))
	)

) 

;overly simplified first dish selection rule.
;careful, we need to have instances:

;;; When we have a final solution, we print it
(defrule print-built-solution
    (declare (salience -1))
=>
    (focus module-print-recommendation)
)
;;;*******************************
;;;* MODULE PRINT RECOMMENDATION *
;;;*******************************

(defmodule module-print-recommendation "Module to print our recommendation"
    (import MAIN ?ALL)
    (import module-event-info-gathering ?ALL)
    (import module-menu-info-gathering ?ALL)
    (import module-build-abstract-solution ?ALL)
    (import module-refine-solution ?ALL)
    (export ?ALL)
)

(defrule announce-dishes ""
 (menus-created)
 =>
 (if (yes-or-no-p "Are you satisfied with the menus suggested? (yes/no)") then (printout t "Thank you for using Super Duper Guacamole!" crlf) else (printout t "We're sorry. Please consider trying again with the different input (or even with the same :) )" crlf))
 (halt))
