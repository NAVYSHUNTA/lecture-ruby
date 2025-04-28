class Person
  # attr_writer :age

  # Java にはあったフィールド宣言が Ruby にはない
  # initialize メソッドは Java におけるコンストラクタに相当する
  # https://docs.ruby-lang.org/ja/latest/method/Object/i/initialize.html
  def initialize name, age
    # インスタンス変数は変数名が @ で始まる
    @name = name
    @age = age
  end

  def info
    @name + "," + @age.to_s
  end

  def set_age x
    @age = x
  end
end

p = Person.new "Shunta", 24
puts p.info # Shunta,24

p.set_age 100
puts p.info # Shunta,100

p.instance_variable_set(:@name, "Shun")
puts p.info # Shun,100