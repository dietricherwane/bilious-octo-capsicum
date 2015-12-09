class Ahoy::Store < Ahoy::Stores::ActiveRecordStore
  # customize here
  def exclude?
    bot? || request.ip == "192.168.1.1"
  end

  def track_visit(options, &block)
    visit =
      visit_model.new do |v|
        v.id = UUIDTools::UUID.parse_raw(ahoy.visit_id)
        v.visitor_id = UUIDTools::UUID.parse_raw(ahoy.visitor_id)
        v.user = user if v.respond_to?(:user=)
        v.started_at = options[:started_at]
      end

    set_visit_properties(visit)

    yield(visit) if block_given?

    begin
      visit.save!
      geocode(visit)
    rescue *unique_exception_classes
      # do nothing
    end
  end

  def track_event(name, properties, options, &block)
    event =
      event_model.new do |e|
        **e.id = UUIDTools::UUID.parse_raw(options[:id])
        e.visit_id = UUIDTools::UUID.parse_raw(ahoy.visit_id)**
        e.user = user if e.respond_to?(:user=)
        e.name = name
        e.properties = properties
        e.time = options[:time]
      end

    yield(event) if block_given?

    begin
      event.save!
    rescue *unique_exception_classes
      # do nothing
    end
  end

end

Ahoy.cookie_domain = :all

#Ahoy.visit_duration = 30.minutes

Ahoy.track_visits_immediately = true
