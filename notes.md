Strongly consider your MVP, but track stretch goals
Mimimum Viable Product --> SHOULD AT LEAST BE YOUR PROJECT REQUIREMENTS
A minimum viable product (MVP) is a product with just enough features to satisfy early customers and provide feedback for future product development.

Stretch Goals
Pokemon API
Backflips
Frontflips

## Planning our app
1. Planning Question
  --> What are we building
  --> Who are we building it for
  --> What features do we need to have?

2. User Stories
3. Model Our Data
4. Think through views in the app

### Questions
1. What are we building?
  Pokemon tracker app
    user who tracks things in the Pokemon universe?
    trainers perspective, recording battles, Pokemon s/he captures

2. Who are we building it for?
  Pokemon enthusiasts to track objects they discover or encounter

3. What features do we need to have?
 See user stories 
 using some form of pokemon library api

### User Stories
As a _____
I want to ______
So that ______

As a user 
I want to record pokemon I (see in the show)
So that I can have a personal index of pokemon

As a user
I want to create teams
So that I can play with teammates

### Features
Pokemon
  create / edit / destroy

Item 
  ceate / edit / destroy

Trainer 
  ceate / edit / destroy 

Battle
  ceate / edit / destroy 


query pokemon api
potentials: 
1. https://github.com/danielRomero/pokedex
2. https://github.com/loomio/snorlax


## Modeling Our Data
User?

#### Trainer
name string
buddy_pokemon?
badges

team_id

#### Pokemon
name string
type string
pokedex int
level int
attack int
devense int
sp_attack int
sp_defense int
speed int

trainer_id
user_id int

#### Team
name

#### Item
name string
trainer_id integer
pokemon_id integer

#### Battle
name string

#### Moves
name string
type string

#### Main_Team

## Pages 
- Home / Landing page
- Trainers#Index
- Trainers#Show
- Trainers#New
- Trainers#Edit

- Pokemon#Index
- Pokemon#Show
- Pokemon#New
- Pokemon#Edit

- Item#Index
- Item#Show
- Item#New
- Item#Edit

Battle
Admin view? How do you handle that?


## Readme
Try to keep your readme updated 
https://gist.github.com/PurpleBooth/109311bb0361f32d87a2