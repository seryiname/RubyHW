class Hedgehog
  #Їжачок
  def initialize(name)
    @name = name
    @nice = nice
    @life = 4
    @angry = 0
    @sleep = 0
    @eat = 0
    @ws = 0 
    @drink = 0
    @soiled = 0
    @play = 0
    @study = 0
    @playfull = 20
    @mood = 20

    
    puts "Привіт! Це #{@name} - #{@nice} їжачок, він хоче турботи та ласки, подбай про нього"
  end
  # Sleep
  def take_sleep 
    if @ws >= 6 || @eat >= 7
      puts "#{@name} ніяк не може заснути. Допоможи їй(йому)"
    else
      puts "#{@name} солодко заснула(в) та сопить уві сні:)"
      @sleep = 0
      2.times { passed_time }
    end
  end
  # Eating
  def eating 
    if @eat >= 6
      puts "#{@name} не хоче їсти. Пограйся з нею(ним)"
    else
      puts "#{@name} дуже голодна(ий), з'їсть навіть слона!"
      @eat = -1
      passed_time
    end
  end
  # WC
  def visit_wc
    puts "#{@name} дуже хоче в туалет, прям не може терпіти!"
    @wc = 0
    passed_time
  end
  #Study
  def study_pet
  puts "#{@name} вчить нові команди"
  if @playfull >= 12
    @study += 1
    else
    @study += 3
    end
    passed_time
  end
  # Bath (clean)
  def go_bath
    puts "#{@name} потребує купання та турботи:)"
    if @soiled >= 4
        puts "Негайно відведи #{@name} в ванну"
      else
        puts "#{@name} - чистюля, цьом!"
    end
    passed_time
  end
  #Game
  def play_game 
    puts "Введи номер гри, в яку хочеш погратися з їжачком #{@name}"
    puts "1 - Гра в перекотикульку, 2 - Торкнися їжачка за животик так, 
    щоб не поколотися, 3 - Залиш їжачка в спокої та вийди з гри"
    game = gets.chomp.strip
    case game
    
    when '1'
      puts "Дай пас їжачку кулькою"
      puts "Їжачок готовий гратися та чекає тебе"
      if @playfull >= 11 || @mood >= 14 || @drink <= 6 || @angry <= 3
          puts "Дай пас їжачку"
          puts "Їжачок #{@name} несе тобі м'ячик назад:)"
        else
          puts "Їжачок проколов м'ячик голками та не 
          хоче гратися. Game over("
      end
    end
    passed_time

    when '2'
      puts "Торкнися їжачка за животик"
      puts "Їжачок готовий гратися та чекає тебе"
      if @playfull >= 10 || @mood >= 16 || @angry <= 3
          puts "Погладь їжачка за животик"
          puts "Їжачок #{@name} приліг на спинку та чекає ласки:)"
        else
          puts "Їжачок розсердився та вколов голкою палець... Game over("
        end
        break
      end
    end
    passed_time

    when '3'
      puts "Залиш їжачка в спокої та вийди з гри"
    end
    passed_time
  
  #Help       
  def help
    puts 'List of available commands:'
    puts '1 or help'
    puts '2 or status'
    puts '3 or sleep'
    puts '4 or eat'
    puts '5 or wc'
    puts '6 or drink'
    puts '7 or soiled'
    puts '8 or study'
    puts '9 or play'
    puts '10 or exit'
  end


  private

def passed_time
  #@age += 1
  @eat += 1
  @drink += 1
  @wc += 1
  @sleep += 1
  @mood -= 1
  @playfull -= 1

  
  #life

  #eat
  if @eat >= 11 
    puts "Увага! Нагодуй їжачка, він дуже голодний!"
  end
  if @eat >= 15 
    die
    puts "Їжачок довіряв тобі, а ти його підвів((("
  end

  #sleep 
  if @sleep >= 17
    @mood -= 2
    @playfull -= 5
    puts "Увага! їжачку негайно потрібен сон для відновлення сил"
  end

  #wc
  if @wc >= 9
    puts "Увага! Швидко відведи їжачка вдо туалету, врятуй його чистоту!"
  end
  if @wc >= 11
    puts "Увага! Їжачку потрібно трішки освіжитися.."
    @soiled += 3
  end

  #mood 
  if @mood <= 4
    puts "Підніми їжачку настрій, пограйся з ним"
  end

  #soiled
  if @soiled > 5
    puts "Увага! Їжачку потрібно терміново прияняти ванну"
  end
  if @soiled > 11
    die
    puts "Їжачок довіряв тобі, а ти його підвів((("
  end
  
  #drink
  if @drink >= 11 
    puts "Увага! Їжачок дуже хоче пити!"
  end
  if @drink >= 15 
    die
    puts "Їжачок довіряв тобі, а ти його підвів((("
  end
  
  #life
  if life.zero?
    puts "Ти програв #{@name}"
    exit

  end  
  # parameter limit
  @mood = 0 if @mood.negative?
  @mood = 10 if @mood > 10
end

#DIE
def die
  @life -= 1
  @mood = 20
  @eat = 0
  @drink = 0
  @sleep = 0
  @wc = 0
  @study = 0
  @soiled = 12
end

command = ''
until command == 'exit'
  puts '---------------------------------------------------'
  puts 'Please input command or type help:'
  command = gets.chomp.strip
  case command
  when 'help', '1'
    pet.help
  when 'status', '2'
    pet.status
  when 'feed', '3'
    pet.feed
  when 'sleep','4'
    pet.go_sleep
  when 'wc', '5'
    pet.go_wc
  when 'walk', '6'
    pet.walk_check
  when 'study', '7'
    pet.study
  when 'clean', '8'
    pet.clean_up
  when 'play', '9'
    pet.play
  when 'exit', '10'
    exit
  else
    puts "#{command} unknown command. To get list of commands type help"
  end
end






  











  




      







