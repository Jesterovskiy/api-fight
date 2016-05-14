class YesNoFormatter
  # This registers the notifications this formatter supports, and tells
  # us that this was written against the RSpec 3.x formatter API.
  RSpec::Core::Formatters.register self, :yes_no

  def initialize(output)
    @output = output
  end

  def yes_no(notification)
    @output << 'example: ' << notification.example.description
  end
end
