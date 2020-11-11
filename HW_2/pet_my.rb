class Hedgehog
  #Їжачок
  def initialize(name, nice, choice)
    @name = name
    @nice = nice
    @life = 4
    @angry = 0
    @sleep = false
    @eat = 0
    @wс = 0 
    @drink = 0
    @soiled = 0
    @play = 0
    @study = 0
    @playfull = 20
    @mood = 20
    puts "Привіт! Це #{@name} - #{@nice} їжачок, він хоче турботи та ласки, подбай про нього"
  end

  
  # Eating
  def eating 
    if @eat >= 6
      puts "#{@name} не хоче їсти. Пограйся з ним"
    else
      puts "#{@name} дуже голодна(ий), з'їсть навіть слона!"
      @eat = -1
      passed_time
    end
  end
  # Drinking
  def drinking 
    if @drink >= 7
      puts "#{@name} не хоче пити. Пограйся з нею(ним)"
    else
      puts "#{@name} дуже спраглий. Де вода-а-а-а?!"
      @drink = -1
      passed_time
    end
  end
  # WC
  def visit_wс
    if @wс >= 4
      puts "#{@name} не хоче в туалет."
    else
      puts "#{@name} дуже хоче в туалет, прям не може терпіти!"
      @wс = 0
      passed_time
    end
  end
  #Study
  def study_pet
    puts "#{@name} вчить нові команди"
    if @playfull >= 12
      @study += 1
    else
      @study += 3
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
    puts "Гра в перекотикульку"
    puts "Дай пас їжачку кулькою"
    puts "Їжачок готовий гратися та чекає тебе"
      if @playfull >= 11 || @mood >= 14 || @drink <= 6 || @angry <= 3
        puts "Їжачок #{@name} несе тобі м'ячик назад:)"
      else
        puts "Їжачок проколов м'ячик голками та не 
        хоче гратися. Game over("
      end
      passed_time
  end

  # Sleep
  def take_sleep 
    if @wс >= 6 || @eat >= 7
      puts "#{@name} ніяк не може заснути. Допоможи їй(йому)"
    else
      puts "#{@name} солодко заснула(в) та сопить уві сні:)"
      @sleep = 0
      2.times { passed_time }
    end
  end
  passed_time
  
  #Help       
  
  def help
    puts "Голод: #{@eat}"
    puts "Голод: #{@drink}"
    puts "Туалет: #{@wc}"
    puts "Еволюція: #{@study}"
    puts "Купання: #{@soiled}"
    puts "Гратися: #{@play}"
    puts "Життя: #{@life}"
  end
end  

private

def passed_time
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
    exit
  end
  
  #drink
  if @drink >= 11 
    puts "Увага! Їжачок дуже хоче пити!"
  end
  if @drink >= 15 
    die
    puts "Їжачок довіряв тобі, а ти його підвів((("
    exit
  end
  
  #life
  if life.zero?
    puts "Ти програв #{@name}"
    exit
  end  
end  


  puts "Введіть iм'я їжачка:"
  name = gets.chomp
  puts "Вибери дію: "
  choice = gets.chomp
  hedg = Hedgehog.new name, choice
  puts "1 - погодувати"
  puts "2 - попоїти"
  puts "3 - зводити в туалет"
  puts "4 - дресирувати"
  puts "5 - покупати"
  puts "6 - погратися"
  puts "7 - спати"
  puts "8 - exit"

  sw = 0

  while sw != 8
    sw = gets.chomp.strip
    case sw
    when 1
      hedg.eating
    when 2
      hedg.drinking 
    when 3
      hedg.visit_wс
    when 4
      hedg.study_pet
    when 5
      hedg.go_bath
    when 6
      hedg.play_game
    when 6
      hedg.take_sleep
    when 6
      hedg.exit 
    when 7
      puts "1 - погодувати"
      puts "2 - попоїти"
      puts "3 - зводити в туалет"
      puts "4 - дресирувати"
      puts "5 - покупати"
      puts "6 - погратися"
      puts "7 - спати"
      puts "8 - exit"
    end
  end 
end