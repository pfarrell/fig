Sequel.migration do
  change do
    create_table(:sites) do
      primary_key :id
      String :name
      String :url
      String :type
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
