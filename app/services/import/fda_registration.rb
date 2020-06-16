class Import::FdaRegistration < ApplicationService
  def self.call(filepath)
    Cecv.copy_from filepath
  end

end
