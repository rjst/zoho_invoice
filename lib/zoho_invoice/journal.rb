module ZohoInvoice
  class Journal < Base

    READ_ATTRIBUTES = [
      :journal_id,
      :journal_date,
      :entry_number,
      :line_items
    ]
    
    define_object_attrs(*READ_ATTRIBUTES)

    def self.all(client, options = {})
      retrieve(client, '/api/v3/journals', true, options)
    end

    def self.find(client, id, options={})
      retrieve(client, "/api/v3/journals/#{id}", false)
    end

  end
end
