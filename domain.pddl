(define (domain autonomous_bt)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

; ---------TYPES------------
;(:types)

; -------CONSTANTS----------
; (:constants)

; ------PREDICATES----------
(:predicates ;todo: define predicates here
    (vehicle ?vt)
    (soldier ?sd)
    (mobile ?thing)
    (at ?thing ?location)
    (driving ?sd ?vt)
)

; -------FUNCTIONS----------
;(:functions)

; --------ACTIONS-----------
;Embarca um soldado no vaiculo
(:action Embarcar
    :parameters (?soldier ?vehicle ?place)
    :precondition 
    (and 
        (soldier ?soldier) ;Tem soldado
        (vehicle ?vehicle) ;Tem veiculo
        (at ?vehicle ?place) ;Veiculo esta no local
        (at ?soldier ?place) ;Soldado esta no logal
        (not (mobile ?vehicle)) ;Veiculo não pode se mover
    )
    :effect ;Se as pré-condições estão ok vai causar que
    (and 
        (driving ?soldier ?vehicle) ;O soldado esta dirigindo
        (mobile ?vehicle) ;Veiculo pode se mover
        (not (at ?soldier ?place)) ;Soldado não esta no local
        (not (mobile ?soldier))  ;Soldado não pode se mover
    )
)

;Desloca um veiculo a uma posição
(:action DeslocarPara
    :parameters (?thing ?from ?to)
    :precondition 
    (and 
        (at ?thing ?from) ;Algo esta no lugar de saida
        (mobile ?thing) ;Algo pode se mover
        (not (= ?from ?to)) ;A saida é diferente da chegada    
    )
    :effect 
    (and 
        (at ?thing ?to) ;Algo esta na chegada
        (not (at ?thing ?from)) ;Algo não esta mais na saida
    ) 
)

)