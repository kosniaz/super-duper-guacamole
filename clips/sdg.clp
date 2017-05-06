
; Sat May 06 19:45:29 CEST 2017
; 
;+ (version "3.4.8")
;+ (build "Build 629")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot Disponibility
		(type INSTANCE)
;+		(allowed-classes Plate)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Recomendation
;+		(comment "Descrivìbe el menu que se propone para el evento indicado")
		(type INSTANCE)
;+		(allowed-classes Event)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot N%C2%B0+commensales
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Compatibility
		(type INSTANCE)
;+		(allowed-classes Plate)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot PlateCompatibility
;+		(comment "Relacion que describe la compatibilidad de las bebidas con los platos")
		(type INSTANCE)
;+		(allowed-classes Plate)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot isVegetarian
;+		(comment "True if this dish is vegetarian")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot DrinksType
		(type SYMBOL)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot DrinkPrice
		(type FLOAT)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot First
;+		(comment "First plate of the menu;starter, appetizer")
		(type INSTANCE)
;+		(allowed-classes Plate)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot DrinkPerDish
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot RicoRicoProject_Class0
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot IngredientName
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot PlateType
		(type SYMBOL)
		(allowed-values Vegetarian)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Period
		(type INSTANCE)
;+		(allowed-classes Event)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot IngredientsType
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot IsInPlate
		(type INSTANCE)
