class Plant < ApplicationRecord
  AREAS = ['Europe', 'America', 'Africa', 'Asia', 'Oceania']
  COLORS = ['Red', 'Blue', 'Green', 'Yellow', 'Orange', 'Violet', 'Purple']
  belongs_to :garden

  validates :name, presence: true, uniqueness: { scope: :garden_id }
  validates :image_url, :category, presence: true
  validates :area, presence: true, inclusion: { in: AREAS }
  validates :flower_color, presence: true, inclusion: { in: COLORS }
  validates :max_size, :lifetime, presence: true, numericality: { greater_than: 0 }
end
