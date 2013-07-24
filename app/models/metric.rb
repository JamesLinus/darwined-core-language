class Metric
  include Mongoid::Document
  extend Enumerize

  field :description, type: String, default: ''
  field :context, type: String
  field :mode, type: String
  field :group, type: Array
  field :mission, type: String
  field :measure, type: String

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

  enumerize :mission, in: [ :minimize, :maximize ],
    predicates: true, default: :minimize

  embeds_many :selectors
  accepts_nested_attributes_for :selectors
end
