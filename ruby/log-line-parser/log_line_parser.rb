class LogLineParser
  LOG_REGEX = /\[(ERROR|WARNING|INFO)\]:(.*)$/

  attr_reader :message, :log_level

  def initialize(line)
    elements = LOG_REGEX.match(line)
    @log_level = elements.captures[0].downcase
    @message = elements.captures[1].strip
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
