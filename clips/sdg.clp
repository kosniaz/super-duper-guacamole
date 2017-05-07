;begin


;;**********************
;;* message handlers
;;**********************
(defmodule MAIN "Main"
(export ?ALL))

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

(defrule determine-epoch "" 
   (not (isEpoch ?))
   (entered-state "info-gathering")
   =>
   (bind ?res (ask-question "In what season of the year are you planning to have the event? (spring/summer/autumn/winter)" spring summer autumn winter))
   (assert (isEpoch ?res))
)

(defrule determine-event-type "" 
   (not (isType ?))
   (entered-state "info-gathering")
   =>
   (bind ?res (ask-question "What kind of event are you planning? (family/conference) " family congress))
   (assert (isType ?res))
)

(defrule determine-number "" 
   (not (numberOfPeople ?))
   (entered-state "info-gathering")
   =>
   (bind ?res (ask-question "How many people are we expecting? (few/average/many) " few average many))
   (assert (numberOfPeople ?res))
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
       (assert (isVeganVegetarian no))))

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
   (case vegetarian then (send ?x put-FirstDish (find-instance ((?ins FirstDish)) (eq ?ins:isVegetarian TRUE) )) )
   (case no then (send ?x put-FirstDish (find-instance ((?ins FirstDish)) (eq ?ins:isVegetarian FALSE))))
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
  
