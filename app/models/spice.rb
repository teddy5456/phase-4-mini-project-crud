class Spice < ApplicationRecord
    validates_presence_of :title, :image, :description, :notes, :rating
  end
  