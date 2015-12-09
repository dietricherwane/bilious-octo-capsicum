class Ahoy::Store < Ahoy::Stores::ActiveRecordStore
  # customize here
  def exclude?
    bot? || request.ip == "192.168.1.1"
  end

  Ahoy.cookie_domain = :all

  Ahoy.visit_duration = 30.minutes

  Ahoy.track_visits_immediately = true
end
