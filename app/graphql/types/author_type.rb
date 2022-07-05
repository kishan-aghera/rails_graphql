class Types::AuthorType < Types::BaseObject
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :yob, Integer, null: true
  field :id, ID, null: false
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  field :full_name, String, null: true
end
