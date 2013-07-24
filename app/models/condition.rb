class Condition
  include Mongoid::Document
  recursively_embeds_many

  field :expression, type: String
  field :operation, type: String

  embedded_in :restriction
end
