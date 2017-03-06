class Array
  def flat_at(index, level = nil)
    insert(index, *[delete_at(index)].flatten(level))
  end
end

p [[1,2],[3,4],[5,6]].flat_at(1) #=> [[1, 2], 3, 4, [5, 6]]
