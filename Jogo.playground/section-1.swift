protocol Miravel {
    var vida: Int { get set }
    func tomarDano(dano: Int)
}

protocol Atiravel {
    func atirar(alvo: Miravel)
}

class Pistola: Atiravel {
    func atirar(alvo: Miravel) {
        alvo.tomarDano(1)
    }
}

class Rifle: Atiravel {
    func atirar(alvo: Miravel) {
        alvo.tomarDano(5)
    }
}

class Inimigo: Miravel {
    var vida: Int = 10
    
    func tomarDano(dano: Int) {
        vida -= dano
        println("o inimigo perdeu \(dano) pontos de vida")
        
        if vida <= 0 {
            println("o inimigo está morto agora")
        }
    }
}

class Jogador {
    var arma: Atiravel!
    
    init(arma: Atiravel) {
        self.arma = arma
    }
    
    func atirar(alvo: Miravel) {
        arma.atirar(alvo)
    }
}

var exterminador = Jogador(arma: Pistola())

var inimigo = Inimigo()

exterminador.atirar(inimigo)
exterminador.atirar(inimigo)
exterminador.atirar(inimigo)
exterminador.atirar(inimigo)
exterminador.atirar(inimigo)
inimigo.vida
exterminador.arma = Rifle()
exterminador.atirar(inimigo)
