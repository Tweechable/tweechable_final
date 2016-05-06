class Lesson < ActiveRecord::Base
  validates :hash_tag, presence:true
  validates :t1, length: { maximum: 140 }
  validates :t2, length: { maximum: 140 }
  validates :t3, length: { maximum: 140 }
  validates :t4, length: { maximum: 140 }
  validates :t5, length: { maximum: 140 }
  validates :t6, length: { maximum: 140 }
  validates :t7, length: { maximum: 140 }
  validates :t8, length: { maximum: 140 }
  validates :t9, length: { maximum: 140 }
  validates :t10, length: { maximum: 140 }
end
