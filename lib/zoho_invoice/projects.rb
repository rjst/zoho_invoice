module ZohoInvoice
  class Project < Base

    READ_ATTRIBUTES = [
      :project_id,
      :project_name,
      :customer_id,
      :customer_name,
      :description,
      :status,
      :billing_type,
      :rate,
      :created_time,
      :has_attachment,
      :total_hours,
      :billable_hours
    ]

    has_many :users

    CREATE_UPDATE_ATTRIBUTES = READ_ATTRIBUTES - [:project_id]

    define_object_attrs(*READ_ATTRIBUTES)

    def self.all(client, options={})
      retrieve(client, '/api/v3/projects', true, options)
    end

    def self.find(client, id, options={})
      retrieve(client, "/api/v3/projects/#{id}", false)
    end

    def self.users(client, project_id, options={})
      User.in_project(client, project_id, options)
    end

  end
end
