class Marksheet
    def input 
        puts "Enter student name"
        check = false
        while !check do
            @name = gets
            if @name =~ /^-?[A-Za-z]+$/
                check = true
            else
                puts "Enter Name Correctly :"
            end
        end


        marks_hash = {@name => {"English" => {},
                                "Hindi" => {},
                                "Mathematics" => {},
                                "Science" => {},
                                "Social Science" => {}
                                },
                                "final_result" => {} 
                        }     
            

        marks_hash[@name].collect {|subject, details|
        check = false      
        puts "Enter marks in "+subject          
        while !check do
            mark = gets
            if mark =~ /^-?[0-9]+$/
                check = true
            else
                puts "Enter Numbers Only :"
            end            
        end
        mark = mark.to_i
            if mark < 33
                marks_hash[@name][subject] = {"marks" => mark, "remarks" => "FAIL"}
            elsif mark >= 75
                marks_hash[@name][subject] = {"marks" => mark, "remarks" => "DISTINCTION"}
            else
                marks_hash[@name][subject] = {"marks" => mark, "remarks" => ""}
            end
        }

        calculate marks_hash
    end

    def calculate (marks_hash)
        @total = 0;
        @remarks = "PASS"        

        marks_hash[@name].each do |subject, details|
            @total = @total+details["marks"]
            if details["remarks"] == "FAIL"
            @remarks = details["remarks"] 
            end
        end

        @percentage = ((@total.to_f/500) * 100).round(2)
        printing marks_hash
    end




    def printing (marks_hash)
        
        puts "-------------------------------------------REPORT CARD-------------------------------------------"
        puts "NAME : "+@name.upcase.center(30," ")
        marks_hash[@name].each do |subject, details|
            print "|   "+subject.ljust(30," ").upcase
            details.each do |key, value|
                print "|" + value.to_s.center(30)
            end
            puts "|"
        end


        marks_hash[@name]["final_result"] = {"total" => @total, "percentage" => @percentage, "remarks" => @remarks}


        puts
        marks_hash[@name]["final_result"].each do |key, value|
            print "|"+key.center(30," ").upcase
        end
        puts "|"
        marks_hash[@name]["final_result"].each do |key, value|
            print "|"+value.to_s.center(30," ")
        end
        puts "|"
    end
end

marksheet1 = Marksheet.new
marksheet1.input


