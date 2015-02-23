# GA Attendance Tracker

> Instructors need a way of tracking attendance per cohort and per student. This app allows easy tracking and viewing of the pertinent information.

#### User Story

##An Instructor
1. can log in
1. can enter a class name, etc.
1. can view all of his own classes
1. can click on these classes
1. can view all students within a class
1. can click on a student to show a student's attendance
1. can see a calendar view that lists absent students
1. can add in late / absent students
1. can search for a student
1. can search for a class

## A student
1. can log in
1. can see his late/excused/unexcused absences
1. can send a text to excuse hiself for an absence

## A Producer
1. can log in
1. can create a class
1. has multiple instructors / classes
1. can view the classes / attendances

## API and Gems used

* Twilio-Ruby Gem - to create new text messages in Twilio
* Puma Gem - to make the server run faster
* HTTParty Gem - to parse incoming information vie an API
* bcrypt Gem - secures passwords
* pry-rails Gem - enables pry in rails
* ffaker Gem - to create the seed file
* gon Gem - takes JavaScript and instantiates it in Ruby
* pony Gem - to write emails
* GA-API - to add cohorts, instructors, and students
* Twilio - API - to send and receive text messages

## Instructions to run the App

Clone the Repo and cd into it

  $ git clone git@github.com:godot-dabz/wdi_attendance.git
  $ cd wdi_attendance

  To run this App, a Twilio API key is required. [Click here](https://www.twilio.com/try-twilio) to create an account, register a phone number, and receive an SID and AUTH_TOKEN. This information is needed to run the twilio_controller.rb file.

  Now install the required Gems, rake db:setup, and start up your app in Terminal.

  $ bundle install
  $ rake db:setup
  $ rails s puma





