class Brewery < ApplicationRecord

    validates :name, :location, presence: true
    validates :name, uniqueness: true
end
