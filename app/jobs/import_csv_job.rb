class ImportCsvJob < ApplicationJob
  queue_as :default

  def perform(file)
    ImportCsv.new(file).run
  end
end
