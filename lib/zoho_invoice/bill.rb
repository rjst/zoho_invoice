module ZohoInvoice
  class Bill < Base

    READ_ATTRIBUTES = [
      :bill_id,
      :bill_number,
      :description,
      :reference_number,
      :date,
      :due_date,
      :status,
      :account_name,
      :total,
      :balance,
      :customer_id,
      :customer_name,
      :vendor_id,
      :vendor_name,      
      :expense_id,
      :recurring_expense_id,
      :paid_through_account_id,
      :currency_id,
      :currency_code,
      :exchange_rate,
      :created_time,
      :last_modified_time,
      :has_attachment,
      :line_items
    ]
    
    #has_many :line_items # relation is disabled since hydration of nested hashes is broken in base.rb

    define_object_attrs(*READ_ATTRIBUTES)

    def self.all(client)
      retrieve(client, '/api/v3/bills')
    end

    def self.find(client, id, options={})
      retrieve(client, "/api/v3/bills/#{id}", false)
    end

  end
end
