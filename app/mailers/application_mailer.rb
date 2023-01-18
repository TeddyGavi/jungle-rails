class ApplicationMailer < ActionMailer::Base
  # can add default to here, but if you use layout 'mailer' it will point rails to layouts/*mailer.html.erb etc
# layout 'mailer
default from: 'no-reply@jungle.com'
layout 'mailer'
end

