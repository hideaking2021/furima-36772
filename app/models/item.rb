class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Association
    belongs_to :user
    has_one_attached :image
    belongs_to :category
    belongs_to :condition
    belongs_to :fee
    belongs_to :area
    belongs_to :shopping_day

  # validation
  with_options presence: true do
    validates :name
    validates :description
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :area_id
    validates :shopping_day_id
  end

end
