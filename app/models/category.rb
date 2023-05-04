class Category < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :movements, dependent: :destroy
    validates :name, presence: true
    validates :icon, presence: true
end
