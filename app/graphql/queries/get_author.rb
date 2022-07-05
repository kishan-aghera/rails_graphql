module Queries
  class GetAuthor < Queries::BaseQuery
    type Types::AuthorType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Author.find(id)
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Author does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
