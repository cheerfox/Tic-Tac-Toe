# An Tic Tac Toe Gmae
# Randomly pick for the computer

WIN_DATA = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

def draw_board(board_data)
  system 'clear'
  puts "     |     |     "
  puts "  #{board_data[1]}  |  #{board_data[2]}  |  #{board_data[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board_data[4]}  |  #{board_data[5]}  |  #{board_data[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board_data[7]}  |  #{board_data[8]}  |  #{board_data[9]}  "
  puts "     |     |     "
end 

def user_pick(board_data,user_have_chosen)
  begin
    puts "Choose a position from 1 to 9"
    pick = gets.chomp.to_i
  end until (1..9).include?(pick) && board_data[pick] == " " 
  board_data[pick] = 'O'
  user_have_chosen << pick

end

def computer_pick(board_data, computer_have_chosen)
  begin
    pick = (1..9).to_a.sample
  end until board_data[pick] == " "
  board_data[pick] = 'X'
  computer_have_chosen << pick
end

def whether_someone_wins?(board_data, user_have_chosen, computer_have_chosen)
  WIN_DATA.each do |win_data|
    if (win_data - user_have_chosen).empty?
      draw_board(board_data)
      puts "You Win!!"
      return true 
    end
    if (win_data - computer_have_chosen).empty?
      draw_board(board_data)
      puts "Computer Win!!"
      return true
    end
  end
  return false   
end

def is_tie?(board_data)
  if board_data.select {|e| e == ' '}.empty?
    draw_board(board_data)
    puts "It's tie!!"
    return true
  end
end

def play_game
  board_data = ['X',' ',' ',' ',' ',' ', ' ', ' ', ' ', ' ']
  user_have_chosen = []
  computer_have_chosen = []
  loop do
    draw_board(board_data)
    user_pick(board_data,user_have_chosen)
    break if whether_someone_wins?(board_data, user_have_chosen, computer_have_chosen) || is_tie?(board_data)
    computer_pick(board_data, computer_have_chosen)
    break if whether_someone_wins?(board_data, user_have_chosen, computer_have_chosen) || is_tie?(board_data)
  end
end

def play_again?
  puts " Start a new Game? Press 'Y' , Exit? Press 'N' "
  gets.chomp.downcase != 'n'
end

loop do
  play_game
  break unless play_again?
end 









