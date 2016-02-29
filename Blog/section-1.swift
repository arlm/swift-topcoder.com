import Foundation

// Challenge 10 – Bloginator (use Xcode6-Beta6)

/**
R1 – Create a constant array of String literals called “types” with the
values: technology, memes, cat videos
**/
// implement code for R1 below

let types = ["technology", "memes", "cat videos"]

/**
R2 – Create a BlogPost class with the following properties:

1. type – String, constant. A random value from the types
array. (Hint: you can use arc4random_uniform to randomly select a value.)
2. views – Optional Int. Set to nil.
3. author – String
4. email – String
5. order – Int. Set to zero.

Create an initializer to set the author’s name (the author property) and email property. Create a “teaser”
method that returns a String with the author’s name and number of views:
“Mike Smith has 5 views for this blog post”. If views are nil,
return “No one has read your blog post yet. Pity.”.
**/
// implement code for R2 below

class BlogPost {
    var type : String
    var views: Int?
    var author : String
    var email : String
    var order : Int = 0
    
    init(author: String, email: String) {
        self.type = ""
        self.views = nil
        self.author = author
        self.email = email
    }
    
    func teaser() -> String {
        if views == nil {
            return "No one has read your blog post yet. Pity."
        } else {
            return "\(author) has \(views!) views for this blog post"
        }
    }
}

/**
R3 – Create a “randomAuthor” function that returns a tuple. Then create
an “Author” struct with a “name” and “email” property. Add 5 Author structs
to a dictionary using the author’s name as the key. This function returns
a randomly selected name and email of an Author from the dictionary.
**/
// implement code for R3 below

struct Author {
    var name : String
    var email: String
}

let authors : Dictionary<String, String> = [
    "Alexandre Marcondes" : "alexandre.marcondes+swift.topcoder@gmail.com",
    "Paulo Coelho" : "p.coelho@gmail.com",
    "Bernard Cornwell" : "b.cornwell@gmail.com",
    "H. P. Lovecraft" : "cthulhu@gmail.com",
    "Tim LaHaye" : "lahaye@gmail.com"
]

func randomAuthor() -> (String, String) {
    let rndAuthor = Int(arc4random_uniform(5))
    let author = authors.keys.array[rndAuthor]
    let email = authors[author]
    
    return (author, email!)
}

/**
R4 – Create an array of 10 blog posts with a for loop. Set the “author”
property to the value returned from “randomAuthor” function and set
the “order” property to the value of the index of the for loop used to
populate this array.
**/
// implement code for R4 below

var blogPosts = [BlogPost]()

for postOrder in 1...10 {
    let tuple = randomAuthor()
    let rndType = Int(arc4random_uniform(3))
    let type = types[rndType]

    var blogPost : BlogPost = BlogPost(author: tuple.0, email: tuple.1)
    blogPost.order = postOrder
    blogPost.type = type
    
    blogPosts.append(blogPost)
}

/**
R5 – Create a “randomViews” function that accepts the “type” of blog post
for an input. Create an array literal of Ints (these are the possible view
counts) with the values: 10, 20, 30, 40, 50. Select a random value from
this possible view count array and create a switch that returns nil if
the views are 10, 0 if the views are either 20 or 30, else return the randomly
selected number of views. If the “type” passed to the function is
“cat videos” always return nil.
**/
// implement code for R5 below

let viewCounts : [Int] = [10, 20, 30, 40, 50]

func randomViews(type: String) -> Int? {
    if type == "cat videos" {
        return nil
    }
    
    var rndViewCount = Int(arc4random_uniform(5))
    var views : Int
    switch  viewCounts[rndViewCount] {
    case 10:
        return nil
    case 20, 30:
        return 0
    default:
        return rndViewCount
    }
}

/**
R6 – Iterate the array of blog posts, generate a value from “randomViews” function
for each one and set it to the blog post “views” property. Then println the
value of each post.teaser().
**/
// implement code for R6 below

for post in blogPosts {
    post.views = randomViews(post.type)
    println(post.teaser())
}

/**
R7 – Write a simple stack using a struct with Generics
that has three methods. It should push and pop BlogPosts and also
returns the current count of BlogPosts. Iterate the array of blog posts
and push each one onto the “blogs” stack. Println the count of items in
the stack. Use a for loop to iterate the “blogs” stack, pop the top one
off and println the blog’s teaser. Println the count of items in the stack.
**/
// implement code for R7 below

struct Stack<T> {
    var items = [T]()
    
    mutating func push(item:T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
    
    func count() -> Int {
        return items.count
    }
}

var blogs = Stack<BlogPost>()

for post in blogPosts {
    blogs.push(post)
}

println(blogs.count())

for item in 1...blogs.count() {
    var post = blogs.pop()
    println(post.teaser())
    println(blogs.count())
}
