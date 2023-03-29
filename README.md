# README

## Getting Started

```bash

git clone git@github.com:bw7432/jurassic_park_api.git

rails db:create db:migrate

rails s

```

## run the tests for the validator

```bash
rspec spec/validators/can_assign_to_cage_validator_spec.rb
```

## api can be found at localhost/api/v1
## show all routes

```bash
rails routes
```

## did not get to:

- Cages cannot be powered off if they contain dinosaurs.
- Cages know how many dinosaurs are contained.

## concurrency
- Due to ruby's GIL, I don't see a real problem with this code as being non-thread safe. I'm not using workers here so there wouldn't be an issue of separate workers trying to assign a carnivore and an herbivore to the same cage at the same time, even then it be very unlikely.