;+		(allowed-classes Plate)
		(create-accessor read-write))
	(single-slot DrinkName
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot RicoRicoProject_Class27
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Tipe
		(type SYMBOL)
		(allowed-values Marriage Baptisme Communion)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot MenuCompatibility
;+		(comment "En el caso que se pida una unica bebida por todo el menu")
		(type INSTANCE)
;+		(allowed-classes Menu)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot PlatePrice
		(type FLOAT)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Name
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Seasons
		(type SYMBOL)
		(allowed-values Spring Summer Autumn Winter)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Style
		(type SYMBOL)
		(allowed-values Classic Modern Regional Gourmet)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Compose
		(type INSTANCE)
;+		(allowed-classes Menu)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Event "Clase que describe los eventos"
	(is-a USER)
	(role concrete)
	(single-slot N%C2%B0+commensales
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Family
	(is-a Event)
	(role concrete)
	(single-slot Tipe
		(type SYMBOL)
		(allowed-values Marriage Baptisme Communion)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Congresses "Eventos de tipo congreso"
	(is-a Event)
	(role concrete))

(defclass Menu "Clase que describe los menus"
	(is-a USER)
	(role concrete)
	(single-slot First
;+		(comment "First plate of the menu;starter, appetizer")
		(type INSTANCE)
;+		(allowed-classes Plate)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Recomendation
;+		(comment "Descrivìbe el menu que se propone para el evento indicado")
		(type INSTANCE)
;+		(allowed-classes Event)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot DrinkPerDish
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Plate "Describe los platos"
	(is-a USER)
	(role concrete)
	(single-slot PlatePrice
		(type FLOAT)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Name
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Style
		(type SYMBOL)
		(allowed-values Classic Modern Regional Gourmet)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot isVegetarian
;+		(comment "True if this dish is vegetarian")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Compatibility
		(type INSTANCE)
;+		(allowed-classes Plate)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Compose
		(type INSTANCE)
;+		(allowed-classes Menu)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot PlateType
		(type SYMBOL)
		(allowed-values Vegetarian)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Drinks "Describe las babidas"
	(is-a USER)
	(role concrete)
	(single-slot DrinkName
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot DrinksType
		(type SYMBOL)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot PlateCompatibility
;+		(comment "Relacion que describe la compatibilidad de las bebidas con los platos")
		(type INSTANCE)
;+		(allowed-classes Plate)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot DrinkPrice
		(type FLOAT)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot MenuCompatibility
;+		(comment "En el caso que se pida una unica bebida por todo el menu")
		(type INSTANCE)
;+		(allowed-classes Menu)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Ingredients
	(is-a USER)
	(role concrete)
	(multislot IsInPlate
		(type INSTANCE)
;+		(allowed-classes Plate)
		(create-accessor read-write))
	(single-slot IngredientsType
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot IngredientName
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Epoch
	(is-a USER)
	(role concrete)
	(single-slot Seasons
		(type SYMBOL)
		(allowed-values Spring Summer Autumn Winter)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Disponibility
		(type INSTANCE)
;+		(allowed-classes Plate)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Period
		(type INSTANCE)
;+		(allowed-classes Event)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(definstances sdg
([RicoRicoProject_Class2] of  Plate

	(isVegetarian TRUE)
	(Name "Pasta_Al_rabiata")
	(PlatePrice 10.0)
	(Style Classic))

([RicoRicoProject_Class33] of  Plate

	(isVegetarian FALSE)
	(Name "Pasta Alla Carbonara")
	(PlatePrice 8.5)
	(Style Classic))

([RicoRicoProject_Class36] of  Ingredients

	(IngredientName "Egg")
	(IsInPlate [RicoRicoProject_Class33]))

([RicoRicoProject_Class37] of  Ingredients

	(IngredientName "Bacon")
	(IsInPlate [RicoRicoProject_Class33]))

([RicoRicoProject_Class38] of  Ingredients

	(IngredientName "Black Pepper")
	(IsInPlate [RicoRicoProject_Class33]))

([RicoRicoProject_Class39] of  Ingredients

	(IngredientName "Parmigiano")
	(IsInPlate [RicoRicoProject_Class33]))

([RicoRicoProject_Class40] of  Ingredients

	(IngredientName "Pasta")
	(IsInPlate [RicoRicoProject_Class33]))

)


;begin
(defmodule MAIN "Main"
(export ?ALL))

(defmessage-handler Menu printName primary ()
  (printout t "First Dish: " crlf)
  (send ?self:First printName)
  (printout t crlf)
)

(defmessage-handler Plate printName primary ()
  (printout t "Dish Name: ")
  (bind ?name ?self:Name)
  (printout t ?name) 
  (printout t crlf)
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

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-vegan ""
   (not (isVeganVegeterian ?))
   (entered-state "info-gathering")
   =>
   (if (yes-or-no-p "Are you vegetarian (yes/no)? ") 
       then 
       (if (yes-or-no-p "Are you vegan (yes/no)? ")
           then (assert (isVeganVegeterian vegan))
           else (assert (isVeganVegetarian vegetarian)))
       else 
       (assert (isVeganVegetarian no))))

(defrule determine-firstplate ""
    (not (first-plate ?))
    (entered-state "info-gathering")
   =>
  (if (yes-or-no-p "Is salad desired?")
    then
    (assert (first-plate salad))
  else 
    (assert (first-plate notsalad))))

;this rule is to be executed when there is no more information to be gathered
(defrule done-with-questions ""
   (declare (salience -2))
   (not (menus-ready))
  =>
   (assert (menus-ready)))







;;classic menu-creation!
;;we have to create instances of dishes. check
;;we have to create mechanism that receives "send" messages
;;we have to create mechanism that prints an instance of a class


;(defmodule classic-menu-creation "creating classic menu" 
; (import MAIN ?ALL)
; (export ?ALL)
;)

(defrule create-inicial-instance ""
   (declare (salience 10))
   (entered-state "creating-menu")
  =>
   (make-instance [p] of Menu)
)
;overly simplified first dish selection rule.
;careful, we need to have instances:
(defrule select-first-dish ""
  ?x <- (object (is-a Menu))
  (entered-state "creating-menu")
  (isVeganVegetarian ?v)
  =>
  (switch ?v
   (case vegan then (assert (the-system-has-failed)))
   (case vegetarian then (send ?x put-First (find-instance ((?ins Plate)) (eq ?ins:isVegetarian TRUE) )) )
   (case no then (send ?x put-First (find-instance ((?ins Plate)) (eq ?ins:isVegetarian FALSE))))
   )
   (assert (dishes-selected))
)

(defrule announce-dishes ""
  ?x <- (object (is-a Menu))
  (entered-state "creating-menu")
  (dishes-selected)
 =>
 (send ?x printName)
 (halt))


;;;;;;;;;;;;; Message-handlers



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
  (assert (entered-state "info-gathering")))

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
  
