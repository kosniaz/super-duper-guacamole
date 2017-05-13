
;Te gusta la alta cocina?
;Que estilo te gusta?
;preguntas tipo test de psicología (con respuestas de 1 a 10)
; Sat May 13 14:33:02 CEST 2017
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
		(allowed-values Cow Pork Fruit Vegetable Fish Dairy)
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
	(single-slot FirstDish
;+		(comment "First plate of the menu;starter, appetizer")
		(type INSTANCE)
;+		(allowed-classes First)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot DishCompatibility
;+		(comment "Relacion que describe la compatibilidad de las bebidas con los platos")
		(type INSTANCE)
;+		(allowed-classes Dish)
;+		(cardinality 0 1)
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
	(single-slot Compatibility
		(type INSTANCE)
;+		(allowed-classes Dish)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Friendliness
		(type SYMBOL)
		(allowed-values Low High Average)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot DrinkType
		(type SYMBOL)
		(allowed-values Water Wine Sake Refreshment Juice)
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
		(allowed-values Vegetarian Vegan Fruitarian)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot RicoRicoProject_Class10005
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot MaxNum
		(type INTEGER)
;+		(cardinality 0 1)
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
	(single-slot DishType
		(type SYMBOL)
		(allowed-values Vegetarian Vegan Fruitarian)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Compatibility
		(type INSTANCE)
;+		(allowed-classes Dish)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Friendliness
		(type SYMBOL)
		(allowed-values Low High Average)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass First
	(is-a Dish)
	(role concrete))

(defclass Second
	(is-a Dish)
	(role concrete))

(defclass Dessert
	(is-a Dish)
	(role concrete))

(defclass Drink "Describe las babidas"
	(is-a USER)
	(role concrete)
	(single-slot DrinkType
		(type SYMBOL)
		(allowed-values Water Wine Sake Refreshment Juice)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot DrinkPrice
		(type FLOAT)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot DishCompatibility
;+		(comment "Relacion que describe la compatibilidad de las bebidas con los platos")
		(type INSTANCE)
;+		(allowed-classes Dish)
;+		(cardinality 0 1)
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
		(allowed-values Cow Pork Fruit Vegetable Fish Dairy)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot IsInDish
		(type INSTANCE)
;+		(allowed-classes Dish)
		(create-accessor read-write)))

(definstances menu
([RicoRicoProject_Class10000] of  First

	(DishInfo "Good one")
	(DishName "Cesar Salad")
	(DishPrice 2.0)
	(Friendliness High))

([RicoRicoProject_Class10001] of  First

	(DishInfo "Sooo simple")
	(DishName "Simple Salad")
	(DishPrice 1.0)
	(DishType Vegetarian)
	(Friendliness High))

([RicoRicoProject_Class20000] of  First

	(Compatibility [RicoRicoProject_Class10001])
	(DishInfo "Pasta de origen Romana, en Italia, con huevos, bacon y  Parmigiano")
	(DishName "Pasta Alla Carbonara")
	(DishPrice 12.0)
	(Friendliness High)
	(Style Classic))

([RicoRicoProject_Class36] of  Ingredient

	(IngredientName "Egg")
	(IngredientType Dairy)
	(IsInDish [RicoRicoProject_Class20000])
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class37] of  Ingredient

	(IngredientName "Bacon")
	(IngredientType Pork)
	(IsInDish [RicoRicoProject_Class20000])
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class38] of  Ingredient

	(IngredientName "Black Pepper")
	(IsInDish [RicoRicoProject_Class20000])
	(Season Winter Summer Autumn Spring))

([RicoRicoProject_Class39] of  Ingredient

	(IngredientName "Parmigiano Reggiano")
	(IngredientType Dairy)
	(IsInDish [RicoRicoProject_Class20000])
	(Season Winter Summer Spring Autumn))

([RicoRicoProject_Class40] of  Ingredient

	(IngredientName "Pasta")
	(IsInDish [RicoRicoProject_Class20000])
	(Season Winter Summer Spring Autumn))
)


(defmodule MAIN ""
 (export ?ALL)
)

;;****************
;;* DEFFUNCTIONS *
;;****************

;; The following functions are used to parse the users' replies to questions.

(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
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
    (format t "¿%s? [%d, %d] " ?pregunta ?rangini ?rangfi)
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

(defrule menus-are-ready ""
   (menus-ready)
   ?oldstate <- (entered-state "info-gathering")
   =>
   (retract ?oldstate)
   (assert (entered-state "creating-menu")))
    

(defrule system-fail ""
   (declare (salience -10))
   (entered-state "info-gathering")
   ;(not (entered-state "done"))
   =>
   (assert (the-system-has-failed)))

(defrule system-success ""
   (entered-state "done")
   =>
   (assert (success)))


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
  (focus module-event-info-gathering)
)

;;print result:
(defrule print-done-message " "
  (declare (salience 10))
  (success)
  =>
  (printout t crlf crlf)
  (printout t "Thank you for the information, the system will now produce 3 ideal menus!")
  (printout t crlf crlf)
  (halt))


