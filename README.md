# Operator

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4901`](http://localhost:4901) from your browser.

# What you can do

This app demonstrates sending emails.  It uses hardcoded template strings.  Visit [`localhost:4901/emails`](http://localhost:4901/emails) to see a record of all emails that have been sent.

## Sending an Email

Click Send a new email.  `shipment_shipped` is a known email (ie, it has a template set up).  `rando_email` demonstrates what happens when an unknown email template or consumer action is encountered (tldr: it just raises an error).
Clicking Send will create a new record in the DB of this action and _will not send an actual email_.  The relevant line in `lib/mailer.ex:9` has been commented out because we don't have Mailgun credentials set up.  Replacing this with Mailchimp should be easy; 
all we do is hit their API with the rendered HTML of the email template.

## Previewing an Email

In the meantime, you can hit the `Preview` button for `shipment_shipped` to see what the email will look like.  Pretty basic.

## Localization

Append the `locale=de` query string to your preview url to see the email in German!  Ja!

Localization is performed using the `gettext` library.  See [`http://sevenseacat.net/2015/12/20/i18n-in-phoenix-apps.html`](http://sevenseacat.net/2015/12/20/i18n-in-phoenix-apps.html) for more info.  It uses the actual strings as localization keys, which means 
your templates are intelligible and the translation will fall back to the default string (here, English) in case a translation hasn't been provided.

To add a new translation, open the `priv/gettext/de/LC_MESSAGES/default.po` file and edit the `msgstr` attribute.  There is a Mix task that searches your templates for strings and adds them to this file under the `msgid` key, so we don't have to spend a lot of time
keeping things in sync.  It's nifty!


## TODO

* Rabbitmq consumer
* Other templates
* Interesting Business Logic.  How about "don't send emails between 12-8am"
