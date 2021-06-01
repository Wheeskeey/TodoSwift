import Foundation

var remoteTodos: [[String : Any]] = [["id": 1, "title": "delectus aut autem", "completed": 0],
                                     ["id": 2, "title": "quis ut nam facilis et officia qui", "completed": 0],
                                     ["id": 3, "title": "fugiat veniam minus", "completed": 1],
                                     ["id": 4, "title": "et porro tempora", "completed": 1],
                                     ["id": 5, "title": "laboriosam mollitia et enim quasi adipisci quia provident illum", "completed": 0],
                                     ["id": 6, "title": "qui ullam ratione quibusdam voluptatem quia omnis", "completed": 0],
                                     ["id": 7, "title": "illo expedita consequatur quia in", "completed": 0],
                                     ["id": 8, "title": "quo adipisci enim quam ut ab", "completed": 1],
                                     ["id": 9, "title": "molestiae perspiciatis ipsa", "completed": 0],
                                     ["id": 10, "title": "illo est ratione doloremque quia maiores aut", "completed": 1]]
var idCount = remoteTodos.count

class TodoViewController {
    
    let todoController = TodoController()
    var newTodoTitle: String?
    var isChecked: Int = 0 // By default when creating a new TODO - checkbox is unchecked
    
    //funkcja imitujaca interfejs zwracania textu z textfield
    func fillImaginaryTextField(with text: String?) {
        if (text != nil) {
            newTodoTitle = text
        } else {
            print("No title specified") // Imaginary alert
        }
    }
    
    //funkcja imitujaca interfejs przelaczenia checkbox
    func toggleImaginaryCheckbox() {
        if isChecked == 1 {
            isChecked = 0
        } else {
            isChecked = 1
        }
    }
    
    //funkcja imitujaca przycisniecie przycisku AddNewToDo
    func imaginaryButtonActionAddNewToDo() {
        todoController.addNew(newTodoTitle!, isChecked)
        newTodoTitle = "" // Imaginary ui text field clearing
    }
    
    //funkcja imitujaca przycisniecie przycisku RemoveTodo dla obiektu z id
    func imaginaryButtonActionRemoveTodo(with id: Int) {
        todoController.remove(with: id)
    }
    
    //funkcja imitujaca przelaczenie checkbox dla obiektu z id
    func imaginaryButtonActionToggleTodo(with id: Int) {
        todoController.toggleCompletion(with: id)
    }
    
    // Imaginary todo view
    func imaginaryVStack() {
        todoController.viewAllTodos()
    }
}

class TodoController {
    func addNew(_ title: String, _ isCompleted: Int) {
        idCount += 1
        remoteTodos.append(["id" : idCount, "title" : title, "completed" : isCompleted])
    }

    func remove(with id: Int) {
        var i1 = (0...(remoteTodos.count - 1)).makeIterator()
        while let i1 = i1.next() {
            if (id == remoteTodos[i1]["id"] as! Int) {
                remoteTodos.remove(at: i1)
                return
            }
        }
        print("TODO with specified ID wasn't found")
    }

    func toggleCompletion(with id: Int) {
        var i1 = (0...(remoteTodos.count - 1)).makeIterator()
        while let i1 = i1.next() {
            if (id == remoteTodos[i1]["id"] as! Int) {
                if (remoteTodos[i1]["completed"] as! Int == 1) {
                    remoteTodos[i1]["completed"] = 0
                } else {
                    remoteTodos[i1]["completed"] = 1
                }
                return
            }
        }
        print("TODO with specified ID wasn't found")
    }
    
    func viewAllTodos() {
        var i1 = (0...(remoteTodos.count - 1)).makeIterator()
        while let i1 = i1.next() {
            print("ID: \(remoteTodos[i1]["id"] as! Int) |", "Title: \(remoteTodos[i1]["title"] as! String) |", "~~Imaginary checkbox~~: \(remoteTodos[i1]["completed"] as! Int)")
        }
    }
}

// Imaginary user input
let todoViewController = TodoViewController()

todoViewController.imaginaryVStack() // Showing already present tasks at the view load

print("\n~~~~~~~~~~~~~~~~~~~~\n") // for readability in debug console

todoViewController.fillImaginaryTextField(with: "Apply for a job") // User enters new title into the text field
todoViewController.imaginaryButtonActionAddNewToDo() // User taps "Add" button
todoViewController.imaginaryVStack() // Refresh view

print("\n~~~~~~~~~~~~~~~~~~~~\n")

todoViewController.imaginaryButtonActionToggleTodo(with: 6) // User taps on the checkbox within todo
todoViewController.imaginaryVStack()

print("\n~~~~~~~~~~~~~~~~~~~~\n")

todoViewController.imaginaryButtonActionRemoveTodo(with: 3) // User wasn't happy with that todo so he decided to remove it
todoViewController.imaginaryVStack()

print("\n~~~~~~~~~~~~~~~~~~~~\n")

todoViewController.fillImaginaryTextField(with: "Take a break after a long night trying to figure out this assignment")
todoViewController.toggleImaginaryCheckbox() // User taps on the checkbox next to a textfield to add it already completed
todoViewController.imaginaryButtonActionAddNewToDo()
todoViewController.imaginaryVStack()
