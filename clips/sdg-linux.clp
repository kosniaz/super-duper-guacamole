;secondsTe gusta la alta cocina?
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
(defglobal ?*drinks* = FALSE )


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
        	
;(return-plates-of-season 
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


(deffunction filtrar-multi-por (?li ?sl ?const)
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

(deffunction imprime-todo (?v)
(if (> (length$ ?v) 0) then
(loop-for-count (?i 1 (length ?v))
(send (nth$ ?i ?v) print)
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
    (bind ?res (ask-integer-question "How many people are we expecting? (Range of people between 1 and 100000) " 1 100000))
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
        (printout t "DEBUG: You hear a voice \"Not many people in this party..\" " crlf)
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

;Kosmas:these rules are a cheap substitute of a Bayes Network. If there is time, we will properly implement one.
;Rule 1:  if (wants-to-impress=a lot and experimental)-> only serve Experimental Food
;Rule 3: if (wants-to-impress=a bit and experimental=yes)-> main dish is Experimental 
;Rule 4: if (wants-to-impress=a bit and gourmet=yes)-> main dish is Gourmet 
;Rule 5: if (wants-to-impress=a bit) -> main dish is to Gourmet or Experimental
;Rules 6-9 : if (season = x (one of Winter, Summer, Autumn, Spring) -> only serve food that is fresh on season x
;Rule 10 : if (children=many) -> main dish has to be highly friendly
;Rule 11:  if (children=medium) or (children=few)-> main dish has to be averagely friendly

(defmodule module-build-abstract-solution "Module to build an abstract solution based on the abstract data extracted from the input"
    (import MAIN ?ALL)
    (import module-event-info-gathering ?ALL)
    (import module-menu-info-gathering ?ALL)
    (import module-dish-info-gathering ?ALL)
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
	(bind ?*drinks* (find-all-instances ((?ins Drink)) TRUE))	
	(assert (data-structs-initialized))
)	

;Rule 1: if (wants-to-impress=a lot and experimental=yes)-> only serve Experimental Food
(defrule only-experimental  ""
	(abstract-info (wants-to-impress a-lot))
	(abstract-info (experimental yes))
	=>
	;plato 1 y plato 2 deben ser experimentales
	;hay que filtrar....
	(bind ?*seconds* (filtrar-multi-por ?*seconds* get-Style Experimental ))
	(bind ?*firsts*(filtrar-multi-por ?*firsts*    get-Style Experimental ))
	(if (eq ?*seconds* FALSE) then (printout t "Rule 1 - no more seconds" crlf) (halt))	
	(if (eq ?*firsts* FALSE) then (printout t "Rule 1 - no more firsts" crlf) (halt))	
	;(printout t "DEBUG: Only experimental second dishes:" crlf)
	;(imprime-todo ?*seconds*)
)
	

;Rule 3: if (wants-to-impress=a bit and experimental=yes)-> main dish is Experimental 
(defrule mainly-experimental ""
	(abstract-info (wants-to-impress a-bit))
	(abstract-info (experimental yes))
	=>
	(bind ?*seconds*(filtrar-multi-por ?*seconds* get-Style Experimental))
	(if (eq ?*seconds* FALSE) then (printout t "Rule 3 - no more seconds" crlf) (halt))	
)
;Rule 5: if (wants-to-impress=a bit) -> first dish is Experimental
(defrule a-bit-experimental ""
	(abstract-info (wants-to-impress a-bit))
	(abstract-info (experimental no))
	=>
	(bind ?*firsts*(filtrar-multi-por ?*firsts* get-Style Experimental))
	(if (eq (length$ ?*firsts*) 0) then (printout t "Rule 5 - no more firsts" crlf) (halt))	
)


;Rules 6-9 : if (season = x (one of Winter, Summer, Autumn, Spring) -> only serve food that is fresh on season x
(defrule season-is-x ""
	(abstract-info (season ?x))
	=>
	(switch ?x
	(case summer then (bind ?epoch Summer))
	(case winter then (bind ?epoch Winter))
	(case autumn then (bind ?epoch Autumn))
	(case spring then (bind ?epoch Spring))
	)
	(bind ?*firsts* (return-plates-of-season ?*firsts* ?epoch))
	(if (eq ?*firsts* FALSE) then (printout t "Rule 6 - no more firsts" crlf) (halt))	
	;(printout t "DEBUG: Only seasonal first dishes:" crlf)
	;(imprime-todo ?*firsts*)
	(bind ?*seconds* (return-plates-of-season ?*seconds* ?epoch))
	(if (eq ?*seconds* FALSE) then (printout t "Rule 6 - no more seconds" crlf) (halt))	
	;(printout t "DEBUG: Only seasonal second dishes:" crlf)
	;(imprime-todo ?*seconds*)
)

;Rule 10 : if (children=many) -> main dish has to be highly friendly
(defrule children-are-many ""
	(abstract-info (children many))
	=>
	(bind ?*seconds*(filtrar-single-por ?*seconds* get-Friendliness High))
	(if (eq ?*seconds* FALSE) then (printout t "Rule 10 - no more seconds" crlf) (halt))	
	;(printout t "DEBUG: Only children-friendly second dishes:" crlf)
	;(imprime-todo ?*seconds*)
)

;Rule 11:  if (children=medium) or (children=few)-> main dish has to be averagely friendly
(defrule children-are-medium ""
	(or (abstract-info (children medium)) (abstract-info (children few)))
	=>
	(bind ?*seconds*(filtrar-single-por-group ?*seconds* get-Friendliness Average High ))
	(if (eq ?*seconds* FALSE) then (printout t "Rule 11 - no more seconds" crlf) (halt))	
	;(printout t "DEBUG: Only children-friendly second dishes:" crlf)
	;(imprime-todo ?*seconds*)
)

(defrule print-abstract-results ""
	(declare (salience -1))
=>
	(printout t "DEBUG: Possible First Dishes, at the end of the heuristic selection:" crlf)
	(if (eq ?*firsts* FALSE) then (printout t "No firsts available." crlf)(halt)
	else (imprime-todo ?*firsts*))

	(printout t "DEBUG: Possible Second Dishes, at the end of the heuristic selection:" crlf)
	(if (eq ?*seconds* FALSE) then (printout t "No seconds available." crlf)(halt)
	else (imprime-todo ?*seconds*))
)

(defrule create-inicial-instance ""
   (declare (salience 10))
  =>
   (make-instance [p] of Menu)
)


;;; Once an abstract model is ready we go on to the refinement
(defrule refine-solution
    (declare (salience -2))
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
  (isVeganVegetarian ?v)
  =>
  (if (eq ?v vegetarian) then 
                              (bind ?li (find-all-instances ((?ins First)) (eq ?ins:DishType Vegetarian) ))
 		              (bind ?first (random-slot ?li))
                              (send ?x put-FirstDish ?first)
			      
  ) 
  (if (eq ?v vegan) then
                              (bind ?li (find-all-instances ((?ins First)) (eq ?ins:DishType Vegan) ))
 		              (bind ?first (random-slot ?li))
                              (send ?x put-FirstDish ?first)
  ) 
  (if (eq ?v no) then
                              (bind ?li (find-all-instances ((?ins First)) TRUE ))
 		              (bind ?first (random-slot ?li))
                              (send ?x put-FirstDish ?first)
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
