# require "tty-prompt"
# require "pry"

PROMPT = TTY::Prompt.new

def start_tty_loop
    puts "Welcome to the Baltimore City Art Portal!"	
    exit = false
    while !exit
        response = do_what
        n_response = to_do(response)
        new_response = next_do(n_response)
        this = next_do(new_response)
        that = next_do(this)
        here = next_do(that)
        there = next_do(here)
        end
    end 
    

def do_what
    menu_top = PROMPT.select("What would you like to do?") do |menu|
        menu.choice "Create Record"
        menu.choice "Update Record"
        menu.choice "Destroy Record"
        menu.choice "Retrieve Record"
        menu.choice "Exit"
    end
end

def to_do(option)
    if option == "Create Record"
        create
    elsif option ==  "Update Record"
        update
    elsif option == "Destroy Record"
        delete
    elsif option == "Retrieve Record"
        retrieve
    else option == "Exit"
        exit 
    end 
end

def create
    new_response = PROMPT.select("What records would you like to create?") do |menu|
        menu.choice "Create a new exhibit"
        menu.choice "Purchase a new work"
    end
end 

def update
    PROMPT.select("What records would you like to update?") do |menu|
        menu.choice "The date of death for an artist"
        menu.choice "The value of a work"
    end
end 

# def update_do(option)


def delete 
    PROMPT.select("What records would you like to remove?") do |menu|
        menu.choice "Destroy Forgery"
        menu.choice "Sell work"
    end 
end 

def retrieve
    PROMPT.select("What records would you like to retrieve?") do |menu|
        menu.choice "The names of the artists represented in Baltimore's collection"
        menu.choice "The most valuable work in Baltimore's collection"
        menu.choice "Check at which museums an artist has been featured"
        menu.choice "All works created within a specified period"
        menu.choice "Check if an artist has been featured in an exhibit in the database"
        menu.choice "Select a random work to feature" 
    end 
end

def next_do(new_variable)
    if new_variable == "Create a new exhibit"
        create_record
    elsif new_variable == "Purchase a new work"
        create_new_work
    elsif new_variable == "The date of death for an artist"
        update_dod
    elsif new_variable == "The value of a work"
        update_value
    elsif new_variable == "Destroy Forgery" 
        forgery_destroy
    elsif new_variable == "Sell work"
        forgery_destroy
    elsif new_variable == "The names of the artists represented in Baltimore's collection"
        all_artists
    elsif new_variable ==  "The most valuable work in Baltimore's collection"
        most_valuable
    elsif new_variable ==  "Check at which museums an artist has been featured"
        exhibit_by_artist_museum 
    elsif new_variable ==  "All works created within a specified period"
        work_by_period
    elsif new_variable ==  "Check if an artist has been featured in an exhibit in the database"
            exhibit_by_artist
    else new_variable == "Select a random work to feature" 
        randomly_select
    end 
end 

def create_loop 
    response =PROMPT.ask("Would you like to create a new record?")
        if response == "y" || response == "yes" || response == "please"
            create
        else  
            exit
    end  
end

def create_record
    PROMPT.say("Baltimore owns works by the following artists:")
    Artist.puts_names 
    artist = PROMPT.ask("What artist would you like to feature?")
        if Artist.names.include?(artist) 
            PROMPT.say("Baltimore is #blessed with the following museums:")
            Museum.all_museums 
            museum = PROMPT.ask("At what museum should the exhibit take place?")
            start_date_new = PROMPT.ask("When would you like the exhibit to being? YYYY-DD-MM")
            end_date_new = PROMPT.ask("When would you like the exhibit to end? YYYY-DD-MM")
            Exhibit.create_new(artist, museum, start_date_new, end_date_new)
            PROMPT.say("New exhibit planned:")
            Exhibit.puts_newest
                create_loop
        else    
            PROMPT.say("This artist does not yet appear in our collection!")
            dob = PROMPT.ask("When was the artist born?") 
            dod = PROMPT.ask("When did this artist pass way?") 
            Artist.create_new(artist, dob, dod)
            PROMPT.say("New artist record:")
            Artist.puts_newest
            PROMPT.say("Now lets create an exhibit!")
                create_record     
    end 
end 

def create_new_work
    title_new = PROMPT.ask("What is the title of the work?")
    value_new = PROMPT.ask("What is the value of the work?")
    year_new = PROMPT.ask("In what year was the work created?")
    artist = PROMPT.ask("What is the name of the work's artist?")
        if Artist.names.include?(artist) 
            Work.create_new_work(title_new, value_new, year_new, artist)
            PROMPT.say("New work:")
            Work.puts_last 
                create_loop
        else PROMPT.say("This artist does not yet appear in our collection!")
            dob = PROMPT.ask("When was the artist born?")
            dod = PROMPT.ask("When did the artist pass away? If still alive, please enter nil.")
            Artist.create_new(artist, dob, dod)
            PROMPT.say("New artist record:")
            Artist.puts_newest
            PROMPT.say("Now lets add the work to the database!")
                create_new_work
    end  
