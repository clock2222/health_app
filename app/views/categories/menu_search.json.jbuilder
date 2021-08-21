json.array! @childrens do |child|
  json.id child.id
  json.name child.name
end
json.array! @grandChilds do |gc|
  json.id gc.id
  json.name gc.name
  json.root gc.root_id
end
json.array! @parents do |parent|
  json.parent parent.parent_id
end
