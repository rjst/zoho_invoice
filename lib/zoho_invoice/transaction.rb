module ZohoInvoice
  class Transaction < Base

    READ_ATTRIBUTES = [
      :categorized_transaction_id,
      :transaction_type,
      :transaction_id,
      :transaction_date,
      :transaction_type_formatted,
      :account_id,
      :customer_id,
      :payee,
      :description,
      :entry_number,
      :currency_id,
      :currency_code,
      :debit_or_credit,
      :offset_account_name,
      :reference_number,
      :debit_amount,
      :credit_amount
    ]

    define_object_attrs(*READ_ATTRIBUTES)

    def self.all(client, options = {})
      retrieve(client, '/api/v3/chartofaccounts/transactions', true, options)
    end
        
  end
end
