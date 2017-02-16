class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters


  def full_name
  	"#{self.first_name} #{self.last_name}"
  end

  def list_roles
  	hash = {}
  	array = []
  	characters_array = self.characters
 
  	characters_array.each do |char|
  		hash[char.name] = char.show.name
  	end

  	hash.each do |char, show|
  		array << "#{char} - #{show}"
  	end
  	array
  end

end