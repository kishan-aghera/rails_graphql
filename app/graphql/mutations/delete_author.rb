module Mutations
  class DeleteAuthor < Mutations::BaseMutation
    argument :id, ID, required: true
    field :id, ID, null: true

    def resolve(id:)
      begin
        author = Author.find(id)
        author.destroy
        {
          id: id
        }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
