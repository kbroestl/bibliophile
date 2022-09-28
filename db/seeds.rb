# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

languages = Language.create([
  {:name => 'unassigned'},
  {:name => 'Chinese'},
  {:name => 'Danish'},
  {:name => 'English'},
  {:name => 'French'},
  {:name => 'German'},
  {:name => 'Greek'},
  {:name => 'Italian'},
  {:name => 'Latin'},
  {:name => 'Russian'},
  {:name => 'Spanish'},
  {:name => 'Polish'},
  {:name => 'Swedish'},
  {:name => 'Japanese'},
  {:name => 'Swahili'},
  {:name => 'Hungarian'}
])


# VERY generic, general use locations. Think rooms of a house.
locations = Location.create([
  {:location => 'Office', :readable => 1},
  {:location => 'Bedroom', :readable => 1},
  {:location => 'Family Room', :readable => 1},
  {:location => 'Sold', :readable => 0}
])


# VERY generic, general use genres. Think Dewey Decimal level.
genres = Genre.create([
  {:genre => 'General Fiction', :readable => 1},
  {:genre => 'Science Fiction', :readable => 1},
  {:genre => 'Mystery', :readable => 1},
  {:genre => 'Reference', :readable => 0}
])