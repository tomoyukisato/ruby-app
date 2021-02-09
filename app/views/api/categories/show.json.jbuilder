json.name @category.name
json.array do
  json.array! @category.products, :name, :id
end