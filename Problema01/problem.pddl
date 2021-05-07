(define (problem irPara_Shopping)
(:domain movimentacao)
    
    (:objects   
        carro
        joao
        casa 
        shopping 
    )

    (:init
        (at carro casa)
        (at joao casa)
        (agent joao)
        (vehicle carro)
    )
    
    (:goal
        (and
            (at carro shopping)
        )
    )
    ;(:metric minimize (total-cost))
)