end

def update_loop
    response = PROMPT.ask("Would you like to update a new record?")
        if response == "y" || response == "yes" || response == "please"
            update
        else 
            exit
    end  
end

def update_value
    PROMPT.say("The below works appear in Baltimore's collection:")
    Work.all_titles
    work = PROMPT.ask("Please provide the title of the work you would like to re-value?")
        if Work.titles.include?(work)
            new_value = PROMPT.ask("What is the new value?")
            work_to_update = Work.all.find_by_title(work)
            work_to_update.value = new_value
            work_to_update.save
            PROMPT.say("This record has been updated")
                update_loop
        else response = PROMPT.say("It looks like that work isn't in our collection? Would you like to add it?")
        if response == "y" || response == "yes" || response == "please"
            create_new_work
        else 
            update_loop
        end  
    end 
end 

def update_dod 
    PROMPT.say("The below artists appear in Baltimore's collection:")
    Artist.puts_names 
    new_artist = PROMPT.ask("Which artist would you like to update?")
    new_dod = PROMPT.ask("What is the artist's year of death?")
    passed = Artist.all.find_by_name(new_artist)
    passed.dod = new_dod
    passed.save 
    PROMPT.say("This record has been updated")
        update_loop
end 

def forgery_destroy
    PROMPT.say("The below works appear in Baltimore's collection:")
    Work.all_titles
    fake = PROMPT.ask("What is the title of the work you would like to sell or destroy?")
    fake_work = Work.all.find_by_title(fake)
    fake_work.destroy
    PROMPT.say("This work has been removed from the database.")
    response = PROMPT.ask("Would you like to remove a new record?")
        if response == "y" || response == "yes" || response == "please"
            delete
        else 
            exit
    end  
end 

def retrieve_loop 
    response = PROMPT.ask("Would you like to retrieve a new record?")
    if response == "y" || response == "yes" || response == "please"
        retrieve
    else 
        exit
    end  
end

def exhibit_by_artist
    PROMPT.say("The below artists appear in Baltimore's collection:")
    Artist.puts_names 
    artist_name = PROMPT.ask("What artist would you like to check if they have been featured in an exhibit in the database?")
        if Exhibit.all.find_by_artist_id(Artist.all.find_by_name(artist_name).id) == nil
            PROMPT.say("This artist has not been recently featured in an exhibit.")
                create_loop
        else PROMPT.say("This artist has been recently featured in an exhibit.")
                retrieve_loop
    end 
end

def exhibit_by_artist_museum 
    PROMPT.say("The below artists appear in Baltimore's collection:")
    Artist.puts_names 
    artist = PROMPT.ask("Which artist was featured in the exhibit?")
    artist_exhibit_museums(artist)
end 

def randomly_select
    PROMPT.say("Why not feature this treasure!")
        randomly_select_work
        retrieve_loop
end 

def all_artists
    Artist.puts_names
    retrieve_loop
end 

def work_by_period
    PROMPT.say("What period are you interested in learning about?")
    year = PROMPT.ask("Please provide a year to start our search!")
    PROMPT.say("Check out the below works in Baltimore you can see!")
    Work.by_period(year)
        retrieve_loop
end 

def artist_exhibit_museums(artist)
    if Exhibit.all.find_by_artist_id(Artist.all.find_by_name(artist).id) == nil
        PROMPT.say("This artist has not been recently featured in an exhibit.")
            create_loop
    else exhibits = Artist.all.find_by_name(artist).exhibits
        exhibits.each do |exhibit| 
        PROMPT.say("The artist was been featured in an exhibit at the following museum:")
        puts exhibit.museum.name
            retrieve_loop
        end  
    end 
end 

def most_valuable
    work = Work.most_valuable
    puts work.title 
    puts work.value 
    puts work.year 
    puts work.artist.name
    retrieve_loop
end 

def Artist.puts_names 
    puts Artist.names
end 

def Exhibit.all_end_date
    Exhibit.all.each {|exhibit| puts exhibit.end_date }
end 

def Exhibit.puts_newest 
    puts Exhibit.newest.artist.name 
    puts Exhibit.newest.museum.name 
    puts Exhibit.newest.start_date
    puts Exhibit.newest.end_date
end 

def Artist.puts_newest
    puts Artist.newest.name
    puts Artist.newest.dob
    puts Artist.newest.dod 
end 

def Artist.put_works(artist)
    works = Artist.works_by_artist(artist)
    works.each {|work| puts work.title}
end 

def Museum.all_museums 
    Museum.all.each {|museum| puts museum.name}
end 

def Work.all_titles 
    Work.all.each {|work| puts work.title}
end 

def randomly_select_work
    work = Work.randomly_select
    puts ""
    puts work.title
    puts work.value
    puts work.year
    puts work.artist.name
end 

def Work.puts_last
    work = Work.last
    puts work.title
    puts work.value
    puts work.year 
    puts work.artist.name 
end 