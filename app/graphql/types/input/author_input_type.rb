module Types
  module Input
    class AuthorInputType < Types::BaseInputObject
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :yob, Integer, required: false
    end
  end
end
