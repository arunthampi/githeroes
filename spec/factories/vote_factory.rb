Factory.define(:vote) do |v|
  v.votee_id   { Factory(:hero).id }
  v.voter_id   { Factory(:hero).id }
end