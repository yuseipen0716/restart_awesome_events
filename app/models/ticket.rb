class Ticket < ApplicationRecord
  belongs_to :user, optional: true # optional: trueを記述すると、外部キーのnilを許容
  belongs_to :event

  validates :comment, length: { maximum: 30 }, allow_blank: true # commentは30文字以内、空文字やnilを許可
end
