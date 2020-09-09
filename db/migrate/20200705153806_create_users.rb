class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :uid, limit: 64, comment: '認証サービスが提供するユーザーID'
      t.string :email, limit: 250, comment: '認証サービスに登録しているメールアドレス'
      t.boolean :deleted, default: false, comment: 'true：削除済'
      t.timestamps
    end

    add_index :users, :uid, name: 'idx_users_01', unique: true
  end
end