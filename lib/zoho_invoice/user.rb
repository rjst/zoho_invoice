module ZohoInvoice
  class User < Base

    READ_ATTRIBUTES = [
      :user_id,
      :is_current_user,
      :user_name,
      :email,
      :user_role,
      :status,
      :rate,
      :budget_hours
    ]

    CREATE_UPDATE_ATTRIBUTES = READ_ATTRIBUTES - [:user_id]

    define_object_attrs(*READ_ATTRIBUTES)

    def self.all(client)
      retrieve(client, '/api/v3/users')
    end

    def self.find(client, id, options={})
      retrieve(client, "/api/v3/users/#{id}", false)
    end

    def self.in_project(client, project_id, options={})
      retrieve(client, "/api/v3/projects/#{project_id}/users", true, options)
    end

  end
end
