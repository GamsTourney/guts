class Medal < ApplicationRecord
  belongs_to :player

  enum variant: [:champion]
end
