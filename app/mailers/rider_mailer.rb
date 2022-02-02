class RiderMailer < ApplicationMailer
  def send_mail(user, attachment)
    attachments['rider_info.pdf'] = attachment
    mail(:to => user.email, :from => 'dipakgupta08testmail', :subject => "licence info")
  end
end
