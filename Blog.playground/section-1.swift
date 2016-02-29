import Foundation

let tipos = ["tecnologia", "memes", "vídeos de gatos"]

class BlogPost {
    var tipo : String
    var visualizacoes: Int?
    var autor : String
    var email : String
    var ordem : Int = 0
    
    init(autor: String, email: String) {
        self.tipo = ""
        self.visualizacoes = nil
        self.autor = autor
        self.email = email
    }
    
    func mensagem() -> String {
        if visualizacoes == nil {
            return "Ninguém viu seu post ainda. Que pena."
        } else {
            return "\(autor) tem \(visualizacoes!) visualizações neste post"
        }
    }
}

struct Autor {
    var nome : String
    var email: String
}

let autores : Dictionary<String, String> = [
    "Alexandre Marcondes" : "alexandre.marcondes+swift.topcoder@gmail.com",
    "Paulo Coelho" : "p.coelho@gmail.com",
    "Bernard Cornwell" : "b.cornwell@gmail.com",
    "H. P. Lovecraft" : "cthulhu@gmail.com",
    "Tim LaHaye" : "lahaye@gmail.com"
]

func autorAleatorio() -> (String, String) {
    let rndAutor = Int(arc4random_uniform(5))
    let autor = autores.keys.array[rndAutor]
    let email = autores[autor]
    
    return (autor, email!)
}

var blogPosts = [BlogPost]()

for ordemDosPosts in 1...10 {
    let tupla = autorAleatorio()
    let rndTipo = Int(arc4random_uniform(3))
    let tipo = tipos[rndTipo]
    
    var blogPost : BlogPost = BlogPost(autor: tupla.0, email: tupla.1)
    blogPost.ordem = ordemDosPosts
    blogPost.tipo = tipo
    
    blogPosts.append(blogPost)
}

let visualizacoes : [Int] = [10, 20, 30, 40, 50]

func visualizacoesAleatorias(tipo: String) -> Int? {
    if tipo == "vídeos de gatos" {
        return nil
    }
    
    var rndVisualizacoes = Int(arc4random_uniform(5))

    switch  visualizacoes[rndVisualizacoes] {
    case 10:
        return nil
    case 20, 30:
        return 0
    default:
        return rndVisualizacoes
    }
}

for post in blogPosts {
    post.visualizacoes = visualizacoesAleatorias(post.tipo)
    println(post.mensagem())
}

struct Pilha<T> {
    var itens = [T]()
    
    mutating func empilhar(item:T) {
        itens.append(item)
    }
    
    mutating func retirar() -> T {
        return itens.removeLast()
    }
    
    func count() -> Int {
        return itens.count
    }
}

var blogs = Pilha<BlogPost>()

for post in blogPosts {
    blogs.empilhar(post)
}

println(blogs.count())

for item in 1...blogs.count() {
    var post = blogs.retirar()
    println(post.mensagem())
    println(blogs.count())
}