;(defrule print-menus ""
;  (declare (salience 10))
;  (success)
;  (menu-gold ?gold)
;  (menu-silver ?silver)
;  (menu-bronze ?bronze)
;  =>
;  (printout t crlf crlf)
;  (printout t "Suggested Menus (in order G-S-B):")
;  (printout t crlf crlf)
;  (format t " %s%n%n%n" ?gold)
;  (format t " %s%n%n%n" ?silver)
;  (format t " %s%n%n%n" ?bronze))

(defrule print-system-fail ""
   (declare (salience 10))
   (the-system-has-failed)
   =>
  (printout t crlf crlf)
  (printout t "We're terribly sorry, we could not find a suitable solution!")
  (printout t crlf crlf)
  (halt))
  

;;;*************
;;;* TEMPLATES *
;;;*************
(deftemplate target-event "Event for which the recommendation shall be done"
    (slot type)
    (slot subtype)
    (slot guests)
    (slot season)
    (slot children)
)

(deftemplate menu-restrictions "Event for which the recommendation shall be done"
    (slot isVeganVegetarian)
    (slot experimental)
    (slot gourmet)

)

(deftemplate abstract-info
	(slot wants-to-impress)
 	(slot  guests )
 	(slot  children)
	(slot  season )
	(slot  experimental )
	(slot  gourmet )
)

(deftemplate abstract-filters
	(slot menu-is-gourmet ) 
	(slot menu-is-experimental  ) 
	(slot menu-is-kid-friendly ) 
	(slot menu-is-of-season ) 
	(slot menu-has-guests ) 
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
        (type unknown)
        (season unknown)
	(guests unknown)
	(subtype unknown)
        (children unknown)
    )

    (menu-restrictions 
	(isVeganVegetarian unknown)
        (experimental unknown)
 	(gourmet unknown)
    )

    (abstract-info 
 	(wants-to-impress unknown)
 	(guests unknown)
 	(children unknown)
	(season unknown)
	(experimental unknown)
	(gourmet unknown)
    )

    (abstract-filters
	(menu-is-gourmet unknown)
	(menu-is-experimental  unknown)
	(menu-is-kid-friendly unknown)
	(menu-is-of-season unknown)
	(menu-has-guests unknown)
    )
)

;;;***************
;;;* QUERY RULES *
;;;***************



;;; Get the season in which the event is going to be done
(defrule determine-event-season ""
    (not (season-determined))
    ?e <-(target-event (season unknown))
=>
    (bind ?res (ask-question "In what season of the year are you planning to have the event? (spring/summer/autumn/winter)" spring summer autumn winter))
    (assert (season-determined))
    (modify ?e (season ?res))
)

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
    (bind ?res (ask-integer-question "How many people are we expecting? (Range of people between 1 and 100000)" 1 100000))
    (assert (guests-determined))
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
	(bind ?res (ask-question "How many children are coming to the event? (none/few/medium/many)" none few medium many))
	(assert (determined-children))
	(modify ?e (children ?res))
)

;;;*****************************************************************************************
;;;* More specific information for each type of event may be gathered in the final version *
;;;*****************************************************************************************


;;; Once all data about the event is gatheredetermined-childrend
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
    ?ex <- (menu-restrictions (experimental unknown))
   =>
   (bind ?res (ask-question "Would you like to taste something experimental? " yes no))
   (modify ?ex (experimental ?res))
)

;kosmas: possible question: are the guests good friends of event organizer))


(defrule determine-vegan ""
   (not (isVeganVegeterian ?))
   =>
   (if (yes-or-no-p "Are you vegetarian (yes/no)? ") 
       then 
       (if (yes-or-no-p "Are you vegan too (yes/no)? ")
           then (assert (isVeganVegeterian vegan))
           else (assert (isVeganVegetarian vegetarian)))
       else 
       (assert (isVeganVegetarian no)))
)



;;; Once all data about the menu is gathered
(defrule start-dish-questions
    (declare (salience -1))
=>
    (focus module-dish-info-gathering)
)

;;;******************************
;;;* MODULE DISH INFO GATHERING *
;;;******************************

(defmodule module-dish-info-gathering "Module to get specific information regarding the dishes"
    (import MAIN ?ALL)
    ;(import module-event-info-gathering ?ALL)
    ;(import module-menu-info-gathering ?ALL)
    (export ?ALL)
)


;;; Once all data about the dishes is gathered we can start to build a solution that will be refined later
(defrule build-abstract-solution
    (declare (salience -1))
=>
    (focus module-convert-to-abstract)
)


;;;******************************
;;;* MODULE CONCRETE-TO-ABSTRACT *
;;;******************************

(defmodule module-convert-to-abstract "Module to create a stractured fact that contains the abstract data"
    (import MAIN ?ALL)
    (import module-event-info-gathering ?ALL)
    (import module-menu-info-gathering ?ALL)
    (import module-dish-info-gathering ?ALL)
    (export ?ALL)
)

