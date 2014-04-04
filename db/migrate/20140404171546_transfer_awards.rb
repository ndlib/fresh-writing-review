class TransferAwards < ActiveRecord::Migration
  class Essay < ActiveRecord::Base
  end

  class EssayAward < ActiveRecord::Base
  end

  def up
    Essay.all.each do |essay|
      if essay.essay_award_id
        EssayAward.create!(essay_id: essay.id, award_id: essay.essay_award_id, placement: essay.placement)
      end
    end
  end

  def down
  end
end
