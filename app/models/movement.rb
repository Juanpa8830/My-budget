class Movement < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :categories, dependent: :destroy
    validates :name, presence: true, uniqueness: true
    validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
