class GenerateDate

  def self.generate_date
    Time.now.strftime("%d%m%y")
  end
end
