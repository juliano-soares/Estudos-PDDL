(define (domain movimentacao)

;remove requirements that are not needed
(:requirements :strips :fluents :negative-preconditions :equality)

; ---------TYPES------------
;(:types)

; -------CONSTANTS----------
; (:constants)

; ------PREDICATES----------
(:predicates ;todo: define predicates here
    (vehicle ?vehicle)
    (agent ?agent)
    (mobile ?thing)
    (at ?thing ?location)
    (driving ?agent ?vehicle)
)

; -------FUNCTIONS----------
;(:functions)

; --------ACTIONS-----------
;Embarca um agente no vaiculo
(:action Embarcar
    :parameters (?agent ?vehicle ?place)
    :precondition 
    (and 
        (agent ?agent) ;Tem agente
        (vehicle ?vehicle) ;Tem veiculo
        (at ?vehicle ?place) ;Veiculo esta no local
        (at ?agent ?place) ;agente esta no logal
        (not (mobile ?vehicle)) ;Veiculo não pode se mover
    )
    :effect ;Se as pré-condições estão ok vai causar que
    (and 
        (driving ?agent ?vehicle) ;O agente esta dirigindo
        (mobile ?vehicle) ;Veiculo pode se mover
        (not (at ?agent ?place)) ;agente não esta no local
        (not (mobile ?agent))  ;agente não pode se mover
    )
)

;Desloca um veiculo a uma posição
(:action Deslocar
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