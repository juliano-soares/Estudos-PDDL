(define (problem irPara_Shopping)
(:domain movimentacao)
    (:objects    
        Homem - agente
        Casa Shopping - localizacao
        Carro - veiculo
    )

    (:init
        (temAgente Homem)
        (temVeiculo Carro)
        (estaNoLocal Carro Casa)
        (estaNoLocal Homem Casa)
    )
    
    (:goal
        (and
            (estaNoLocal Homem Shopping)
        )
    )
)

