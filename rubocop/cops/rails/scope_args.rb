# bad
scope :something, where(something: true)

# good
scope :something, -> { where(something: true) }
