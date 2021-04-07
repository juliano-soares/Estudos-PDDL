(define (problem movimentacao)
(:domain autonomous_bt)
    
    (:objects   
        veiculoComando 
        sd_Rambo
        start 
        reuniao 
    )

    (:init
        (at veiculoComando start)
        (at sd_Rambo start)
        (soldier sd_Rambo)
        (vehicle veiculoComando)
    )
    
    (:goal
        (and
            (at veiculoComando reuniao)
        )
    )
    ;(:metric minimize (total-cost))
)

