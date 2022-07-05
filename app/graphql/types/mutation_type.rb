module Types
  class MutationType < Types::BaseObject
    field :add_author, mutation: Mutations::AddAuthor
    field :update_author, mutation: Mutations::UpdateAuthor
    field :delete_author, mutation: Mutations::DeleteAuthor
  end
end
