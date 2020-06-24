module ZohoInvoice
  class TimeEntry < Base

    READ_ATTRIBUTES = [
      :time_entry_id,
      :project_id,
      :project_name,
      :customer_id,
      :customer_name,
      :task_id,
      :task_name,
      :user_id,
      :is_current_user,
      :user_name,
      :log_date,
      :begin_time,
      :end_time,
      :log_time,
      :is_billable,
      :billed_status,
      :invoice_id,
      :notes,
      :timer_started_at,
      :timer_duration_in_minutes,
      :created_time
    ]

    CREATE_UPDATE_ATTRIBUTES = READ_ATTRIBUTES - [:time_entry_id]

    define_object_attrs(*READ_ATTRIBUTES)

    def self.all(client, options = {})
      retrieve(client, '/api/v3/projects/timeentries', true, options)
    end

    def self.find(client, id, options={})
      retrieve(client, "/api/v3/projects/timeentries/#{id}", false)
    end

  end
end
