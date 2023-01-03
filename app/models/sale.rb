class Sale < ApplicationRecord
  validates :name, :percent_off, :starts_on, :ends_on, presence: true

  before_destroy :is_active?, prepend: true
  # AR scope
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

  def finished?
    self.ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

  def is_active?
    if active?
    throw :abort
    end
  end

end
