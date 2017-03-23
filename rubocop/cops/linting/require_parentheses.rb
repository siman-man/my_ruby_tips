def day_is?(param)
  p param
end

month = :jan

day_is? :tuesday && month == :jan
day_is?(:tuesday) && month == :jan
