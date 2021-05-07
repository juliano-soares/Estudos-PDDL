(define (domain movimentacao)

;remove requirements that are not needed
(:requirements :strips :fluents :typing :conditional-effects :negative-preconditions :equality)

; ---------TYPES------------
(:types
    agente localizacao veiculo - object
    homem mulher - agente
    carro onibus - veiculo
)

; -------CONSTANTS----------
; (:constants)

; ------PREDICATES----------
(:predicates ;todo: define predicates here
    (temVeiculo ?v - veiculo)
    (temAgente ?a - agente)
    (podeMover ?a - object)
    (estaNoLocal ?thing ?location)
)

; -------FUNCTIONS----------
;(:functions)

; --------ACTIONS-----------
;Embarca um agente no vaiculo
(:action Embarcar
    :parameters (?a - agente ?v - veiculo ?l - localizacao)
    :precondition 
    (and 
        (temAgente ?a) ;Tem agente
        (temVeiculo ?v) ;Tem veiculo
        (estaNoLocal ?v ?l) ;Veiculo esta no local
        (estaNoLocal ?a ?l) ;Agente esta no logal
    )
    :effect ;Se as pré-condições estão ok vai causar que
    (and 
        (podeMover ?v) ;Veiculo pode se mover
        (not (estaNoLocal ?a ?l)) ;agente não esta no local
        (not (podeMover ?a))  ;agente não pode se mover
    )
)

;Desloca um veiculo a uma posição
(:action DeslocarPara
    :parameters (?o - object ?from ?to - localizacao)
    :precondition 
    (and 
        (estaNoLocal ?o ?from) ;Algo esta no lugar de saida
        (podeMover ?o) ;Algo pode se mover
        (not (= ?from ?to)) ;A saida é diferente da chegada    
    )
    :effect (and 
        (estaNoLocal ?o ?to) ;Algo esta na chegada
        (not (estaNoLocal ?o ?from)) ;Algo não esta mais na saida
    ) 
)

;Desembarca o agente
;Embarca um agente no vaiculo
(:action Desembarcar
    :parameters (?a - agente ?v - veiculo)
    :precondition 
    (and 
        (podeMover ?v) ;Veiculo pode se mover
    )
    :effect (and 
        (not (podeMover ?v))
        (podeMover ?a) ;agente pode se mover
    )
)

)