# Politizar

Web app built using Rails where Brazilian voters can subscribe to weekly emails with updates regarding what their state representatives have done during that week. Includes information such as votes, absences, projects, and news. Hoping to get it out in the wild before the presidential elections this year.

## Ruby and Rails versions

This project uses Ruby version 2.5.0 and Rails version version 5.1.5.

## System dependencies

## Configuration

## Database creation

## Database initialization

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

## Remaining tasks

The tasks listed here are in no specific order.

### Near term

- [x] Ability to unsubscribe
- [ ] Add model relationships to automated tests
- [ ] Create admin interface
- [ ] Design UI
- [ ] Implement UI
- [ ] Design emails styling
- [ ] Implement emails styling
- [ ] Add subscriptions
- [ ] Choose mailing option

### Down the line

- [ ] Retrieve news for representatives and display in weekly email
- [ ] Add support for different countries
