module ConnectionHelper
  def self.source_database_connection
    @source_database_connection ||= PG::Connection.new(:dbname => "logical_test").tap do |c|
      c.set_notice_receiver { |r| nil }
    end
  end

  def self.target_database_connection
    @target_database_connection ||= PG::Connection.new(:dbname => "logical_test_target").tap do |c|
      c.set_notice_receiver { |r| nil }
    end
  end

  def self.with_each_connection
    [source_database_connection, target_database_connection].each do |conn|
      yield conn
    end
  end
end
