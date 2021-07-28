json.extract! ticket, :id, :opened_by, :attendant, :type, :status, :title, :content, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
