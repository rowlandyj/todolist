module TasksImporter

  3.times {List.create(name: Faker::Name.name)}
  list_ids = List.pluck(:id)

  30.times {Task.create(item: Faker::Company.bs, list_id: list_ids.sample)}

end
