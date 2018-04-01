# Politizar

Web app built using Rails where Brazilian voters can subscribe to weekly emails with updates regarding what their state representatives have done during that week. Includes information such as votes, absences, projects, and news. Hoping to get it out in the wild before the presidential elections this year.

## Ruby and Rails versions

This project uses Ruby version 2.5.0 and Rails version version 5.1.5.

## System dependencies

## Configuration

## Database creation/initialization

```
rails db:migrate
rails db:seed
rake data:fetch_brazilian_senators
```

Next, go to the console and create a super admin user:

```
Admin.create(email: email, password: password, password_confirmation: password_confirmation, super_admin: true)
```

## Tests:

To run the test suite:

```
bundle exec rspec

# Run only model specs
bundle exec rspec spec/models

# Run only specs for AccountsController
bundle exec rspec spec/controllers/accounts_controller_spec.rb

# Run only spec on line 8 of AccountsController
bundle exec rspec spec/controllers/accounts_controller_spec.rb:8
```

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions

Planning to host the project on [AWS](https://hackernoon.com/how-to-setup-and-deploy-a-rails-5-app-on-aws-beanstalk-with-postgresql-redis-and-more-88a38355f1ea).

## Remaining tasks

The tasks listed here are in no specific order.

### Near term

- [x] Ability to unsubscribe
- [x] Seed database with country, region, and institution data
- [ ] Design and implement UI
- [ ] Design and implement emails styling
- [ ] Add ability to subscribe and unsubscribe from emails
- [ ] Choose mailing option
- [ ] Add [reCAPTCHA](https://github.com/ambethia/recaptcha) to subscribe form
- [ ] Have a plan in place for when calls to retrieve data fail
- [x] Add [Sentry](https://sentry.io/welcome/) for error logging
- [x] Add [Google Analytics](https://www.google.com/analytics/) tracking

### Down the line

- [ ] Move analytics suite to use [Segment](https://segment.com/) and a more robust analytics platform
- [ ] Add model relationships to automated tests
- [ ] Create admin interface
- [ ] Retrieve news for representatives and display in weekly email
- [ ] Add support for different countries
