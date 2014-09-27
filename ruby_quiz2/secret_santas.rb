def obtain_participants_from_file
  santa_member = []
  File.open("family_emails.txt", 'r').each do |line|
    santa_member << line.split(" ")
  end

  return santa_member
end

def link_to_secret_santa participants
  full_list = participants.clone
  completed_list = []

  full_list.each do |participant|
    until participant[1] != participants[0][1]
      p participants.count
      participants = participants.shuffle
    end
    completed_list << participants.shift
  end

  return completed_list
end

participants = obtain_participants_from_file
# puts participants.sort_by {|person| person[1]}

full_list =  link_to_secret_santa participants.sort_by { rand }

participants.each_with_index do |secret_santa, index|
  print "#{secret_santa[0]} #{secret_santa[1]} has #{full_list[index][0]} #{full_list[index][1]} \n"
end
