class Selector
  include Mongoid::Document
  extend Enumerize

  field :selector_type, type: String
  field :query, type: String, default: '*'

  enumerize :selector_type, in: [ :inclusion, :exclusion ],
    default: :inclusion, predicates: true
  enumerize :resource, in: [ :subjects, :classrooms, :instructors, :blocks ],
    default: :subjects

  embedded_in :restriction
  embedded_in :metric
end
