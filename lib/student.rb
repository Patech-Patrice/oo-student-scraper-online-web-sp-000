class Student
  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []
  
   def initialize(student_hash)	
    student_hash.each do |key, value| # mass assign attributes from hash
      self.send("#{key}=", value)
    end
    @@all << self  # saves new Student instances to @@all array
    end	

   def self.create_from_collection(students_array)	  
    students_array.each do |hash| # iterate through students array and instance Students
      self.new(hash)
    end
  end	  

   def add_student_attributes(attributes_hash)	  
      attributes_hash.each do |key, value| # allow Student object to iterate over a hash of new attributes
        self.send("#{key}=", value)
      end
    end	
  
   def self.all	
    @@all
  end	
end	