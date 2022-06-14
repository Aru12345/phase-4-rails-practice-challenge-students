class StudentSerializer < ActiveModel::Serializer
  attributes :id

  has_one :instructor
end
