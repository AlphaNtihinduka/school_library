require './person'
require './classroom'
require './student'
require './teacher'
require './book'
require './rental'

class App
    def initialize
        @persons = []
        @books = []
        @rentals = []
    end

    def books_list
        if @books.empty?
            puts 'The book Library has no books'
        else
            puts 'List of all books'
            @books.each {|book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    
        end
    end

    def people_list
        if @persons.empty?
            puts 'The book Library has no books'
        else
            puts 'List of all books'
            @persons.each {|person| puts "[#{person.class}], Name: #{person.name}, ID: #{person.id}} Age: #{person.age}"}
        end
    end

    def create_person
        puts "Do you what to create a sutdent(1) or a teacher(2)?"
        puts "1-student"
        puts "2-teacher"
        print "Enter your option: "
        person_category = gets.chomp.to_i
        case person_category
        when 1 then create_student
        when 2 then create_teacher
        end
    end

    def create_teacher
        print "Name: "
        name = gets.chomp
        print 'Age: '
        age = gets.chomp.to_i
        print 'Specialization: '
        specialization = gets.chomp
        @persons << Teacher.new(specialization, age, name)
        puts "Person created successfully\n"
    end

    def create_student
        print "Name: "
        name = gets.chomp
        print 'Age: '
        age = gets.chomp.to_i
        print 'Has parent permission?[Y/N]: '
        permission = gets[0]
        permission = (permission === ('Y' || 'y'))
        @persons << Student.new("classroom", age, name, parent_permission: permission)
        puts "Person created successfully\n"
    end

    def create_book
        puts "Create a book"
        print "Title: "
        title = gets.chomp
        print "Author: "
        author = gets.chomp
        @books << Book.new(title, author)
        puts "A book is created successfullly\n"
    end

    def create_rental
        puts 'Create rental'
        puts 'Select a book from the followint list by a number'
        @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"}
        book_number = gets.chomp.to_i
        puts 'Select a Person from the following list by number(not id)'
        @persons.each_with_index { |person, index| puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
        person_number = gets.chomp.to_i
        print 'Date(dd-mm-yy): '
        date = gets.chomp
        @rentals << Rental.new(date, @persons[person_number], @books[book_number])
        puts "Rental created successfully \n\n"
    end

    def list_rentals
        puts "List all rentals for a given person id"
        print "Enter ID of person: "
        person_id = gets.chomp.to_s
        puts "Rentals list"
        @rentals.each do |rental|
            if rental.person.id.to_s == person_id
            puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by: #{rental.person}"
            end
        end
    end
end