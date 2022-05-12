class Comment < ApplicationRecord
  belongs_to :article #Active Recordの関連付け（アソシエーション: association）を設定する

  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end
