;begin


;;**********************
;;* message handlers
;;**********************
(defmodule MAIN
    (export ?ALL)
)

(defmessage-handler Menu printName primary ()
  (printout t "First Dish: " crlf)
  (send ?self:FirstDish printName)
  (printout t crlf)
)

(defmessage-handler Dish printName primary ()
  (printout t "Dish Name: ")
  (bind ?name ?self:DishName)
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
  (focus module-info-gathering)
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
        (type unkown)
        (subtype unknown)
        (guests unkown)
        (season unknown)
    )
)


;;;***************
;;;* QUERY RULES *
;;;***************

;;; Get the season in which the event is going to be done
(defrule determine-event-season
    ?e <-(target-event (season unkown))
=>
    (bind ?res (ask-question "In what season of the year are you planning to have the event? (spring/summer/autumn/winter)" spring summer autumn winter))
    (modify ?e (season ?res))
)

;;; Get the generic type of the event
(defrule determine-event-type
    ?e <-(target-event (type unkown))
=>
    (bind ?res (ask-question "What kind of event are you planning? (family/congress) " family congress))
    (modify ?e (type ?res))
)

;;; Get the amount of guests that will assist to the event, this will classify the amount in one of three categories: few/medium/many
(defrule determine-event-guests
    ?e <-(target-event (guests unkown))
=>
    (bind ?res (ask-integer-question "How many people are we expecting? (Range of people between 1 and 100000)" 1 100000))
    (if (< ?res 100) then
        (modify ?e (guests few))
    else
        (if (< ?res 300) then
            (modify ?e (guests medium))
        else
            (modify ?e (guests many))
        )
    )
    (modify ?e (guests ?res))
)

;;; Get the "subtype" of event which depends on the type, this is for Family
(defrule determine-event-subtype-family
    ?e <- (target-event (type family) (subtype unknown))
=>
    (bind ?res (ask-question "What family event are you organizing? (wedding/baptism/communion)" wedding baptism communion))
    (modify ?e (subtype ?res))
)

;;; Subtype definition for Congress
(defrule determine-event-subtype-congress
    ?e <- (target-event (type congress) (subtype unknown))
=>
    (bind ?res (ask-question "Is it going to be a lunch or a dinner?" lunch dinner))
    (modify ?e (subtype ?res))
)

;;;*****************************************************************************************
;;;* More specific information for each type of event may be gathered in the final version *
;;;*****************************************************************************************


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


(defrule determine-expermental "" 
   (not (sibarita ?))
   (entered-state "info-gathering")
   =>
   (bind ?res (ask-question "Would you like to taste something experimental or exotic (yes/no)? " yes no))
   (assert (sibarita ?res))
)


(defrule determine-vegan ""
   (not (isVeganVegeterian ?))
   (entered-state "info-gathering")
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
    (import module-event-info-gathering ?ALL)
    (import module-menu-info-gathering ?ALL)
    (export ?ALL)
)


;;; Once all data about the dishes is gathered we can start to build a solution that will be refined later
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
    (export ?ALL)
)


(defrule determine-firstplate ""
    (not (first-plate ?))
    (entered-state "info-gathering")
   =>
  (if (yes-or-no-p "Is salad desired? (yes/no)")
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


(defrule create-inicial-instance ""
   (declare (salience 10))
   (entered-state "creating-menu")
  =>
   (make-instance [p] of Menu)
)





;;; Once an abstract model is ready we go on to the refinement
(defrule refine-solution
    (declare (salience -1))
=>
    (focus module-refine-solution)
)


;;;*********************
;;;* MODULE REFINEMENT *
;;;*********************

(defmodule module-refine-solution "Module to refine and build a final recommendation"
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
  (entered-state "creating-menu")
  (isVeganVegetarian ?v)
  =>
  (switch ?v
   (case vegan then (assert (the-system-has-failed)))
   (case vegetarian then (send ?x put-FirstDish (find-instance ((?ins FirstDish)) (eq ?ins:isVegetarian TRUE) )) )
   (case no then (send ?x put-FirstDish (find-instance ((?ins FirstDish)) (eq ?ins:isVegetarian FALSE))))
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

(defmodule module-refine-solution "Module to refine and build a final recommendation"
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
  (entered-state "creating-menu")
  (dishes-selected)

 =>
 (send ?x printName)
 (halt))


;;;;;;;;;;;;; Message-handlers