;(deftemplate target-event "Event for which the recommendation shall be done"
  ;  (slot type)
  ;  (slot subtype)
  ;  (slot guests)
  ;  (slot season)
 ;   (slot children-percentage)
;)


;    (abstract-info 
;	(wants-to-impress unknown)
; 	(guests unknown)
; 	(children unknown)
;	(season unknown)
;	(experimental unknown)
;	(gourmet unknown)
;    )

;Kosmas:these rule are a cheap substitute of a Bayes Network. If there is time, we will properly implement one.
;Rule 1: if (wants-to-impress=a lot and experimental=yes)-> only serve Experimental Food
;Rule 2: if (wants-to-impress=a lot and gourmet=yes)-> only serve Gourmet Food
;Rule 3: if (wants-to-impress=a bit and experimental=yes)-> one dish is Experimental 
;Rule 4: if (wants-to-impress=a bit and gourmet=yes)-> one dish is Gourmet 
;Rule 5: if (wants-to-impress=a bit) -> one dish is to Gourmet or Experimental
;Rules 6-9 : if (season = x (one of Winter, Summer, Autumn, Spring) -> only serve food that is fresh on season x
;Rule 10 : if (children=many) -> one dish has to be highly friendly
;Rule 11:  if (children=medium) or (children=few)-> one dish has to be averagely friendly

;Kosmas:here we determine the value of the abstract data slot wants-to-impress: 
;the use of many rules is not necessary, it can be done in one. 

(defrule wants-to-impress ""
     (not (determined-wants-to-impress))
     ?x <- (abstract-info (wants-to-impress unknown))
     (target-event (type congress)) 
   =>
    (assert (determined-wants-to-impress))
    (modify ?x (wants-to-impress a-lot))
)
    
(defrule wants-to-impress-a-little 
     (not (determined-wants-to-impress))
     ?x <- (abstract-info (wants-to-impress unknown))
     (or (target-event (subtype baptism)) (target-event (subtype wedding)))
   =>
    (assert (determined-wants-to-impress))
    (modify ?x (wants-to-impress a-bit))
)

(defrule doesnt-want-to-impress
     (not (determined-wants-to-impress))
     ?x <- (abstract-info (wants-to-impress unknown))
     (or (target-event (subtype communion)))
   =>
    (assert (determined-wants-to-impress))
    (modify ?x (wants-to-impress no))
)
;Kosmas: I put here the conversion of the number of guests to a discrete value.
(defrule abstract-guests ""
     (not (determined-abstract-guests))
     ?x <- (abstract-info (guests unknown))
     (target-event (guests ?g))
    =>
    (assert (determined-abstract-guests))
    (if (< ?g 100) then
        (printout t "STORY: You hear a voice: Not many people in this party.. " crlf)
        (modify ?x (guests few))
    else
        (if (< ?g 300) then
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

(defrule build-abstract-solution
    (declare (salience -1))
=>
    (focus module-build-abstract-solution)
)

;;;****************************
;;;* MODULE ABSTRACT SOLUTION *
;;;****************************

(defmodule module-build-abstract-solution "Module to build an abstract solution based on the abstract data extracted from the input"
    (import MAIN ?ALL)
    (import module-event-info-gathering ?ALL)
    (import module-menu-info-gathering ?ALL)
    (import module-dish-info-gathering ?ALL)
    (import module-convert-to-abstract ?ALL)
    (export ?ALL)
)



;this rule is to be executed when there is no more information to be gathered

(defrule create-inicial-instance ""
   (declare (salience 10))
  =>
   (make-instance [p] of Menu)
defmodule module-refine-solution "Module to refine and build a final recommendation"
    (import MAIN ?ALL)
    (import module-event-info-gathering ?ALL)
    (import module-menu-info-gathering ?ALL)
    (import module-dish-info-gathering ?ALL)
    (import module-build-abstract-solution ?ALL)
    (export ?ALL)
)

;overly simplified first dish selection rule.
;careful, we need to have instances:
(defrule select-first-dish ""
  ?x <- (object (is-a Menu))
  (isVeganVegetarian ?v)
  =>
  (switch ?v
   (case vegan then (send ?x put-FirstDish (find-instance ((?ins First)) (eq ?ins:DishType Vegan) )) )
   (case vegetarian then (send ?x put-FirstDish (find-instance ((?ins First)) (eq ?ins:DishType Vegetarian) )) )
   (case no then (send ?x put-FirstDish (find-instance ((?ins First)) (neq ?ins:DishType ruitarian))))
   )
   (assert (dishes-selected))
)

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
    (import module-dish-info-gathering ?ALL)
    (import module-build-abstract-solution ?ALL)
    (import module-refine-solution ?ALL)
    (export ?ALL)
)

(defrule announce-dishes ""
  ?x <- (object (is-a Menu))
 =>
 (send ?x printName)
 (halt))

;;;;;;;;;;;;; Message-handlers
