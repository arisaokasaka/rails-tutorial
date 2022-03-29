class Comment < ApplicationRecord
  belongs_to :article #Active Recordの関連付け（アソシエーション: association）を設定する
end
