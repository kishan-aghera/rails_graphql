module Mutations
  class AddAuthor < Mutations::BaseMutation
    argument :params, Types::Input::AuthorInputType, required: true

    field :author, Types::AuthorType, null: false

    def resolve(params:)
      author_params = Hash params

      begin
        author = Author.create!(author_params)

        { author: author }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
