defmodule Operator.Mailer do
  require IEx

  use Mailgun.Client, domain: Application.get_env(:casper, :mailgun_domain),
                      key: Application.get_env(:casper, :mailgun_key)

  @from "Casper <noreply@casper.com>"

  def send_email recipient, subject, template, vars do
    # IEx.pry
    # send_email to: recipient,
      # from: @from,
      # subject: subject,
      # html: Phoenix.View.render_to_string(Operator.EmailView, template, vars: vars)
  end
end

