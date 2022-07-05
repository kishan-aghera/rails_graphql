module Mutations
  class UpdateAuthor < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :params, Types::Input::AuthorInputType, required: true

    field :author, Types::AuthorType, null: false

    def resolve(id:, params:)
      author_params = Hash params

      begin
        author = Author.find(id)
        author.update(author_params)

        { author: author }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
