class Restriction
  include Mongoid::Document
  extend Enumerize

  field :description, type: String, default: ''
  field :context, type: String
  field :group, type: Array
  field :mode, type: String
  field :pairing_condition, type: String
  field :mission, type: String

  # Context of evaluation
  enumerize :context, in: [ :event, :session, :section, :assignation ],
    predicates: true, default: :event

  # Group specifies how the evaluator will group the collection
  enumerize :group,
    in: [ :interval, :day, :module,
          :subject, :format,
          :instructor, :classroom,
          :session, :section ],
    multiple: true

  enumerize :mode, in: [ :simple, :collection, :combinatorial ],
    predicates: true, default: :simple

  enumerize :mission, in: [ :accomplish, :attempt ],
    predicates: true, default: :accomplish

  embeds_many :selectors
  embeds_one :condition
  accepts_nested_attributes_for :selectors, :condition
end
