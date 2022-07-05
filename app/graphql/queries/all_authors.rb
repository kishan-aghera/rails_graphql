module Queries
  class AllAuthors < Queries::BaseQuery
    type [Types::AuthorType], null: false

    def resolve
      Author.all
    end
  end
end
