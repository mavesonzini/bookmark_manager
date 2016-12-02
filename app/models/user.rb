class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, String

  # def initialize(email, password)
  #   @email = email
  #   @password = password
  # end

end
