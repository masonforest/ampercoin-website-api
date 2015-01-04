class RenameAccountsToPreorderedAccounts < ActiveRecord::Migration
  def change
    rename_table :accounts, :preordered_accounts
    rename_column :orders, :account_id, :preordered_account_id
  end
end
