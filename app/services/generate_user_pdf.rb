class GenerateUserPdf
  attr_reader :data

  def initialize(data)
    @data = data
  end
  
  def run
    pdf_html = ActionController::Base.new.render_to_string(template: 'layouts/rider_pdf', locals: { data: data })
    pdf = WickedPdf.new.pdf_from_string(pdf_html)
    save_path = Rails.root.join('public', data.user_name )
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
    RiderMailer.send_mail(data, pdf).deliver_now
  end
end

