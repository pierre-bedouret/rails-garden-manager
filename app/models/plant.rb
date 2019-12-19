class Plant < ApplicationRecord
  AREAS = ['Europe', 'America', 'Africa', 'Asia', 'Oceania']
  COLORS = ['Red', 'Blue', 'Green', 'Yellow', 'Orange', 'Violet', 'Purple']
  belongs_to :garden

  validates :name, presence: true, uniqueness: { scope: :garden_id }
  validates :image_url, presence: true
  validates :area, inclusion: { in: AREAS }
  validates :flower_color, inclusion: { in: COLORS }
  validates :max_size, numericality: { greater_than: 0 }
  validates :lifetime, numericality: { greater_than: 0 }
end
