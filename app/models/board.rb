class Board < ApplicationRecord
    belongs_to :user
    acts_as_taggable 
    def self.ransackable_attributes(auth_object = nil)
        %w[title body created_at updated_at] 
    end


  def self.ransackable_associations(auth_object = nil)
    %w[user] 
  end

    
end
